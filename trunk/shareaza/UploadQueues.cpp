//
// UploadQueues.cpp
//
// Copyright (c) Shareaza Development Team, 2002-2004.
// This file is part of SHAREAZA (www.shareaza.com)
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
#include "UploadQueues.h"
#include "UploadQueue.h"
#include "UploadTransfer.h"
#include "Transfers.h"

#include "SharedFile.h"
#include "Download.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

CUploadQueues UploadQueues;


//////////////////////////////////////////////////////////////////////
// CUploadQueues construction

CUploadQueues::CUploadQueues()
{
	m_pTorrentQueue = new CUploadQueue();
	m_pHistoryQueue = new CUploadQueue();
	m_pHistoryQueue->m_bExpanded = FALSE;
}

CUploadQueues::~CUploadQueues()
{
	Clear();
	delete m_pHistoryQueue;
	delete m_pTorrentQueue;
}

//////////////////////////////////////////////////////////////////////
// CUploadQueues enqueue and dequeue

BOOL CUploadQueues::Enqueue(CUploadTransfer* pUpload, BOOL bForce)
{
	CSingleLock pLock( &m_pSection, TRUE );
	
	ASSERT( pUpload != NULL );
	
	Dequeue( pUpload );
	
	ASSERT( pUpload->m_pQueue == NULL );
	
	if ( pUpload->m_nFileSize == 0 ) return FALSE;
	
	for ( POSITION pos = GetIterator() ; pos ; )
	{
		CUploadQueue* pQueue = GetNext( pos );
		
		if ( pQueue->CanAccept(	pUpload->m_nProtocol,
								pUpload->m_sFileName,
								pUpload->m_nFileSize,
								pUpload->m_bFilePartial,
								pUpload->m_sFileTags ) )
		{
			if ( pQueue->Enqueue( pUpload, bForce, bForce ) ) return TRUE;
		}
	}
	
	return FALSE;
}

BOOL CUploadQueues::Dequeue(CUploadTransfer* pUpload)
{
	CSingleLock pLock( &m_pSection, TRUE );
	
	ASSERT( pUpload != NULL );
	
	if ( Check( pUpload->m_pQueue ) )
	{
		return pUpload->m_pQueue->Dequeue( pUpload );
	}
	else
	{
		pUpload->m_pQueue = NULL;
		return FALSE;
	}
}

//////////////////////////////////////////////////////////////////////
// CUploadQueues position lookup and optional start

int CUploadQueues::GetPosition(CUploadTransfer* pUpload, BOOL bStart)
{
	CSingleLock pLock( &m_pSection, TRUE );
	
	ASSERT( pUpload != NULL );
	
	if ( Check( pUpload->m_pQueue ) )
	{
		return pUpload->m_pQueue->GetPosition( pUpload, bStart );
	}
	else
	{
		pUpload->m_pQueue = NULL;
		return -1;
	}
}

//////////////////////////////////////////////////////////////////////
// CUploadQueues position stealing

BOOL CUploadQueues::StealPosition(CUploadTransfer* pTarget, CUploadTransfer* pSource)
{
	CSingleLock pLock( &m_pSection, TRUE );
	
	ASSERT( pTarget != NULL );
	ASSERT( pSource != NULL );
	
	Dequeue( pTarget );
	
	if ( ! Check( pSource->m_pQueue ) ) return FALSE;
	
	return pSource->m_pQueue->StealPosition( pTarget, pSource );
}

//////////////////////////////////////////////////////////////////////
// CUploadQueues create and delete queues

CUploadQueue* CUploadQueues::Create(LPCTSTR pszName, BOOL bTop)
{
	CSingleLock pLock( &m_pSection, TRUE );
	
	CUploadQueue* pQueue = new CUploadQueue();
	if ( pszName != NULL ) pQueue->m_sName = pszName;
	pQueue->m_bEnable = ! bTop;
	
	if ( bTop )
		m_pList.AddHead( pQueue );
	else
		m_pList.AddTail( pQueue );
	
	return pQueue;
}

