// ConfigDlg.cpp : Implementation of CConfigDlg

#include "stdafx.h"
#include "ConfigDlg.h"

#define REGISTRY_PATH _T("Software\\Shareaza\\Shareaza Preview Plugin")

// CConfigDlg

CConfigDlg::CConfigDlg()
	: m_nActive( -1 )
{
}

void CConfigDlg::Load()
{
	HUSKEY hKey = NULL;
	LSTATUS ret = SHRegOpenUSKey( REGISTRY_PATH, KEY_READ, NULL, &hKey, FALSE );
	if ( ERROR_SUCCESS == ret )
	{
		for ( DWORD i = 0; ; i++ )
		{
			TCHAR szExt[ MAX_PATH ] = {};
			DWORD nExtSize = _countof( szExt );
			DWORD nType = 0;
			TCHAR szCommand[ MAX_PATH ] = {};
			DWORD nCommandSize = _countof( szCommand );
			ret = SHRegEnumUSValue( hKey, i, szExt, &nExtSize, &nType,
				szCommand, &nCommandSize, SHREGENUM_HKCU );
			if ( ERROR_SUCCESS != ret )
				break;
			if ( nType == REG_SZ && *szExt && *szCommand )
			{
				Add( szExt, szCommand );
			}
		}

		SHRegCloseUSKey( hKey );
	}
}

void CConfigDlg::Save()
{
	CWindow wndList = GetDlgItem( IDC_LIST );

	SHDeleteKey( HKEY_CURRENT_USER, REGISTRY_PATH );

	int nCount = ListView_GetItemCount( wndList.m_hWnd );
	for ( int i = 0; i < nCount; i++ )
	{
		TCHAR szExt[ MAX_PATH ] = {};
		ListView_GetItemText( wndList.m_hWnd, i, 0, szExt, _countof( szExt ) );

		TCHAR szCommand[ MAX_PATH ] = {};
		ListView_GetItemText( wndList.m_hWnd, i, 1, szCommand, _countof( szCommand ) );

		SHRegSetUSValue( REGISTRY_PATH, szExt, REG_SZ, szCommand,
			lstrlen( szCommand ) * sizeof( TCHAR ), SHREGSET_FORCE_HKCU );
	}
}

int CConfigDlg::GetActive() const
{
	CWindow wndList = GetDlgItem( IDC_LIST );

	int nCount = ListView_GetItemCount( wndList.m_hWnd );
	for ( int i = 0; i < nCount; i++ )
	{
		if ( ListView_GetItemState( wndList.m_hWnd, i, LVIS_SELECTED ) == LVIS_SELECTED )
		{
			return i;
		}
	}

	return -1;
}

void CConfigDlg::Select(int nIndex)
{
	CWindow wndList = GetDlgItem( IDC_LIST );

	int nCount = ListView_GetItemCount( wndList.m_hWnd );
	for ( int i = 0; i < nCount; i++ )
	{
		if ( ListView_GetItemState( wndList.m_hWnd, i, LVIS_SELECTED ) == LVIS_SELECTED )
		{
			if ( nIndex != i )
				ListView_SetItemState( wndList.m_hWnd, i, 0, LVIS_SELECTED );
		}
		else
		{
			if ( nIndex == i )
				ListView_SetItemState( wndList.m_hWnd, i, LVIS_SELECTED, LVIS_SELECTED );
		}
	}

	Update( nIndex );
}

void CConfigDlg::Update(int nIndex)
{
	m_nActive = nIndex;

	if ( m_nActive != -1 )
	{
		CWindow wndList = GetDlgItem( IDC_LIST );

		TCHAR szExt[ MAX_PATH ] = {};
		ListView_GetItemText( wndList.m_hWnd, m_nActive, 0, szExt, _countof( szExt ) );

		TCHAR szCommand[ MAX_PATH ] = {};
		ListView_GetItemText( wndList.m_hWnd, m_nActive, 1, szCommand, _countof( szCommand ) );

		SetDlgItemText( IDC_EXT, szExt );
		GetDlgItem( IDC_EXT ).EnableWindow( TRUE );
		SetDlgItemText( IDC_COMMAND, szCommand );
		GetDlgItem( IDC_COMMAND ).EnableWindow( TRUE );
	}
	else
	{
		SetDlgItemText( IDC_EXT, _T("") );
		GetDlgItem( IDC_EXT ).EnableWindow( FALSE );
		SetDlgItemText( IDC_COMMAND, _T("") );
		GetDlgItem( IDC_COMMAND ).EnableWindow( FALSE );
	}

	UpdateWindow();
}

