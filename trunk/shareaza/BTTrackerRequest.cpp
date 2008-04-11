//
// BTTrackerRequest.cpp
//
// Copyright (c) Shareaza Development Team, 2002-2008.
// This file is part of SHAREAZA (shareaza.sourceforge.net)
//
// Shareaza is free software; you can redistribute it
// and/or modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2 of
// the License, or (at your option) any later version.
//
// Shareaza is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Shareaza; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//

#include "StdAfx.h"
#include "Shareaza.h"
#include "Settings.h"
#include "Network.h"
#include "BENode.h"
#include "BTClients.h"
#include "BTTrackerRequest.h"
#include "Transfers.h"
#include "Downloads.h"
#include "Download.h"
#include "SHA.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

BEGIN_MESSAGE_MAP(CBTTrackerRequest, CWinThread)
	//{{AFX_MSG_MAP(CBTTrackerRequest)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CBTTrackerRequest construction

CBTTrackerRequest::CBTTrackerRequest(CDownload* pDownload, LPCTSTR pszVerb, DWORD nNumWant, BOOL bProcess)
{
	ASSERT( pDownload != NULL );
	ASSERT( pDownload->IsTorrent() ); 
	
	m_bAutoDelete	= FALSE;
	m_pDownload		= pDownload;
	m_bProcess		= bProcess;
	
	CString strURL;
	// Create the basic URL
	strURL.Format( _T("%s?info_hash=%s&peer_id=%s&port=%i&uploaded=%I64i&downloaded=%I64i&left=%I64i&compact=1"),
		pDownload->m_pTorrent.m_sTracker,
		Escape( pDownload->m_oBTH ),
		Escape( m_pDownload->m_pPeerID ),
		Network.m_pHost.sin_port ? (int)htons( Network.m_pHost.sin_port ) : (int)Settings.Connection.InPort,
		pDownload->m_nTorrentUploaded,
		pDownload->m_nTorrentDownloaded,
		pDownload->GetVolumeRemaining() );
	
	// If an event was specified, add it.
	if ( pszVerb != NULL )
	{	
		// Valid events: started, completed, stopped
		strURL += _T("&event=");
		strURL += pszVerb;

		// If event is 'started' and the IP is valid, add it.
		if ( !_tcscmp( pszVerb, _T("started") ) && Network.m_pHost.sin_addr.s_addr != INADDR_ANY )
		{	
			// Note: Some trackers ignore this value and take the IP the request came from. (Usually the same)
			strURL += _T("&ip=");
			strURL += inet_ntoa( Network.m_pHost.sin_addr );
		}
	}

	// Add the # of peers to request
	CString strNumWant;
	strNumWant.Format( _T("&numwant=%i"), nNumWant );
	strURL += strNumWant;

	// If the TrackerKey is true and we have a valid key, then use it.
	if ( ( pDownload->m_sKey.GetLength() > 4 ) && ( Settings.BitTorrent.TrackerKey ) )
	{	
		ASSERT ( pDownload->m_sKey.GetLength() < 20 );		//Key too long

		strURL += _T("&key=");
		strURL += pDownload->m_sKey;
	}	
	
	m_pRequest.SetURL( strURL );
	m_pRequest.AddHeader( _T("Accept-Encoding"), _T("gzip") );

	// Set User Agent
	m_pRequest.SetUserAgent( Settings.SmartAgent() );

	theApp.Message( MSG_DEBUG, _T("[BT] Sending announce: %s"), strURL );

	if ( BTClients.Add( this ) )
	{
		CreateThread();
		SetThreadName( m_nThreadID, "BT Tracker Request" );
	}
}

CBTTrackerRequest::~CBTTrackerRequest()
{
	BTClients.Remove( this );
}

/////////////////////////////////////////////////////////////////////////////
// CBTTrackerRequest actions

