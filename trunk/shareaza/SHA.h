//
// SHA.h
//
// Copyright (c) Shareaza Development Team, 2002-2004.
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

#if !defined(AFX_SHA_H__9CC84DD7_E62A_410F_BFE4_B6190C509ACE__INCLUDED_)
#define AFX_SHA_H__9CC84DD7_E62A_410F_BFE4_B6190C509ACE__INCLUDED_

#pragma once

#include "Hashes.h"

class CSHA1 : public CHashSHA1
{
private:
	QWORD	m_nCount;					// with alignment -> offset = 24 not 20
	DWORD	m_nBuffer[16];
public:
	inline	CSHA1();
	inline	~CSHA1();
	inline	void	Reset();
	inline	void	Add(LPCVOID pData, DWORD nLength);
	inline	void	Finish();
private:
	typedef	void	(__stdcall *tpAdd1)	(CSHA1*, LPCVOID pData);
	typedef	void	(__stdcall *tpAdd2)	(CSHA1*, LPCVOID pData1, CSHA1*, LPCVOID pData2);
	typedef	void	(__stdcall *tpAdd3)	(CSHA1*, LPCVOID pData1, CSHA1*, LPCVOID pData2, CSHA1*, LPCVOID pData3);
	typedef	void	(__stdcall *tpAdd4)	(CSHA1*, LPCVOID pData1, CSHA1*, LPCVOID pData2, CSHA1*, LPCVOID pData3, CSHA1*, LPCVOID pData4);
	typedef	void	(__stdcall *tpAdd5)	(CSHA1*, LPCVOID pData1, CSHA1*, LPCVOID pData2, CSHA1*, LPCVOID pData3, CSHA1*, LPCVOID pData4, CSHA1*, LPCVOID pData5);
	typedef	void	(__stdcall *tpAdd6)	(CSHA1*, LPCVOID pData1, CSHA1*, LPCVOID pData2, CSHA1*, LPCVOID pData3, CSHA1*, LPCVOID pData4, CSHA1*, LPCVOID pData5, CSHA1*, LPCVOID pData6);
	static	BYTE	SHA_PADDING[64];
public:
	static	tpAdd1	pAdd1;
	static	tpAdd2	pAdd2;
	static	tpAdd3	pAdd3;
	static	tpAdd4	pAdd4;
	static	tpAdd5	pAdd5;
	static	tpAdd6	pAdd6;
	static	void	Init();
};

typedef CSHA1 CBTH;

// This detects ICL and makes necessary changes for proper compilation
#if __INTEL_COMPILER > 0
#define asm_CSHA1_m_oHash	CSHA1.m_b
#define asm_CSHA1_m_nCount	CSHA1.m_nCount
#else
#define asm_CSHA1_m_oHash	CSHA1::m_b
#define asm_CSHA1_m_nCount	CSHA1::m_nCount
#endif

inline CSHA1::CSHA1()
{
	Reset();
}

inline CSHA1::~CSHA1()
{
}

inline void CSHA1::Reset()
{
    m_d[ 0 ] = 0x67452301;
    m_d[ 1 ] = 0xefcdab89;
    m_d[ 2 ] = 0x98badcfe;
    m_d[ 3 ] = 0x10325476;
    m_d[ 4 ] = 0xc3d2e1f0;
	m_nCount = 0;
}

extern "C" void __stdcall SHA_Add_p5(CSHA1* pSHA, LPCVOID pData, DWORD nLength);

inline void CSHA1::Add(LPCVOID pData, DWORD nLength)
{
	SHA_Add_p5( this, pData, nLength );
}

inline void CSHA1::Finish()
{
	DWORD index = (DWORD)m_nCount & 0x3f;
	// unsigned int index = (unsigned int)(m_nCount[0] & 0x3f),
	QWORD nBits;
	// Save number of bits
	_asm
	{
		mov		ecx, this
		mov		eax, [ ecx + asm_CSHA1_m_nCount ]
		mov		edx, [ ecx + asm_CSHA1_m_nCount + 4 ]
		shld	edx, eax, 3
		shl		eax, 3
		bswap	edx
		bswap	eax
		mov		dword ptr [ nBits ], edx
		mov		dword ptr [ nBits + 4 ], eax
	}
	SHA_Add_p5(this, SHA_PADDING, (index < 56) ? (56 - index) : (120 - index) );
	// Append length (before padding)
	SHA_Add_p5(this, &nBits, 8 );
	// Swap bytes in each dword since SHA is big endian
	__asm
	{
		mov		ecx, this
		mov		eax, [ ecx + asm_CSHA1_m_oHash + 0 * 4 ]
		mov		ebx, [ ecx + asm_CSHA1_m_oHash + 1 * 4 ]
		mov		edx, [ ecx + asm_CSHA1_m_oHash + 2 * 4 ]
		mov		esi, [ ecx + asm_CSHA1_m_oHash + 3 * 4 ]
		mov		edi, [ ecx + asm_CSHA1_m_oHash + 4 * 4 ]
		bswap	eax
		bswap	ebx
		bswap	edx
		bswap	esi
		bswap	edi
		mov		[ ecx + asm_CSHA1_m_oHash + 0 * 4 ], eax
		mov		[ ecx + asm_CSHA1_m_oHash + 1 * 4 ], ebx
		mov		[ ecx + asm_CSHA1_m_oHash + 2 * 4 ], edx
		mov		[ ecx + asm_CSHA1_m_oHash + 3 * 4 ], esi
		mov		[ ecx + asm_CSHA1_m_oHash + 4 * 4 ], edi
	}
}

#endif // !defined(AFX_SHA_H__9CC84DD7_E62A_410F_BFE4_B6190C509ACE__INCLUDED_)
