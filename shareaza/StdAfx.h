//
// StdAfx.h
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

#pragma once

//
// Configuration
//

#define WINVER			0x0500		// Windows Version
#define _WIN32_WINDOWS	0x0500		// Windows Version
#define _WIN32_WINNT	0x0500		// NT Version
#define _WIN32_IE		0x0500		// IE Version
#define _WIN32_DCOM					// DCOM
#define _AFX_NO_RICHEDIT_SUPPORT	// No RichEdit

//
// MFC
//

#include <afxwin.h>         // MFC core and standard components
#include <afxext.h>         // MFC extensions
#include <afxcmn.h>			// MFC support for Windows Common Controls
#include <afxtempl.h>		// MFC templates
#include <afxmt.h>			// MFC threads
#include <afxole.h>			// MFC OLE
#include <afxocc.h>			// MDC OCC
#include <afxhtml.h>		// MFC HTML

//
// WIN32
//

#include <winsock2.h>		// Windows sockets V2
#include <objbase.h>		// OLE
#include <shlobj.h>			// Shell objects
#include <wininet.h>		// Internet
#include <ddeml.h>			// DDE
#include <math.h>			// Math

#undef IDC_HAND

//
// Missing constants
//

#define BIF_NEWDIALOGSTYLE	0x0040
#define OFN_ENABLESIZING	0x00800000

#undef NULL
#undef min
#undef max

//
// Standard headers
//

#include <algorithm>
#undef NULL

const int NULL = 0;
using std::min;
using std::max;

//
// 64-bit type
//

typedef unsigned __int64 QWORD;

//
// Tristate type
//

typedef int TRISTATE;

#define TS_UNKNOWN	0
#define TS_FALSE	1
#define TS_TRUE		2

//
// GUID
//

typedef union
{
	BYTE	n[16];
	BYTE	b[16];
	DWORD	w[4];
} GGUID;

inline bool operator==(const GGUID& guidOne, const GGUID& guidTwo)
{
   return (
      ((PLONG)&guidOne)[0] == ((PLONG)&guidTwo)[0] &&
      ((PLONG)&guidOne)[1] == ((PLONG)&guidTwo)[1] &&
      ((PLONG)&guidOne)[2] == ((PLONG)&guidTwo)[2] &&
      ((PLONG)&guidOne)[3] == ((PLONG)&guidTwo)[3] );
}

inline bool operator!=(const GGUID& guidOne, const GGUID& guidTwo)
{
   return (
      ( (PLONG)&guidOne)[0] != ((PLONG)&guidTwo)[0] ||
      ( (PLONG)&guidOne)[1] != ((PLONG)&guidTwo)[1] ||
      ( (PLONG)&guidOne)[2] != ((PLONG)&guidTwo)[2] ||
      ( (PLONG)&guidOne)[3] != ((PLONG)&guidTwo)[3] );
}

#define SIZE_UNKNOWN	0xFFFFFFFFFFFFFFFF

//
// Hash values
//

typedef union
{
	BYTE	n[20];
	BYTE	b[20];
} SHA1;

typedef union
{
	BYTE	n[24];
	BYTE	b[24];
	QWORD	w[3];
} TIGEROOT;

typedef union
{
	BYTE	n[16];
	BYTE	b[16];
	DWORD	w[4];
} MD4, MD5;

#define HASH_NULL		0
#define HASH_SHA1		1
#define HASH_MD5		2
#define HASH_TIGERTREE	3
#define HASH_ED2K		4
#define HASH_TORRENT	5

//
// Protocol IDs
//

typedef int PROTOCOLID;

#define PROTOCOL_NULL	0
#define PROTOCOL_G1		1
#define PROTOCOL_G2		2
#define PROTOCOL_ED2K	3

#define PROTOCOL_HTTP	4
#define PROTOCOL_FTP	5
#define PROTOCOL_BT		6

class CQuickLock
{
public:
	explicit CQuickLock(CSyncObject& oMutex) : m_oMutex( oMutex ) { oMutex.Lock(); }
	~CQuickLock() { m_oMutex.Unlock(); }
private:
	CSyncObject& m_oMutex;
	CQuickLock(const CQuickLock&);
	CQuickLock& operator=(const CQuickLock&);
	static void* operator new(std::size_t);
	static void* operator new[](std::size_t);
	static void operator delete(void*);
	static void operator delete[](void*);
	CQuickLock* operator&();
};

template< class T >
class CGuarded
{
public:
	explicit CGuarded() : m_oSection(), m_oValue() { }
	explicit CGuarded(const CGuarded& other) : m_oSection(), m_oValue( other ) { }
	CGuarded(const T& oValue) : m_oSection(), m_oValue( oValue ) { }
	CGuarded& operator=(const T& oValue)
	{
		CQuickLock oLock( m_oSection );
		m_oValue = oValue;
		return *this;
	}
	operator T() const
	{
		CQuickLock oLock( m_oSection );
		return m_oValue;
	}
private:
	mutable CCriticalSection m_oSection;
	T m_oValue;
	CGuarded* operator&(); // too unsafe
};

class CLowerCaseTable
{
public:
	explicit CLowerCaseTable()
	{
		for ( size_t i = 0 ; i < 65536 ; ++i ) cTable[ i ] = i;
		cTable[ 65536 ] = 0;
		CharLower( &cTable[ 1 ] );
		cTable[ 304 ] = 105; // turkish capital I with dot is converted to "i"
		// convert fullwidth characters to halfwidth
		for ( size_t i = 65281 ; i < 65313 ; ++i ) cTable[ i ] = i - 65248;
		for ( size_t i = 65313 ; i < 65339 ; ++i ) cTable[ i ] = i - 65216;
		for ( size_t i = 65339 ; i < 65375 ; ++i ) cTable[ i ] = i - 65248;
	};
	const TCHAR& operator()(const TCHAR cLookup) const { return cTable[ cLookup ]; }
	const TCHAR& operator[](const TCHAR cLookup) const { return ( *this )( cLookup ); }
private:
	TCHAR CLowerCaseTable::cTable[ 65537 ];
};

const CLowerCaseTable ToLowerCase;