void CBTTrackerRequest::SendStarted(CDownload* pDownload, DWORD nNumWant)
{
	// Return if there is no tracker
	if ( pDownload->m_pTorrent.m_sTracker.IsEmpty() )
		return;

	// Log the 'start' event
	theApp.Message( MSG_DEFAULT,
		_T("[BT] Sending initial tracker announce for %s"),
		pDownload->m_pTorrent.m_sName );

	// Record that the start request has been sent
	pDownload->m_bTorrentRequested = TRUE;
	pDownload->m_tTorrentSources = GetTickCount();
	pDownload->m_tTorrentTracker = pDownload->m_tTorrentSources;
	pDownload->m_tTorrentTracker += Settings.BitTorrent.DefaultTrackerPeriod;
	pDownload->m_nTorrentUploaded = 0ull;
	pDownload->m_nTorrentDownloaded = 0ull;

	// Create and run tracker request
	new CBTTrackerRequest( pDownload, _T("started"), nNumWant, TRUE );
}

void CBTTrackerRequest::SendUpdate(CDownload* pDownload, DWORD nNumWant)
{
	// Return if there is no tracker
	if ( pDownload->m_pTorrent.m_sTracker.IsEmpty() )
		return;

	// Log the 'update' event
	theApp.Message( MSG_DEFAULT,
		_T("[BT] Sending update tracker announce for %s"),
		pDownload->m_pTorrent.m_sName );

	// Record that an update has been sent
	pDownload->m_tTorrentSources = GetTickCount();
	pDownload->m_tTorrentTracker = pDownload->m_tTorrentSources;
	pDownload->m_tTorrentTracker += Settings.BitTorrent.DefaultTrackerPeriod;

	// Create and run tracker request
	new CBTTrackerRequest( pDownload,  NULL , nNumWant, TRUE );
}

void CBTTrackerRequest::SendCompleted(CDownload* pDownload)
{
	// Return if there is no tracker
	if ( pDownload->m_pTorrent.m_sTracker.IsEmpty() )
		return;

	// Log the 'complete' event
	theApp.Message( MSG_DEFAULT,
		_T("[BT] Sending completed tracker announce for %s"),
		pDownload->m_pTorrent.m_sName );

	// Create and run tracker request
	new CBTTrackerRequest( pDownload, _T("completed"), 0ul, TRUE );
}

void CBTTrackerRequest::SendStopped(CDownload* pDownload)
{
	// Return if there is no tracker
	if ( pDownload->m_pTorrent.m_sTracker.IsEmpty() )
		return;

	// Log the 'stop' event
	theApp.Message( MSG_DEFAULT,
		_T("[BT] Sending final tracker announce for %s"),
		pDownload->m_pTorrent.m_sName );

	// Update download to indicate it has been stopped
	pDownload->m_bTorrentRequested = FALSE;
	pDownload->m_bTorrentStarted = FALSE;

	// Create and run tracker request
	new CBTTrackerRequest( pDownload, _T("stopped"), 0ul, FALSE );
}

/////////////////////////////////////////////////////////////////////////////
// CBTTrackerRequest escaper

CString CBTTrackerRequest::Escape(const Hashes::BtHash& oBTH)
{
	static LPCTSTR pszHex = _T("0123456789ABCDEF");
	
	CString str;
    LPTSTR psz = str.GetBuffer( Hashes::BtHash::byteCount * 3 + 1 );
	
	for ( int nByte = 0 ; nByte < Hashes::BtHash::byteCount ; nByte++ )
	{
		int nValue = oBTH[ nByte ];
		
		if (	( nValue >= '0' && nValue <= '9' ) ||
				( nValue >= 'a' && nValue <= 'z' ) ||
				( nValue >= 'A' && nValue <= 'Z' ) )
		{
			*psz++ = (TCHAR)nValue;
		}
		else
		{
			*psz++ = '%';
			*psz++ = pszHex[ ( nValue >> 4 ) & 15 ];
			*psz++ = pszHex[ nValue & 15 ];
		}
	}
	
	*psz = 0;
	str.ReleaseBuffer();
	
	return str;
}

