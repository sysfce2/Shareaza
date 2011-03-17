//
// ChatCore.cpp
//
// Copyright (c) Shareaza Development Team, 2002-2011.
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
#include "EDClient.h"
#include "ChatSession.h"
#include "ChatCore.h"
#include "Buffer.h"


#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

CChatCore ChatCore;


//////////////////////////////////////////////////////////////////////
// CChatCore construction

CChatCore::CChatCore()
{
}

CChatCore::~CChatCore()
{
	Close();
}

//////////////////////////////////////////////////////////////////////
// CChatCore session access

POSITION CChatCore::GetIterator() const
{
	return m_pSessions.GetHeadPosition();
}

CChatSession* CChatCore::GetNext(POSITION& pos) const
{
	return m_pSessions.GetNext( pos );
}

BOOL CChatCore::Check(CChatSession* pSession) const
{
	return m_pSessions.Find( pSession ) != NULL;
}

//////////////////////////////////////////////////////////////////////
// CChatCore accept new connections

void CChatCore::OnAccept(CConnection* pConnection, PROTOCOLID nProtocol)
{
	CSingleLock pLock( &m_pSection );
	if ( ! pLock.Lock( 250 ) )
		return;
	
	CChatSession* pSession = new CChatSession( nProtocol );

	pSession->AttachTo( pConnection );
}

BOOL CChatCore::OnPush(const Hashes::Guid& oGUID, CConnection* pConnection)
{
	CSingleLock pLock( &m_pSection );
	if ( ! pLock.Lock( 250 ) )
		return FALSE;

	for ( POSITION pos = GetIterator() ; pos ; )
	{
		CChatSession* pSession = GetNext( pos );
		if ( pSession->OnPush( oGUID, pConnection ) ) return TRUE;
	}
	
	return FALSE;
}

//////////////////////////////////////////////////////////////////////
// CChatCore ED2K chat handling

void CChatCore::OnED2KMessage(CEDClient* pClient, CEDPacket* pPacket)
{
	ASSERT ( pClient != NULL );

	// Note: Null packet is valid - in that case we have no pending message,
	// but want to open a chat window.

	CSingleLock pLock( &m_pSection );
	if ( ! pLock.Lock( 250 ) )
		return;

	if ( CChatSession* pSession = FindSession( pClient, TRUE ) )
	{
		pSession->OnED2KMessage( pPacket );
	}
}

void CChatCore::OnDropped(CEDClient* pClient)
{
	ASSERT ( pClient != NULL );

	// Note: Null packet is valid - in that case we have no pending message,
	// but want to open a chat window.

	CSingleLock pLock( &m_pSection );
	if ( ! pLock.Lock( 250 ) )
		return;

	if ( CChatSession* pSession = FindSession( pClient, FALSE ) )
	{
		pSession->OnDropped();
	}
}

CChatSession* CChatCore::FindSession(CEDClient* pClient, BOOL bCreate)
{
	for ( POSITION pos = GetIterator() ; pos ; )
	{
		CChatSession* pSession = GetNext( pos );

		// If we already have a session
		if ( ( ! pSession->m_oGUID || validAndEqual( pSession->m_oGUID, pClient->m_oGUID ) ) &&
			 pSession->m_pHost.sin_addr.s_addr == pClient->m_pHost.sin_addr.s_addr &&
			 pSession->m_nProtocol == PROTOCOL_ED2K )
		{
			// Update details
			pSession->m_oGUID		= pClient->m_oGUID;
			pSession->m_pHost		= pClient->m_pHost;
			pSession->m_sAddress	= pClient->m_sAddress;
			pSession->m_sUserNick	= pClient->m_sNick;
			pSession->m_sUserAgent	= pClient->m_sUserAgent;
			pSession->m_bUnicode	= pClient->m_bEmUnicode;
			pSession->m_nClientID	= pClient->m_nClientID;
			pSession->m_pServer		= pClient->m_pServer;

			pSession->m_bMustPush	= ( ( pClient->m_nClientID > 0 ) && ( pClient->m_nClientID < 16777216 ) );

			// return existing session
			return pSession;
		}
	}

	if ( ! bCreate )
		return NULL;

	// Create a new chat session
	CChatSession* pSession = new CChatSession( PROTOCOL_ED2K );
	pSession->m_nState		= cssActive;
	pSession->m_bConnected	= TRUE;
	pSession->m_tConnected	= GetTickCount();
	pSession->m_oGUID		= pClient->m_oGUID;
	pSession->m_pHost		= pClient->m_pHost;
	pSession->m_sAddress	= pClient->m_sAddress;
	pSession->m_sUserNick	= pClient->m_sNick;
	pSession->m_sUserAgent	= pClient->m_sUserAgent;
	pSession->m_bUnicode	= pClient->m_bEmUnicode;
	pSession->m_nClientID	= pClient->m_nClientID;
	pSession->m_pServer		= pClient->m_pServer;
	pSession->m_bMustPush	= ( pClient->m_nClientID > 0 && pClient->m_nClientID < 16777216 );

	// Make new input and output buffer objects
	pSession->CreateBuffers();

	return pSession;
}

//////////////////////////////////////////////////////////////////////
// CChatCore session add and remove

void CChatCore::Add(CChatSession* pSession)
{
	CQuickLock pLock( m_pSection );

	if ( m_pSessions.Find( pSession ) == NULL )
		m_pSessions.AddTail( pSession );

	if ( pSession->IsValid() )
		WSAEventSelect( pSession->m_hSocket, GetWakeupEvent(),
			FD_CONNECT|FD_READ|FD_WRITE|FD_CLOSE );

	StartThread();
}

void CChatCore::Remove(CChatSession* pSession)
{
	CQuickLock pLock( m_pSection );

	if ( POSITION pos = m_pSessions.Find( pSession ) )
		m_pSessions.RemoveAt( pos );

	if ( pSession->IsValid() )
		WSAEventSelect( pSession->m_hSocket, GetWakeupEvent(), 0 );
}

void CChatCore::Close()
{
	CloseThread();

	CQuickLock pLock( m_pSection );

	for ( POSITION pos = GetIterator() ; pos ; )
	{
		GetNext( pos )->Close();
	}
}

//////////////////////////////////////////////////////////////////////
// CChatCore thread control

void CChatCore::StartThread()
{
	if ( theApp.m_bClosing )
		return;

	if ( GetCount() == 0 ) return;
	
	BeginThread( "ChatCore" );
}

//////////////////////////////////////////////////////////////////////
// CChatCore thread run

void CChatCore::OnRun()
{
	CSingleLock pLock( &m_pSection );
	
	while ( IsThreadEnabled() )
	{
		Sleep( 50 );
		Doze( 100 );
		
		if ( pLock.Lock( 250 ) )
		{
			if ( GetCount() == 0 ) break;
			
			for ( POSITION pos = GetIterator() ; pos ; )
			{
				GetNext( pos )->DoRun();
			}
			
			pLock.Unlock();
		}
	}
}
