//
// Buffer.h
//
// Copyright (c) Shareaza Development Team, 2002-2010.
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

// CBuffer holds some memory, and takes care of allocating and freeing it itself
// http://shareazasecurity.be/wiki/index.php?title=Developers.Code.CBuffer

#pragma once

// Produces two arguments divided by comma, where first argument is a string itself
// and second argument is a string length without null terminator
#define _P(x)	(x),((sizeof(x))/sizeof((x)[0])-1)
#define _PT(x)	_P(_T(x))


// A buffer of memory that takes care of allocating and freeing itself, and has methods for compression and encoding
class CBuffer
{
public:
	CBuffer();
	~CBuffer();

	CBuffer*	m_pNext;	// A pointer to the next CBuffer object, letting them be linked together in a list
	BYTE*		m_pBuffer;	// The block of allocated memory
	DWORD		m_nLength;	// The #bytes written into the block

private:
	DWORD		m_nBuffer;	// The size of the allocated block

	CBuffer(const CBuffer&);
	CBuffer& operator=(const CBuffer&);

// Accessors
public:
	inline DWORD GetBufferSize() const { return m_nBuffer; }// Return the total size of the buffer
	inline BYTE* GetData() const { return m_pBuffer; }		// Return a pointer to the start of the data in the buffer
	inline DWORD GetCount() const { return m_nLength; }		// Return the filled size of the buffer

// Operations
public:
	void	Add(const void* pData, const size_t nLength) throw();					// Add data to the end of the buffer
	void	Insert(const DWORD nOffset, const void* pData, const size_t nLength);	// Insert the data into the buffer
	void	Remove(const size_t nLength) throw();									// Removes data from the start of the buffer
	DWORD	AddBuffer(CBuffer* pBuffer, const size_t nLength);						// Copy all or part of the data in another CBuffer object into this one
	bool	EnsureBuffer(const size_t nLength) throw();								// Tell the buffer to prepare to recieve this number of additional bytes
	void	AddReversed(const void* pData, const size_t nLength);					// Add data to this buffer, but with the bytes in reverse order

	// Convert Unicode text to ASCII and add it to the buffer
	void	Print(const LPCWSTR pszText, const size_t nLength, const UINT nCodePage = CP_ACP);

	inline DWORD ReadDWORD() const throw()
	{
		return ( m_nLength >= 4 ) ? *reinterpret_cast< DWORD* >( m_pBuffer ) : 0;
	}

	// Read the data in the buffer as text
	CString ReadString(const size_t nBytes, const UINT nCodePage = CP_ACP);          // Reads nBytes of ASCII characters as a string

	BOOL	Read(void* pData, const size_t nLength) throw();
	BOOL    ReadLine(CString& strLine, BOOL bPeek = FALSE, UINT nCodePage = CP_ACP); // Reads until "\r\n"
	BOOL    StartsWith(LPCSTR pszString, const size_t nLength, const BOOL bRemove = FALSE) throw();// Returns true if the buffer starts with this text

	// Use the buffer with a socket
#ifdef _WINSOCKAPI_
	DWORD	Receive(SOCKET hSocket, DWORD nSpeedLimit = ~0ul);	// Move incoming data from the socket to this buffer
	DWORD	Send(SOCKET hSocket, DWORD nSpeedLimit = ~0ul);		// Send the contents of this buffer to the computer on the far end of the socket
#endif // _WINSOCKAPI_

	// Use the buffer with the ZLib compression library
#ifdef ZLIB_H
	BOOL	Deflate(BOOL bIfSmaller = FALSE);						// Compress the data in this buffer
	BOOL	Inflate();												// Decompress the data in this buffer in place
	bool	InflateStreamTo(CBuffer& oBuffer, z_streamp& pStream);	// Decompress the data in this buffer into another buffer
	void	InflateStreamCleanup(z_streamp& pStream) const;			// Stop stream decompression and cleanup
	BOOL	Ungzip();												// Delete the gzip header and then remove the compression
#endif // ZLIB_H

	// Read and write a DIME message in the buffer
	void	WriteDIME(DWORD nFlags, LPCSTR pszID, size_t nIDLength, LPCSTR pszType, size_t nTypeLength, LPCVOID pBody, size_t nBody);
	BOOL	ReadDIME(DWORD* pnFlags, CString* psID, CString* psType, DWORD* pnBody);

// Inlines
public:
	// Clears the memory from the buffer
	inline void	Clear() throw()
	{
		m_nLength = 0;
	}

	// Copy all or part of the data in another CBuffer object into this one
	DWORD	AddBuffer(CBuffer* pBuffer) { return AddBuffer( pBuffer, pBuffer->m_nLength ); }

	// Add ASCII text to the buffer
	void	Print(const LPCSTR pszText, const size_t nLength) { Add( (void*)pszText, nLength ); }
	void	Print(const CStringA& strText) { Print( (LPCSTR)strText, strText.GetLength() ); }

	// Convert Unicode text to ASCII and add it to the buffer
	void	Print(const CStringW& strText, const UINT nCodePage = CP_ACP) { Print( (LPCWSTR)strText, strText.GetLength(), nCodePage); }

	// Add ASCII text to the start of this buffer, shifting everything else forward
	void	Prefix(LPCSTR pszText, const size_t nLength) { Insert( 0, (void*)pszText, nLength ); }

private:
	BYTE*	GetDataEnd() const { return m_pBuffer + m_nLength; }	// Return a pointer to the end of the data in the buffer
	size_t	GetBufferFree() const { return m_nBuffer - m_nLength; }	// Return the unused #bytes in the buffer

// Statics
public:
	static const DWORD	MAX_RECV_SIZE	= 1024ul * 16ul;	// Recieve up to 16KB blocks from the socket
	static const UINT	ZLIB_CHUNK_SIZE	= 1024u;			// Chunk size for ZLib compression/decompression

	// Static means you can call CBuffer::ReverseBuffer without having a CBuffer object at all
	static void ReverseBuffer(const void* pInput, void* pOutput, size_t nLength);
};