CString CBTTrackerRequest::Escape(const Hashes::BtGuid& oGUID)
{
	static LPCTSTR pszHex = _T("0123456789ABCDEF");
	
	CString str;
    LPTSTR psz = str.GetBuffer( Hashes::BtGuid::byteCount * 3 + 1 );
	
	for ( int nByte = 0 ; nByte < Hashes::BtGuid::byteCount ; nByte++ )
	{
		int nValue = oGUID[ nByte ];
		
		if (	( nValue >= '0' && nValue <= '9' ) ||
				( nValue >= 'a' && nValue <= 'z' ) ||
				( nValue >= 'A' && nValue <= 'Z' ) )
		{
			*psz++ = (TCHAR)nValue;
		}
		else
		{
			*psz++ = '%';
			*psz++ = pszHex[ ( nValue >> 4 ) & 15 ];
			*psz++ = pszHex[ nValue & 15 ];
		}
	}
	
	*psz = 0;
	str.ReleaseBuffer();
	
	return str;
}

/////////////////////////////////////////////////////////////////////////////
// CBTTrackerRequest run

BOOL CBTTrackerRequest::InitInstance() 
{
	return TRUE;
}

int CBTTrackerRequest::Run() 
{	
	if ( m_bProcess )
	{
		Process( m_pRequest.Execute( FALSE ) );
	}
	else
	{
		m_pRequest.Execute( FALSE );
	}
	
	return 0;
}

void CBTTrackerRequest::Process(BOOL bRequest)
{
	CSingleLock pLock( &Transfers.m_pSection );
	
	if ( ! pLock.Lock( 250 ) ) return;
	if ( ! Downloads.Check( m_pDownload ) ) return;
	if ( ! m_pDownload->m_bTorrentRequested ) return;
	
	if ( ! bRequest )
	{
		m_pDownload->OnTrackerEvent( FALSE );
		return;
	}
	
	if ( ! m_pRequest.InflateResponse() )
	{
		theApp.Message( MSG_ERROR, IDS_BT_TRACK_PARSE_ERROR );
		return;
	}
	
	CBuffer* pBuffer = m_pRequest.GetResponseBuffer();

	if ( pBuffer == NULL ) return;
	if ( pBuffer->m_pBuffer == NULL )
	{
		theApp.Message( MSG_ERROR, IDS_BT_TRACK_PARSE_ERROR );
		m_pDownload->OnTrackerEvent( FALSE );
		return;
	}

	CBENode* pRoot = CBENode::Decode( pBuffer );
	
	if ( pRoot && pRoot->IsType( CBENode::beDict ) )
	{
		theApp.Message( MSG_DEBUG, _T("Recieved BitTorrent tracker response: %s"),
			(LPCTSTR)pRoot->Encode() );
		Process( pRoot );
	}
	else if ( pRoot && pRoot->IsType( CBENode::beString ) )
	{
		CString str = pRoot->GetString();
		theApp.Message( MSG_ERROR, IDS_BT_TRACK_ERROR,
			(LPCTSTR)m_pDownload->GetDisplayName(), (LPCTSTR)str );
		m_pDownload->OnTrackerEvent( FALSE, str );
	}
	else
	{
		theApp.Message( MSG_ERROR, IDS_BT_TRACK_PARSE_ERROR );
		m_pDownload->OnTrackerEvent( FALSE );
	}
	
	if ( pRoot != NULL ) delete pRoot;
}

