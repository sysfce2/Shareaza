//
// EDClients.h
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

#pragma once

#include "EDClient.h"

class CConnection;
class CEDPacket;


class CEDClients
{
// Construction
public:
	CEDClients();
	virtual ~CEDClients();

// Attributes
protected:
	CEDClient*		m_pFirst;
	CEDClient*		m_pLast;
	int				m_nCount;
	DWORD			m_tLastRun;
	DWORD			m_tLastMaxClients;
	DWORD			m_tLastServerStats;
	in_addr			m_pLastServer;
	DWORD			m_nLastServerKey;
	BOOL			m_bAllServersDone;
	mutable CCriticalSection	m_pSection;

// Operations
public:
	void			Add(CEDClient* pClient);
	void			Remove(CEDClient* pClient);
	void			Clear();
	BOOL			PushTo(DWORD nClientID, WORD nClientPort);
	CEDClient*		GetByIP(IN_ADDR* pAddress) const;
	CEDClient*		Connect(DWORD nClientID, WORD nClientPort, IN_ADDR* pServerAddress, WORD nServerPort, const Hashes::Guid& oGUID);
	BOOL			Merge(CEDClient* pClient);
	void			OnRun();
	BOOL			OnAccept(CConnection* pConnection);
	BOOL			OnPacket(SOCKADDR_IN* pHost, CEDPacket* pPacket);
	BOOL			IsFull(const CEDClient* pCheckThis = NULL);
	BOOL			IsOverloaded() const;
	BOOL			IsMyDownload(const CDownloadTransferED2K* pDownload) const;

protected:
	BOOL			OnPacketKad(SOCKADDR_IN* pHost, CEDPacket* pPacket);
	BOOL			OnPacketED(SOCKADDR_IN* pHost, CEDPacket* pPacket);
	CEDClient*		GetByID(DWORD nClientID, IN_ADDR* pServer, const Hashes::Guid& oGUID) const;
	CEDClient*		GetByGUID(const Hashes::Guid& oGUID) const;
	void			OnServerStatus(SOCKADDR_IN* pHost, CEDPacket* pPacket);
	void			RequestServerStatus(IN_ADDR* pHost, WORD nPort);
	void			RunGlobalStatsRequests(DWORD tNow);
};

extern CEDClients EDClients;