void CUploadQueues::Delete(CUploadQueue* pQueue)
{
	CSingleLock pLock( &m_pSection, TRUE );
	if ( ! Check( pQueue ) ) return;
	if ( POSITION pos = m_pList.Find( pQueue ) ) m_pList.RemoveAt( pos );
	delete pQueue;
}

BOOL CUploadQueues::Reorder(CUploadQueue* pQueue, CUploadQueue* pBefore)
{
	CSingleLock pLock( &m_pSection, TRUE );
	
	POSITION pos1 = m_pList.Find( pQueue );
	if ( pos1 == NULL ) return FALSE;
	
	if ( pBefore != NULL )
	{
		POSITION pos2 = m_pList.Find( pBefore );
		if ( pos2 == NULL || pos1 == pos2 ) return FALSE;
		m_pList.RemoveAt( pos1 );
		m_pList.InsertBefore( pos2, pQueue );
	}
	else
	{
		m_pList.RemoveAt( pos1 );
		m_pList.AddTail( pQueue );
	}
	
	return TRUE;
}

//////////////////////////////////////////////////////////////////////
// CUploadQueues queue selection

CUploadQueue* CUploadQueues::SelectQueue(PROTOCOLID nProtocol, CLibraryFile* pFile)
{
	return SelectQueue( nProtocol, pFile->m_sName, pFile->GetSize(), FALSE, pFile->m_sShareTags );
}

CUploadQueue* CUploadQueues::SelectQueue(PROTOCOLID nProtocol, CDownload* pFile)
{
	return SelectQueue( nProtocol, pFile->m_sRemoteName, pFile->m_nSize, TRUE );
}

CUploadQueue* CUploadQueues::SelectQueue(PROTOCOLID nProtocol, LPCTSTR pszName, QWORD nSize, BOOL bPartial, LPCTSTR pszShareTags)
{
	CSingleLock pLock( &m_pSection, TRUE );
	int nIndex = 0;
	
	for ( POSITION pos = GetIterator() ; pos ; nIndex++ )
	{
		CUploadQueue* pQueue = GetNext( pos );
		pQueue->m_nIndex = nIndex;
		if ( pQueue->CanAccept( nProtocol, pszName, nSize, bPartial, pszShareTags ) ) return pQueue;
	}
	
	return NULL;
}

//////////////////////////////////////////////////////////////////////
// CUploadQueues counting

int CUploadQueues::GetTotalBandwidthPoints( BOOL ActiveOnly )
{
	CSingleLock pLock( &m_pSection, TRUE );
	int nCount = 0;
	CUploadQueue *pQptr;
	
	for ( POSITION pos = GetIterator() ; pos ; )
	{
		pQptr=GetNext( pos );
		if ( ActiveOnly )
		{
			if ( pQptr->m_bEnable )
			{
				if ( ( pQptr->m_nProtocols & ( 1 << PROTOCOL_ED2K ) ) != 0 )
				{
					if ( ! ( Settings.eDonkey.EnableAlways | Settings.eDonkey.EnableToday ) )
						continue;
				}
			}
			else
				continue;
		}
		nCount += pQptr->m_nBandwidthPoints;
	}
	
	return nCount;
}

int CUploadQueues::GetQueueCapacity()
{
	CSingleLock pLock( &m_pSection, TRUE );
	int nCount = 0;
	
	for ( POSITION pos = GetIterator() ; pos ; )
	{
		nCount += GetNext( pos )->GetQueueCapacity();
	}
	
	return nCount;
}

int CUploadQueues::GetQueuedCount()
{
	CSingleLock pLock( &m_pSection, TRUE );
	int nCount = 0;
	
	for ( POSITION pos = GetIterator() ; pos ; )
	{
		nCount += GetNext( pos )->GetQueuedCount();
	}
	
	return nCount;
}

int CUploadQueues::GetQueueRemaining()
{
	CSingleLock pLock( &m_pSection, TRUE );
	int nCount = 0;
	
	for ( POSITION pos = GetIterator() ; pos ; )
	{
		nCount += GetNext( pos )->GetQueueRemaining();
	}
	
	return nCount;
}