BOOL CBTTrackerRequest::Process(CBENode* pRoot)
{
	CString strError;

	// Check for failure
	if ( CBENode* pError = pRoot->GetNode( "failure reason" ) )
	{
		strError = pError->GetString();
		theApp.Message( MSG_ERROR, IDS_BT_TRACK_ERROR,
			(LPCTSTR)m_pDownload->GetDisplayName(), (LPCTSTR)strError );
		m_pDownload->OnTrackerEvent( FALSE, strError );
		return FALSE;
	}
	
	// Get the interval (next tracker contact)
	CBENode* pInterval = pRoot->GetNode( "interval" );
	if ( ! pInterval->IsType( CBENode::beInt ) ) 
	{
		LoadString( strError, IDS_BT_TRACK_PARSE_ERROR );
		m_pDownload->OnTrackerEvent( FALSE, strError );
		return FALSE;
	}
	int nInterval = (int)(DWORD)pInterval->GetInt();

	// Verify interval is valid
	nInterval = max( nInterval, 60*2 );
	nInterval = min( nInterval, 60*60 );
	
	m_pDownload->m_tTorrentTracker = GetTickCount() + 1000 * nInterval;
	m_pDownload->m_bTorrentStarted = TRUE;
	
	// Get list of peers
	CBENode* pPeers = pRoot->GetNode( "peers" );
	int nCount = 0;
	
	if ( pPeers->IsType( CBENode::beList ) )
	{
		for ( int nPeer = 0 ; nPeer < pPeers->GetCount() ; nPeer++ )
		{
			CBENode* pPeer = pPeers->GetNode( nPeer );
			if ( ! pPeer->IsType( CBENode::beDict ) ) continue;
			
			CBENode* pID = pPeer->GetNode( "peer id" );
			
			CBENode* pIP = pPeer->GetNode( "ip" );
			if ( ! pIP->IsType( CBENode::beString ) ) continue;
			
			CBENode* pPort = pPeer->GetNode( "port" );
			if ( ! pPort->IsType( CBENode::beInt ) ) continue;
			
			SOCKADDR_IN saPeer;
			if ( ! Network.Resolve( pIP->GetString(), (int)pPort->GetInt(), &saPeer ) ) continue;
			
			theApp.Message( MSG_DEBUG, _T("Tracker: %s:%i"),
				(LPCTSTR)CString( inet_ntoa( saPeer.sin_addr ) ), htons( saPeer.sin_port ) );
			
			if ( pID->IsType( CBENode::beString ) && pID->m_nValue == Hashes::BtGuid::byteCount )
			{
				Hashes::BtGuid tmp( *static_cast< Hashes::BtGuid::RawStorage* >(
					pID->m_pValue ) );
				if ( validAndUnequal( tmp, m_pDownload->m_pPeerID ) )
					nCount += m_pDownload->AddSourceBT( tmp,
						&saPeer.sin_addr, ntohs( saPeer.sin_port ) );
			}
			else
			{
				// Self IP is checked later although if bount to 0.0.0.0 
				// this will add self too
				nCount += m_pDownload->AddSourceBT( Hashes::BtGuid(),
					&saPeer.sin_addr, ntohs( saPeer.sin_port ) );
			}
		}
	}
	else if ( pPeers->IsType( CBENode::beString ) )
	{
		if ( 0 == ( pPeers->m_nValue % 6 ) )
		{
			BYTE* pPointer = (BYTE*)pPeers->m_pValue;
			
			for ( int nPeer = (int)pPeers->m_nValue / 6 ; nPeer > 0 ; nPeer --, pPointer += 6 )
			{
				IN_ADDR* pAddress = (IN_ADDR*)pPointer;
				WORD nPort = *(WORD*)( pPointer + 4 );

				nCount += m_pDownload->AddSourceBT( Hashes::BtGuid(), pAddress, ntohs( nPort ) );
			}
		}
	}

	// Okay, clear any errors and continue
	m_pDownload->OnTrackerEvent( TRUE );

	theApp.Message( MSG_DEFAULT, IDS_BT_TRACK_SUCCESS,
		(LPCTSTR)m_pDownload->GetDisplayName(), nCount );	
	return TRUE;
}

