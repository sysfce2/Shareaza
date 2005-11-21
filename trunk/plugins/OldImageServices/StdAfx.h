//
// StdAfx.h
//
// Copyright (c) Michael Stokes, 2002-2004.
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

#ifndef STDAFX_H_INCLUDED
#define STDAFX_H_INCLUDED

//#define _CRT_SECURE_NO_DEPRECATE
//#pragma warning ( disable : 4100 4127 )

#ifndef STRICT
#define STRICT
#endif

#ifndef _WIN32_WINNT		// Allow use of features specific to Windows NT 4 or later.
#define _WIN32_WINNT 0x0400	// Change this to the appropriate value to target Windows 2000 or later.
#endif

#define _ATL_FREE_THREADED
#define _ATL_NO_AUTOMATIC_NAMESPACE

#include <atlbase.h>
#include <atlcom.h>

#include "resource.h"

#include <boost/smart_ptr.hpp>

using namespace ATL;

// Simple Wrapper for RAII to make exception handling simpler
struct HandleWrapper
{
	HANDLE file_;
	explicit HandleWrapper(HANDLE file) : file_( file ) {}
	~HandleWrapper() { if ( file_ != INVALID_HANDLE_VALUE ) CloseHandle( file_ ); }
};

#endif // #ifndef STDAFX_H_INCLUDED
