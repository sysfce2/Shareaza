//
// DownloadTask.h
//
// Copyright (c) Shareaza Development Team, 2002-2012.
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

#include "FileFragments.hpp"
#include "ThreadImpl.h"

class CDownload;
class CHttpRequest;


enum dtask
{
	dtaskNone = 0,			// No task
	dtaskAllocate,			// Allocating...
	dtaskCopy,				// Moving...
	dtaskPreviewRequest,	// Previewing...
	dtaskMergeFile			// Merging...
};


class CDownloadTask : public CThreadImpl
{
public:
	static void			Copy(CDownload* pDownload);
	static void			PreviewRequest(CDownload* pDownload, LPCTSTR szURL);
	static void			MergeFile(CDownload* pDownload, CList< CString >* pFiles, BOOL bValidation = TRUE, const Fragments::List* pGaps = NULL);

	bool				HasSucceeded() const;
	void				Abort();
	bool				WasAborted() const;
	DWORD				GetFileError() const;
	dtask				GetTaskType() const;
	CString				GetRequest() const;
	// Get progress of current operation (0..100%)
	float				GetProgress() const;
	CBuffer*			IsPreviewAnswerValid(const Hashes::Sha1Hash& oRequestedSHA1) const;

protected:
	CDownloadTask(CDownload* pDownload, dtask nTask);
	virtual ~CDownloadTask();

	dtask				m_nTask;
	CAutoPtr< CHttpRequest > m_pRequest;
	bool				m_bSuccess;
	CString				m_sFilename;
	CString				m_sDestination;
	DWORD				m_nFileError;
	CDownload*			m_pDownload;
	QWORD				m_nSize;
	CList< CString >	m_oMergeFiles;		// Source filenames
	Fragments::List		m_oMergeGaps;		// Missed ranges in source file
	BOOL				m_bMergeValidation;	// Run validation after merging
	POSITION			m_posTorrentFile;	// Torrent file list current position
	float				m_fProgress;		// Progress of current operation (0..100%)

	static DWORD CALLBACK CopyProgressRoutine(LARGE_INTEGER TotalFileSize,
		LARGE_INTEGER TotalBytesTransferred, LARGE_INTEGER StreamSize,
		LARGE_INTEGER StreamBytesTransferred, DWORD dwStreamNumber,
		DWORD dwCallbackReason, HANDLE hSourceFile, HANDLE hDestinationFile,
		LPVOID lpData);

//	void				RunAllocate();
	void				RunCopy();
	void				RunPreviewRequest();
	void				RunMerge();
	void				OnRun();
};
