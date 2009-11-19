//
// EDNeighbour.h
//
// Copyright (c) Shareaza Development Team, 2002-2009.
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

#include "Neighbour.h"

class CEDPacket;
class CDownload;


class CEDNeighbour : public CNeighbour
{
// Construction
public:
	CEDNeighbour();
	virtual ~CEDNeighbour();

// Attributes
public:
	DWORD		m_nClientID;
	DWORD		m_nUserCount;
	DWORD		m_nUserLimit;
	DWORD		m_nFileLimit;
	DWORD		m_nTCPFlags;
	DWORD		m_nUDPFlags;
	CString		m_sServerName;
	CList< Hashes::Guid > m_pQueries;
	DWORD		m_nFilesSent;

// Operations
public:
	BOOL	SendSharedDownload(CDownload* pDownload);
	DWORD	GetID() const;
private:
	BOOL	OnPacket(CEDPacket* pPacket);
	BOOL	OnRejected(CEDPacket* pPacket);
	BOOL	OnServerMessage(CEDPacket* pPacket);
	BOOL	OnIdChange(CEDPacket* pPacket);
	BOOL	OnServerList(CEDPacket* pPacket);
	BOOL	OnServerStatus(CEDPacket* pPacket);
	BOOL	OnServerIdent(CEDPacket* pPacket);
	bool	OnCallbackRequested(CEDPacket* pPacket);
	BOOL	OnSearchResults(CEDPacket* pPacket);
	BOOL	OnFoundSources(CEDPacket* pPacket);
	void	SendSharedFiles();
	bool	IsGoodSize(QWORD nFileSize) const;			// Is file has good size for current ed2k-server?

// Overrides
public:
	virtual BOOL	ConnectTo(const IN_ADDR* pAddress, WORD nPort, BOOL bAutomatic);
	virtual BOOL	Send(CPacket* pPacket, BOOL bRelease = TRUE, BOOL bBuffered = FALSE);
protected:
	virtual BOOL	SendQuery(const CQuerySearch* pSearch, CPacket* pPacket, BOOL bLocal);
	virtual BOOL	OnRun();
	virtual BOOL	OnConnected();
	virtual void	OnDropped();
	virtual BOOL	OnRead();
};
