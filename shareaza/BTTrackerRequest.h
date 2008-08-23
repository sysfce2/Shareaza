//
// BTTrackerRequest.h
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

#include "HttpRequest.h"

class CDownloadWithTorrent;
class CBENode;


class CBTTrackerRequest : public boost::noncopyable
{
public:
	CBTTrackerRequest(CDownloadWithTorrent* pDownload, LPCTSTR pszVerb, DWORD nNumWant, bool bProcess);
	virtual ~CBTTrackerRequest();

    static CString	Escape(const Hashes::BtHash& oBTH);
    static CString	Escape(const Hashes::BtGuid& oGUID);

protected:
	CDownloadWithTorrent*	m_pDownload;
	bool					m_bProcess;
	CHttpRequest			m_pRequest;

	void		Process(bool bRequest);
	void		Process(CBENode* pRoot);
	static UINT	ThreadStart(LPVOID pParam);
	void		OnRun();
};