int CUploadQueues::GetTransferCount()
{
	CSingleLock pLock( &m_pSection, TRUE );
	int nCount = 0;
	
	for ( POSITION pos = GetIterator() ; pos ; )
	{
		nCount += GetNext( pos )->GetTransferCount();
	}
	
	return nCount;
}

BOOL CUploadQueues::IsTransferAvailable()
{
	CSingleLock pLock( &m_pSection, TRUE );
	
	for ( POSITION pos = GetIterator() ; pos ; )
	{
		if ( GetNext( pos )->GetAvailableBandwidth() > 0 ) return TRUE;
	}
	
	return FALSE;
}

DWORD CUploadQueues::GetDonkeyBandwidth()
{
	CSingleLock pLock( &m_pSection, TRUE );
	DWORD nBandwidth = 0;
	
	for ( POSITION pos = GetIterator() ; pos ; )
	{
		CUploadQueue* pQueue = GetNext( pos );
		
		if ( pQueue->m_nProtocols == 0 || ( pQueue->m_nProtocols & ( 1 << PROTOCOL_ED2K ) ) != 0 )
			nBandwidth += pQueue->GetBandwidthLimit( pQueue->m_nMaxTransfers );
	}
	
	return nBandwidth;
}

//////////////////////////////////////////////////////////////////////
// CUploadQueues clear

void CUploadQueues::Clear()
{
	CSingleLock pLock( &m_pSection, TRUE );
	
	for ( POSITION pos = GetIterator() ; pos ; )
	{
		delete GetNext( pos );
	}
	
	m_pList.RemoveAll();
}

//////////////////////////////////////////////////////////////////////
// CUploadQueues load and save

BOOL CUploadQueues::Load()
{
	CSingleLock pLock( &m_pSection, TRUE );
	CFile pFile;
	
	LoadString( m_pTorrentQueue->m_sName, IDS_UPLOAD_QUEUE_TORRENT );
	LoadString( m_pHistoryQueue->m_sName, IDS_UPLOAD_QUEUE_HISTORY );

	CString strFile = Settings.General.Path + _T("\\Data\\UploadQueues.dat");
	
	if ( ! pFile.Open( strFile, CFile::modeRead ) )
	{
		CreateDefault();
		return FALSE;
	}
	
	try
	{
		CArchive ar( &pFile, CArchive::load );
		Serialize( ar );
		ar.Close();
	}
	catch ( CException* pException )
	{
		pFile.Close();
		pException->Delete();
		CreateDefault();
		return FALSE;
	}
	
	if ( GetCount() == 0 ) CreateDefault();
	
	return TRUE;
}

BOOL CUploadQueues::Save()
{
	CSingleLock pLock( &m_pSection, TRUE );
	CFile pFile;
	
	CString strFile = Settings.General.Path + _T("\\Data\\UploadQueues.dat");
	if ( !pFile.Open( strFile, CFile::modeWrite|CFile::modeCreate ) )
		return FALSE;
	
	CArchive ar( &pFile, CArchive::store );
	Serialize( ar );
	ar.Close();
	
	return TRUE;
}

//////////////////////////////////////////////////////////////////////
// CUploadQueues serialize

void CUploadQueues::Serialize(CArchive& ar)
{
	int nVersion = 4;
	
	if ( ar.IsStoring() )
	{
		ar << nVersion;
		
		ar.WriteCount( GetCount() );
		
		for ( POSITION pos = GetIterator() ; pos ; )
		{
			GetNext( pos )->Serialize( ar, nVersion );
		}
	}
	else
	{
		Clear();
		
		ar >> nVersion;
		if ( nVersion < 2 ) AfxThrowUserException();
		
		for ( int nCount = ar.ReadCount() ; nCount > 0 ; nCount-- )
		{
			Create()->Serialize( ar, nVersion );
		}
	}
}

//////////////////////////////////////////////////////////////////////
// CUploadQueues create default