void CConfigDlg::AddNew()
{
	Select( Add( _T("ext"), _T("\"foo.exe\" \"%1\" \"%2\"") ) );
	GetDlgItem( IDC_EXT ).SetFocus();
	GetDlgItem( IDC_EXT ).SendMessage( EM_SETSEL, 0, (LPARAM)-1 );  
}

int CConfigDlg::Add(LPCTSTR szExt, LPCTSTR szCommand)
{
	CWindow wndList = GetDlgItem( IDC_LIST );

	LVITEM item = { LVIF_TEXT };
	item.pszText = const_cast< LPTSTR >( szExt );
	item.iItem = ListView_InsertItem( wndList.m_hWnd, &item );
	if ( item.iItem != -1 )
	{
		item.iSubItem = 1;
		item.pszText = const_cast< LPTSTR >( szCommand );
		ListView_SetItem( wndList.m_hWnd, &item );
	}

	return item.iItem;
}

void CConfigDlg::Delete(int nIndex)
{
	Update( - 1 );

	CWindow wndList = GetDlgItem( IDC_LIST );

	ListView_DeleteItem( wndList.m_hWnd, nIndex );				
}

LRESULT CConfigDlg::OnInitDialog(UINT uMsg, WPARAM wParam, LPARAM lParam, BOOL& bHandled)
{
	CAxDialogImpl<CConfigDlg>::OnInitDialog( uMsg, wParam, lParam, bHandled );

	TCHAR szTitle[ 64 ] = {};
	LoadString( _AtlBaseModule.GetResourceInstance(), IDS_PROJNAME, szTitle, 64 );
	SetWindowText( szTitle );

	CWindow wndList = GetDlgItem( IDC_LIST );

	ListView_SetExtendedListViewStyle( wndList.m_hWnd,
		ListView_GetExtendedListViewStyle( wndList.m_hWnd ) |
		LVS_EX_DOUBLEBUFFER | LVS_EX_FULLROWSELECT | LVS_EX_GRIDLINES |
		LVS_EX_ONECLICKACTIVATE );

	RECT rc;
	wndList.GetClientRect( &rc );

	LVCOLUMN col = { LVCF_FMT | LVCF_TEXT | LVCF_WIDTH, LVCFMT_LEFT };
	col.cx = 70;
	col.pszText = _T("Extension");
	ListView_InsertColumn( wndList.m_hWnd, 0, &col );
	col.cx = rc.right - rc.left - col.cx - GetSystemMetrics( SM_CXVSCROLL ) - 2;
	col.pszText = _T("Command line");
	ListView_InsertColumn( wndList.m_hWnd, 1, &col );

	Load();

	Select( -1 );

	bHandled = TRUE;
	return 1;  // Let the system set the focus
}

LRESULT CConfigDlg::OnClickedOK(WORD /*wNotifyCode*/, WORD wID, HWND /*hWndCtl*/, BOOL& bHandled)
{
	Save();

	EndDialog( wID );

	bHandled = TRUE;
	return 0;
}

LRESULT CConfigDlg::OnClickedCancel(WORD /*wNotifyCode*/, WORD wID, HWND /*hWndCtl*/, BOOL& bHandled)
{
	EndDialog( wID );

	bHandled = TRUE;
	return 0;
}

LRESULT CConfigDlg::OnBnClickedAdd(WORD /*wNotifyCode*/, WORD /*wID*/, HWND /*hWndCtl*/, BOOL& bHandled)
{
	AddNew();

	bHandled = TRUE;
	return 0;
}

