//
// CtrlSearchDetailPanel.h
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

#if !defined(AFX_CTRLSEARCHDETAILPANEL_H__946418DF_EE15_4346_A4A7_FA1E4672FC3C__INCLUDED_)
#define AFX_CTRLSEARCHDETAILPANEL_H__946418DF_EE15_4346_A4A7_FA1E4672FC3C__INCLUDED_

#pragma once

#include "MetaPanel.h"
#include "RichDocument.h"
#include "RichViewCtrl.h"
#include "HttpRequest.h"

class CMatchFile;
class CImageFile;
class CSearchDetailPanel;

class Review
{
public:
	Review(const Hashes::Guid& oGUID, IN_ADDR* pAddress, LPCTSTR pszNick, int nRating, LPCTSTR pszComments);
	virtual ~Review();
	void			Layout(CSearchDetailPanel* pParent, CRect* pRect);
	void			Reposition(int nScroll);
	void			Paint(CDC* pDC, int nScroll);

protected:
	Hashes::Guid	m_oGUID;
	CString			m_sNick;
	int				m_nRating;
	CRichDocument	m_pComments;
	CRichViewCtrl	m_wndComments;
	CRect			m_rc;
};

class CSearchDetailPanel : public CWnd
{
// Construction
public:
	CSearchDetailPanel();
	virtual ~CSearchDetailPanel();

	DECLARE_DYNAMIC(CSearchDetailPanel)

// Operations
public:
	void		Update(CMatchFile* pFile);

protected:
	static void	DrawText(CDC* pDC, int nX, int nY, LPCTSTR pszText, RECT* pRect = NULL);
	void		DrawThumbnail(CDC* pDC, CRect& rcClient, CRect& rcWork);
	void		DrawThumbnail(CDC* pDC, CRect& rcThumb);
	void		ClearReviews();
	BOOL		RequestPreview();
	void		CancelPreview();
	static UINT	ThreadStart(LPVOID pParam);
	void		OnRun();
	BOOL		ExecuteRequest(CString strURL, BYTE** ppBuffer, DWORD* pnBuffer);
    void		OnPreviewLoaded(const Hashes::Sha1Hash& oSHA1, CImageFile* pImage);
    BOOL		CachePreviewImage(const Hashes::Sha1Hash& oSHA1, LPBYTE pBuffer, DWORD nBuffer);
	
	friend class Review;

// Attributes
protected:
	CMatchList*			m_pMatches;
	BOOL				m_bValid;
	CMatchFile*			m_pFile;
	Hashes::Sha1Hash    m_oSHA1;
	CString				m_sName;
	CString				m_sStatus;
	CRect				m_rcStatus;
	CString				m_sSize;
	int					m_nIcon48;
	int					m_nIcon32;
	int					m_nRating;
	CSchema*			m_pSchema;
	CMetaPanel			m_pMetadata;
	CList< Review* >	m_pReviews;
	int					m_nScrollWheelLines;
protected:
	CCriticalSection	m_pSection;
	CEvent				m_pWakeup;
	BOOL				m_bCanPreview;
	BOOL				m_bRunPreview;
	BOOL				m_bIsPreviewing;
	HANDLE				m_hThread;
	BOOL				m_bThread;
	CHttpRequest		m_pRequest;
	CList< CString >			m_pPreviewURLs;
protected:
	CBitmap				m_bmThumb;
	CSize				m_szThumb;
	CRect				m_rcThumb;
	COLORREF			m_crLight;
	int					m_nThumbSize;

// Overrides
public:
	//{{AFX_VIRTUAL(CSearchDetailPanel)
	public:
	virtual BOOL Create(CWnd* pParentWnd);
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CSearchDetailPanel)
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnDestroy();
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	afx_msg BOOL OnMouseWheel(UINT nFlags, short zDelta, CPoint pt);
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnPaint();
	afx_msg BOOL OnSetCursor(CWnd* pWnd, UINT nHitTest, UINT message);
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	afx_msg BOOL OnEraseBkgnd(CDC* pDC);
	afx_msg void OnClickReview(NMHDR* pNotify, LRESULT *pResult);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()

};

#define IDC_REVIEW_VIEW		99

//{{AFX_INSERT_LOCATION}}

#endif // !defined(AFX_CTRLSEARCHDETAILPANEL_H__946418DF_EE15_4346_A4A7_FA1E4672FC3C__INCLUDED_)
