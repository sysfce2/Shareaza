//
// WizardSharePage.h
//
// Copyright (c) Shareaza Development Team, 2002-2007.
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

#if !defined(AFX_WIZARDSHAREPAGE_H__7E7C0D6F_53E5_4451_9B9A_6E8EF21C3086__INCLUDED_)
#define AFX_WIZARDSHAREPAGE_H__7E7C0D6F_53E5_4451_9B9A_6E8EF21C3086__INCLUDED_

#pragma once

#include "WizardSheet.h"


class CWizardSharePage : public CWizardPage
{
// Construction
public:
	CWizardSharePage();
	virtual ~CWizardSharePage();

	DECLARE_DYNCREATE(CWizardSharePage)

// Dialog Data
public:
	//{{AFX_DATA(CWizardSharePage)
	enum { IDD = IDD_WIZARD_SHARING };
	CListCtrl	m_wndList;
	CButton	m_wndRemove;
	//}}AFX_DATA

	void	AddPhysicalFolder(LPCTSTR pszFolder);
	void	AddRegistryFolder(HKEY hRoot, LPCTSTR pszKey, LPCTSTR pszValue);

// Overrides
public:
	//{{AFX_VIRTUAL(CWizardSharePage)
	public:
	virtual BOOL OnSetActive();
	virtual LRESULT OnWizardNext();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CWizardSharePage)
	virtual BOOL OnInitDialog();
	afx_msg void OnItemChangedShareFolders(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnShareAdd();
	afx_msg void OnShareRemove();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}

#endif // !defined(AFX_WIZARDSHAREPAGE_H__7E7C0D6F_53E5_4451_9B9A_6E8EF21C3086__INCLUDED_)