LRESULT CConfigDlg::OnBnClickedDel(WORD /*wNotifyCode*/, WORD /*wID*/, HWND /*hWndCtl*/, BOOL& bHandled)
{
	int nIndex = ( m_nActive != -1 ) ? m_nActive : GetActive();
	if ( nIndex != -1 )
	{
		Select( nIndex );

		TCHAR szTitle[ 64 ] = {};
		LoadString( _AtlBaseModule.GetResourceInstance(), IDS_PROJNAME, szTitle, 64 );
		if ( MessageBox( _T("Delete this item?"), szTitle, MB_YESNO | MB_ICONQUESTION ) == IDYES )
		{
			Delete( nIndex );
		}
	}

	bHandled = TRUE;
	return 0;
}

LRESULT CConfigDlg::OnNMClickList(int /*idCtrl*/, LPNMHDR /*pNMHDR*/, BOOL& bHandled)
{
	Select( GetActive() );

	bHandled = TRUE;
	return 0;
}

LRESULT CConfigDlg::OnBnClickedBrowse(WORD /*wNotifyCode*/, WORD /*wID*/, HWND /*hWndCtl*/, BOOL& bHandled)
{
	if ( m_nActive != -1 )
	{
		CWindow wndList = GetDlgItem( IDC_LIST );

		TCHAR szCommand[ MAX_PATH ] = {};
		GetDlgItemText( IDC_COMMAND, szCommand, _countof( szCommand ) );

		TCHAR szPath[ MAX_PATH ];
		lstrcpyn( szPath, szCommand, _countof( szPath ) );
		PathRemoveArgs( szPath );
		PathUnquoteSpaces( szPath );

		OPENFILENAME ofn =
		{
			sizeof( OPENFILENAME ),
			m_hWnd,
			NULL,
			_T("Applications (*.exe)\0*.exe\0All Files (*.*)\0*.*\0\0"),
			NULL,
			0,
			0,
			szPath,
			_countof( szPath ),
			NULL,
			0,
			NULL,
			NULL,
			OFN_EXPLORER | OFN_NOCHANGEDIR | OFN_PATHMUSTEXIST
		};

		if ( GetOpenFileName( &ofn ) )
		{
			lstrcpyn( szCommand, szPath, _countof( szCommand ) );
			PathQuoteSpaces( szCommand );

			// Detect well-known previewers
			LPCTSTR szFilename = &szPath[ ofn.nFileOffset ];
			if ( lstrcmpi( szFilename, _T("DivFix++.exe") ) == 0 )
			{
				// DivFix++
				lstrcat( szCommand, _T(" -nk -i \"%1\" -o \"%2\"") );
			}
			else
			{
				// Unknown
				lstrcat( szCommand, _T(" \"%1\" \"%2\"") );
			}

			SetDlgItemText( IDC_COMMAND, szCommand );
			ListView_SetItemText( wndList.m_hWnd, m_nActive, 1, szCommand );

			UpdateWindow();
		}
	}

	bHandled = TRUE;
	return 0;
}

LRESULT CConfigDlg::OnLvnItemActivateList(int /*idCtrl*/, LPNMHDR pNMHDR, BOOL& bHandled)
{
	LPNMITEMACTIVATE pNMIA = reinterpret_cast< LPNMITEMACTIVATE >( pNMHDR );

	Update( pNMIA->iItem );

	bHandled = TRUE;
	return 0;
}

LRESULT CConfigDlg::OnEnChangeExt(WORD /*wNotifyCode*/, WORD /*wID*/, HWND /*hWndCtl*/, BOOL& bHandled)
{
	if ( m_nActive != -1 )
	{
		CWindow wndList = GetDlgItem( IDC_LIST );

		TCHAR szExt[ MAX_PATH ] = {};
		GetDlgItemText( IDC_EXT, szExt, _countof( szExt ) );

		ListView_SetItemText( wndList.m_hWnd, m_nActive, 0, szExt );
	}

	bHandled = TRUE;
	return 0;
}

LRESULT CConfigDlg::OnEnChangeCommand(WORD /*wNotifyCode*/, WORD /*wID*/, HWND /*hWndCtl*/, BOOL& bHandled)
{
	if ( m_nActive != -1 )
	{
		CWindow wndList = GetDlgItem( IDC_LIST );

		TCHAR szCommand[ MAX_PATH ] = {};
		GetDlgItemText( IDC_COMMAND, szCommand, _countof( szCommand ) );

		ListView_SetItemText( wndList.m_hWnd, m_nActive, 1, szCommand );
	}

	bHandled = TRUE;
	return 0;
}
