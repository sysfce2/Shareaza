//
// DownloadWithExtras.h
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

#if !defined(AFX_DOWNLOADWITHEXTRAS_H__EDD3177D_5313_4C8C_900A_4D5B3DE93BB9__INCLUDED_)
#define AFX_DOWNLOADWITHEXTRAS_H__EDD3177D_5313_4C8C_900A_4D5B3DE93BB9__INCLUDED_

#pragma once

#include "DownloadWithSearch.h"

class CDownloadMonitorDlg;
class CFilePreviewDlg;

class CDownloadReview
{
// Construction
public:
	CDownloadReview();
	CDownloadReview(in_addr *pIP, int nUserPicture, int nRating, LPCTSTR pszUserName, LPCTSTR pszComment);
	~CDownloadReview();

// Attributes
public:
	in_addr				m_pUserIP;			// To prevent duplicate reviews
	int					m_nUserPicture;		// Picture to display. 2 = G2, 3 = ED2K
	CString				m_sUserName;		// User who made comments
	int					m_nFileRating;		// 0 = Unrated, 1 = Fake, 1-6 = Num Stars
	CString				m_sFileComments;	// The review/comments

	CDownloadReview*	m_pNext;
	CDownloadReview*	m_pPrev;

	friend class		CDownloadWithExtras;
};

class CDownloadWithExtras : public CDownloadWithSearch
{
// Construction
public:
	CDownloadWithExtras();
	virtual ~CDownloadWithExtras();
	
// Attributes
protected:
	CStringList				m_pPreviews;
	CDownloadMonitorDlg*	m_pMonitorWnd;
	CFilePreviewDlg*		m_pPreviewWnd;

protected:
	CDownloadReview*	m_pReviewFirst;
	CDownloadReview*	m_pReviewLast;
	int					m_nReviewCount;
	
// Operations
public:
	BOOL		Preview(CSingleLock* pLock = NULL);
	BOOL		IsPreviewVisible() const;
	BOOL		CanPreview();
	void		AddPreviewName(LPCTSTR pszFile);
	void		DeletePreviews();
	BOOL		AddReview(in_addr *pIP, int nUserPicture, int nRating, LPCTSTR pszUserName, LPCTSTR pszComment);
	void		DeleteReviews();
	inline int	GetReviewCount() const { return m_nReviewCount; }
	inline CDownloadReview* GetFirstReview() const { return m_pReviewFirst; }
	CDownloadReview* FindReview(in_addr *pIP) const;
public:
	void		ShowMonitor(CSingleLock* pLock = NULL);
	BOOL		IsMonitorVisible() const;

public:
	virtual void Serialize(CArchive& ar, int nVersion);
	
	friend class CDownloadMonitorDlg;
	friend class CFilePreviewDlg;

};

#endif // !defined(AFX_DOWNLOADWITHEXTRAS_H__EDD3177D_5313_4C8C_900A_4D5B3DE93BB9__INCLUDED_)
