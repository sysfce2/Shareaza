//
// HostCache.h
//
// Copyright (c) Shareaza Development Team, 2002-2005.
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

#if !defined(AFX_HOSTCACHE_H__7F2764B0_BB17_4FF0_AF03_7BB7D4E22F7F__INCLUDED_)
#define AFX_HOSTCACHE_H__7F2764B0_BB17_4FF0_AF03_7BB7D4E22F7F__INCLUDED_

#pragma once

class CHostCacheHost;
class CNeighbour;
class CG1Packet;
class CVendor;


class CHostCacheList
{
// Construction
public:
	CHostCacheList(PROTOCOLID nProtocol);
	virtual ~CHostCacheList();

// Attributes
public:
	PROTOCOLID		m_nProtocol;
	DWORD			m_nHosts;
	DWORD			m_nCookie;
	CHostCacheHost*	m_pNewest;
	CHostCacheHost*	m_pOldest;
protected:
	DWORD			m_nBuffer;
	CHostCacheHost*	m_pBuffer;
	CHostCacheHost*	m_pFree;
	CHostCacheHost*	m_pHash[256];

// Operations
public:
	CHostCacheHost*	Add(IN_ADDR* pAddress, WORD nPort, DWORD tSeen = 0, LPCTSTR pszVendor = NULL, DWORD nUptime = 0);
	BOOL			Add(LPCTSTR pszHost, DWORD tSeen = 0, LPCTSTR pszVendor = NULL, DWORD nUptime = 0);
	CHostCacheHost*	Find(IN_ADDR* pAddress) const;
	BOOL			Check(CHostCacheHost* pHost) const;
	void			Remove(CHostCacheHost* pHost);
	void			OnFailure(IN_ADDR* pAddress, WORD nPort, bool bRemove=true);
	void			OnSuccess(IN_ADDR* pAddress, WORD nPort, bool bUpdate=true);
	DWORD			CountHosts(BOOL bCountUncheckedLocally = FALSE) const;
	void			PruneByQueryAck();			// For G2
	void			PruneOldHosts();			// For G1
	void			Clear();
	void			Serialize(CArchive& ar, int nVersion);
	int				Import(LPCTSTR pszFile);
	int				ImportMET(CFile* pFile);
	BOOL			CheckMinimumED2KServers();
	BOOL			EnoughED2KServers();

private:
	int				LoadDefaultED2KServers();
	void			DoED2KServersImport();

protected:
	CHostCacheHost*	AddInternal(IN_ADDR* pAddress, WORD nPort, DWORD tSeen, LPCTSTR pszVendor, DWORD nUptime = 0);
	void			RemoveOldest();
	
// Inlines
public:

	inline CHostCacheHost* GetNewest() const
	{
		return m_pNewest;
	}

	inline CHostCacheHost* GetOldest() const
	{
		return m_pOldest;
	}

};

class CHostCacheHost
{
public:
// Construction
	CHostCacheHost();
	
// Attributes : Linkage
	CHostCacheHost*	m_pNextHash;
	CHostCacheHost*	m_pPrevTime;
	CHostCacheHost*	m_pNextTime;

// Attributes: Host Information
	PROTOCOLID	m_nProtocol;
	IN_ADDR		m_pAddress;
	WORD		m_nPort;
	CVendor*	m_pVendor;
	BOOL		m_bPriority;
	DWORD		m_nUserCount;
	DWORD		m_nUserLimit;
	DWORD		m_nFileLimit;
	CString		m_sName;
	CString		m_sDescription;
	DWORD		m_nTCPFlags;
	DWORD		m_nUDPFlags;
	BOOL		m_bCheckedLocally;

// Attributes: Contact Times
	DWORD		m_tAdded;
	DWORD		m_tSeen;
	DWORD		m_tRetryAfter;
	DWORD		m_tConnect;
	DWORD		m_tQuery;
	DWORD		m_tAck;
	DWORD		m_tStats;			// ED2K stats UDP request
	DWORD		m_tFailure;
	DWORD		m_nFailures;
	DWORD		m_nDailyUptime;
	DWORD		m_tCheckTime;

// Attributes: Query Keys
	DWORD		m_tKeyTime;
	DWORD		m_nKeyValue;
	DWORD		m_nKeyHost;

// Operations
	void		Update(WORD nPort, DWORD tSeen = 0, LPCTSTR pszVendor = NULL, DWORD nUptime = 0);
	CNeighbour*	ConnectTo(BOOL bAutomatic = FALSE);
//	CG1Packet*	ToG1Ping(int nTTL, const Hashes::Guid& oGUID);
	CString		ToString() const;
	BOOL		CanConnect(DWORD tNow = 0) const;	// Can we connect to this host now?
	BOOL		CanQuote(DWORD tNow = 0) const;		// Is this a recently seen host?
	BOOL		CanQuery(DWORD tNow = 0) const;		// Can we UDP query this host? (G2/ed2k)
	void		SetKey(DWORD nKey, IN_ADDR* pHost = NULL);
protected:
	void		Serialize(CArchive& ar, int nVersion);
	void		Reset(IN_ADDR* pAddress);

	friend class CHostCacheList;
	friend class CHostCacheLinks;
};


class CHostCache
{
public:
// Construction
	CHostCache();

// Attributes
	CHostCacheList	Gnutella1;
	CHostCacheList	Gnutella2;
	CHostCacheList	eDonkey;
	CHostCacheList	G1DNA;
	CList< CHostCacheList* > m_pList;

// Operations
	BOOL		Load();
	BOOL		Save();
	void		Clear();

	CHostCacheHost*	Find(IN_ADDR* pAddress) const;
	BOOL			Check(CHostCacheHost* pHost) const;
	void			Remove(CHostCacheHost* pHost);
	void			OnFailure(IN_ADDR* pAddress, WORD nPort, 
							  PROTOCOLID nProtocol=PROTOCOL_NULL, bool bRemove=true);
	void			OnSuccess(IN_ADDR* pAddress, WORD nPort, 
							  PROTOCOLID nProtocol=PROTOCOL_NULL, bool bUpdate=true);

protected:
	void		Serialize(CArchive& ar);

// Inlines
public:
	inline CHostCacheList* ForProtocol(PROTOCOLID nProtocol)
	{
		switch ( nProtocol )
		{
		case PROTOCOL_G1:
			return &Gnutella1;
		case PROTOCOL_G2:
			return &Gnutella2;
		case PROTOCOL_ED2K:
			return &eDonkey;
		default:
			ASSERT(FALSE);
			return NULL;
		}
	}
};

extern CHostCache HostCache;

#endif // !defined(AFX_HOSTCACHE_H__7F2764B0_BB17_4FF0_AF03_7BB7D4E22F7F__INCLUDED_)
