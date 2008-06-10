//
// LibraryBuilderInternals.h
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

class CXMLElement;

class CLibraryBuilderInternals
{
private:
	static LPCTSTR	pszID3Genre[];

public:
	int			LookupID3v1Genre(const CString& strGenre) const;
	bool		ExtractMetadata(DWORD nIndex, const CString& strPath, HANDLE hFile);

private:
	// ID3v1 and ID3v2 and MP3
	bool		ReadID3v1(DWORD nIndex, HANDLE hFile, CXMLElement* pXML = NULL);
	bool		CopyID3v1Field(CXMLElement* pXML, LPCTSTR pszAttribute, CString strValue);
	bool		ReadID3v2(DWORD nIndex, HANDLE hFile);
	bool		CopyID3v2Field(CXMLElement* pXML, LPCTSTR pszAttribute, BYTE* pBuffer, DWORD nLength, bool bSkipLanguage = false);
	bool		ReadMP3Frames(DWORD nIndex, HANDLE hFile);
	bool		ScanMP3Frame(CXMLElement* pXML, HANDLE hFile, DWORD nIgnore);

	// Module Version
	bool		ReadVersion(DWORD nIndex, LPCTSTR pszPath);
	bool		CopyVersionField(CXMLElement* pXML, LPCTSTR pszAttribute, BYTE* pBuffer, LPCTSTR pszKey, DWORD nLangId, bool bCommaToDot = false);
	CString		GetVersionKey(BYTE* pBuffer, LPCTSTR pszKey, DWORD nLangId);
	DWORD		GetBestLanguageId(LPVOID pBuffer);
	bool		GetLanguageId(LPVOID pBuffer, UINT nSize, WORD nLangId, DWORD &nId, bool bOnlyPrimary = false);

	// Module Manifest Validation
	bool		ValidateManifest(LPCTSTR pszPath);

	// Windows Installer
	bool		ReadMSI(DWORD nIndex, LPCTSTR pszPath);
	CString		GetSummaryField(MSIHANDLE hSummaryInfo, UINT nProperty);

	// Image Files
	bool		ReadJPEG(DWORD nIndex, HANDLE hFile);
	bool		ReadGIF(DWORD nIndex, HANDLE hFile);
	bool		ReadPNG(DWORD nIndex, HANDLE hFile);
	bool		ReadBMP(DWORD nIndex, HANDLE hFile);

	// General Media
	bool		ReadASF(DWORD nIndex, HANDLE hFile);
	bool		ReadAVI(DWORD nIndex, HANDLE hFile);
	bool		ReadMPEG(DWORD nIndex, HANDLE hFile);
	bool		ReadOGG(DWORD nIndex, HANDLE hFile);
	BYTE*		ReadOGGPage(HANDLE hFile, DWORD& nBuffer, BYTE nFlags, DWORD nSequence, DWORD nMinSize = 0);
	bool		ReadOGGString(BYTE*& pOGG, DWORD& nOGG, CString& str);
	bool		ReadAPE(DWORD nIndex, HANDLE hFile, bool bPreferFooter = false);
	bool		ReadMPC(DWORD nIndex, HANDLE hFile);
	bool		ReadPDF(DWORD nIndex, HANDLE hFile, LPCTSTR pszPath);
	CString		ReadLine(HANDLE hFile, LPCTSTR pszSeparators = NULL);
	CString		ReadLineReverse(HANDLE hFile, LPCTSTR pszSeparators = NULL);
	bool		ReadCollection(DWORD nIndex, HANDLE hFile);
	bool		ReadCHM(DWORD nIndex, HANDLE hFile, LPCTSTR pszPath);
	CString		DecodePDFText(CString& strInput);
	bool		ReadTorrent(DWORD nIndex, HANDLE hFile, LPCTSTR pszPath);
};