void CUploadQueues::CreateDefault()
{
	CSingleLock pLock( &m_pSection, TRUE );
	
	CUploadQueue* pQueue = NULL;
	
	Clear();
	
	if ( Settings.Connection.OutSpeed > 800 )  // 800 Kb/s (Massive connection)
	{

		pQueue						= Create( _T("eDonkey Partials") );
		pQueue->m_nBandwidthPoints	= 30;
		pQueue->m_nProtocols		= (1<<PROTOCOL_ED2K);
		pQueue->m_bPartial			= TRUE;
		pQueue->m_nCapacity			= 2000;
		pQueue->m_nMinTransfers		= 2;
		pQueue->m_nMaxTransfers		= 5;
		pQueue->m_bRotate			= TRUE;
		pQueue->m_nRotateTime		= 10*60;

		pQueue						= Create( _T("eDonkey Core") );
		pQueue->m_nBandwidthPoints	= 20;
		pQueue->m_nProtocols		= (1<<PROTOCOL_ED2K);
		pQueue->m_nCapacity			= 2000;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 5;
		pQueue->m_bRotate			= TRUE;
		pQueue->m_nRotateTime		= 10*60;
		
		pQueue						= Create( _T("Partial Files") );
		pQueue->m_nBandwidthPoints	= 50;
		pQueue->m_nProtocols		= (1<<PROTOCOL_HTTP);
		pQueue->m_bPartial			= TRUE;
		pQueue->m_nMinTransfers		= 2;
		pQueue->m_nMaxTransfers		= 5;
		pQueue->m_bRotate			= TRUE;
		pQueue->m_nRotateTime		= 5*60;
		
		pQueue						= Create( _T("Small Files") );
		pQueue->m_nBandwidthPoints	= 10;
		//pQueue->m_nProtocols		= (1<<PROTOCOL_HTTP);
		pQueue->m_nMaxSize			= 1 * 1024 * 1024;
		pQueue->m_nCapacity			= 10;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 5;
		
		pQueue						= Create( _T("Medium Files") );
		pQueue->m_nBandwidthPoints	= 10;
		pQueue->m_nProtocols		= (1<<PROTOCOL_HTTP);
		pQueue->m_nMinSize			= 1  * 1024 * 1024 + 1;
		pQueue->m_nMaxSize			= 10 * 1024 * 1024 - 1;
		pQueue->m_nCapacity			= 10;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 5;
		
		pQueue						= Create( _T("Large Files") );
		pQueue->m_nBandwidthPoints	= 20;
		pQueue->m_nProtocols		= (1<<PROTOCOL_HTTP);
		pQueue->m_nMinSize			= 10 * 1024 * 1024;
		pQueue->m_nCapacity			= 10;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 5;
		pQueue->m_bRotate			= TRUE;
		pQueue->m_nRotateTime		= 60*60;
	}
	else if ( Settings.Connection.OutSpeed > 120 )  // 120 Kb/s (Good Broadband)
	{
		pQueue						= Create( _T("eDonkey Core") );
		pQueue->m_nBandwidthPoints	= 30;
		pQueue->m_nProtocols		= (1<<PROTOCOL_ED2K);
		pQueue->m_nCapacity			= 2000;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 5;
		pQueue->m_bRotate			= TRUE;
		pQueue->m_nRotateTime		= 10*60;
		
		pQueue						= Create( _T("Partial Files") );
		pQueue->m_nBandwidthPoints	= 50;
		pQueue->m_nProtocols		= (1<<PROTOCOL_HTTP);
		pQueue->m_bPartial			= TRUE;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 5;
		pQueue->m_bRotate			= TRUE;
		pQueue->m_nRotateTime		= 5*60;
		
		pQueue						= Create( _T("Small Files") );
		pQueue->m_nBandwidthPoints	= 10;
		pQueue->m_nProtocols		= (1<<PROTOCOL_HTTP);
		pQueue->m_nMaxSize			= 1 * 1024 * 1024;
		pQueue->m_nCapacity			= 10;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 5;
		
		pQueue						= Create( _T("Medium Files") );
		pQueue->m_nBandwidthPoints	= 10;
		pQueue->m_nProtocols		= (1<<PROTOCOL_HTTP);
		pQueue->m_nMinSize			= 1  * 1024 * 1024 + 1;
		pQueue->m_nMaxSize			= 10 * 1024 * 1024 - 1;
		pQueue->m_nCapacity			= 10;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 5;
		
		pQueue						= Create( _T("Large Files") );
		pQueue->m_nBandwidthPoints	= 10;
		pQueue->m_nProtocols		= (1<<PROTOCOL_HTTP);
		pQueue->m_nMinSize			= 10 * 1024 * 1024;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 5;
		pQueue->m_nCapacity			= 10;
		pQueue->m_bRotate			= TRUE;
		pQueue->m_nRotateTime		= 60*60;
	}
	else if ( Settings.Connection.OutSpeed > 40 ) // >40 Kb/s (Slow Broadband)
	{
		pQueue						= Create( _T("eDonkey Core") );
		pQueue->m_nBandwidthPoints	= 20;
		pQueue->m_nProtocols		= (1<<PROTOCOL_ED2K);
		pQueue->m_nCapacity			= 500;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 4;
		pQueue->m_bRotate			= TRUE;
		pQueue->m_nRotateTime		= 30*60;
		
		pQueue						= Create( _T("Partial Files") );
		pQueue->m_nBandwidthPoints	= 20;
		// pQueue->m_nProtocols		= (1<<PROTOCOL_HTTP);
		pQueue->m_bPartial			= TRUE;
		pQueue->m_nCapacity			= 8;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 4;
		pQueue->m_bRotate			= TRUE;
		pQueue->m_nRotateTime		= 20*60;
		
		pQueue						= Create( _T("Complete Files") );
		pQueue->m_nBandwidthPoints	= 10;
		pQueue->m_nProtocols		= (1<<PROTOCOL_HTTP);
		pQueue->m_nCapacity			= 8;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 4;
		pQueue->m_bRotate			= TRUE;
		pQueue->m_nRotateTime		= 30*60;
	}
	else  // <40 Kb/s (Dial up modem)
	{
		pQueue						= Create( _T("eDonkey Core") );
		pQueue->m_nBandwidthPoints	= 20;
		pQueue->m_nProtocols		= (1<<PROTOCOL_ED2K);
		pQueue->m_nCapacity			= 500;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 2;
		pQueue->m_bRotate			= TRUE;
		pQueue->m_nRotateTime		= 30*60;
		
		pQueue						= Create( _T("Queue") );
		pQueue->m_nBandwidthPoints	= 30;
		pQueue->m_nProtocols		= (1<<PROTOCOL_HTTP);
		pQueue->m_nCapacity			= 5;
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 2;
		pQueue->m_bRotate			= TRUE;
		pQueue->m_nRotateTime		= 20*60;
	}
	
	Save();
}

//////////////////////////////////////////////////////////////////////
// CUploadQueues validate

void CUploadQueues::Validate()
{
	if ( SelectQueue( PROTOCOL_ED2K, _T("Filename"), 0x00A00000, TRUE ) == NULL &&
		 SelectQueue( PROTOCOL_ED2K, _T("Filename"), 0x03200000, TRUE ) == NULL &&
		 SelectQueue( PROTOCOL_ED2K, _T("Filename"), 0x1F400000, TRUE ) == NULL )
	{
		CUploadQueue* pQueue		= Create( _T("eDonkey Guard") );
		pQueue->m_nProtocols		= (1<<PROTOCOL_ED2K);
		pQueue->m_nMinTransfers		= 1;
		pQueue->m_nMaxTransfers		= 5;
		pQueue->m_bRotate			= TRUE;
		
		if ( Settings.Connection.OutSpeed > 100 )
		{
			pQueue->m_nBandwidthPoints	= 30;
			pQueue->m_nCapacity			= 2000;
			pQueue->m_nRotateTime		= 10*60;
		}
		else
		{
			pQueue->m_nBandwidthPoints	= 20;
			pQueue->m_nCapacity			= 500;
			pQueue->m_nRotateTime		= 30*60;
		}
	}
}

