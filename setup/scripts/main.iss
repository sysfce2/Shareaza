; WARNING: Compile repair.iss first!

#define version GetFileVersion("..\builds\Shareaza.exe")

[Setup]
AppComments=Shareaza Ultimate File Sharing
AppId=Shareaza
AppName=Shareaza
AppPublisher=Shareaza Development Team
AppVersion={#version}
AppVerName=Shareaza {#version}
VersionInfoVersion={#version}
DefaultDirName={ini:{param:SETTINGS|},Locations,Path|{reg:HKLM\SOFTWARE\Shareaza,|{pf}\Shareaza}}
DirExistsWarning=no
DefaultGroupName=Shareaza
AllowNoIcons=yes
OutputDir=setup\builds
OutputBaseFilename=Shareaza_{#version}
SolidCompression=yes
Compression=lzma/ultra
InternalCompressLevel=Ultra
VersionInfoCompany=Shareaza Development Team
VersionInfoDescription=Shareaza Ultimate File Sharing
PrivilegesRequired=poweruser
ShowLanguageDialog=auto
LanguageDetectionMethod=locale
UninstallDisplayIcon={app}\Uninstall\uninstall.ico
UninstallDisplayName={cm:NameAndVersion,Shareaza,{#version}}
UninstallFilesDir={app}\Uninstall
SetupIconFile=setup\misc\install.ico
ShowComponentSizes=no
WizardImageFile=setup\misc\sidebar.bmp
WizardSmallImageFile=setup\misc\corner.bmp
AppModifyPath="{app}\Uninstall\repair.exe"
ChangesAssociations=yes

; Set the CVS root as source dir (up 2 levels)
SourceDir=..\..

; links to website for software panel
AppPublisherURL=http://www.shareaza.com/?id=home
AppSupportURL=http://www.shareaza.com/?id=support
AppUpdatesURL=http://www.shareaza.com/?id=download

[Components]
; Ask user wich components to install
Name: "language"; Description: "{cm:components_languages}"; Types: full; Flags: disablenouninstallwarning

[Tasks]
Name: "multiuser"; Description: "{cm:tasks_multisetup}"
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"
Name: "quicklaunch"; Description: "{cm:CreateQuickLaunchIcon}"

[Files]
; Install unicows.dll on Win 9X
Source: "setup\builds\unicows.dll"; DestDir: "{app}"; Flags: overwritereadonly replacesameversion restartreplace uninsremovereadonly sortfilesbyextension; MinVersion: 4.0,0
Source: "setup\builds\unicows.dll"; DestDir: "{sys}"; Flags: overwritereadonly replacesameversion restartreplace sharedfile uninsneveruninstall sortfilesbyextension regserver noregerror; MinVersion: 4.0,0

; Main files
Source: "setup\builds\1.dll"; DestDir: "{app}"; DestName: "zlib.dll"; Flags: overwritereadonly replacesameversion restartreplace uninsremovereadonly sortfilesbyextension
Source: "setup\builds\1.dll"; DestDir: "{app}\Plugins"; DestName: "zlib.dll"; Flags: overwritereadonly replacesameversion restartreplace uninsremovereadonly sortfilesbyextension
Source: "setup\builds\Shareaza.exe"; DestDir: "{app}"; Flags: overwritereadonly replacesameversion restartreplace uninsremovereadonly sortfilesbyextension
Source: "setup\builds\skin.exe"; DestDir: "{app}"; Flags: overwritereadonly replacesameversion restartreplace uninsremovereadonly sortfilesbyextension
Source: "Schemas\*"; DestDir: "{app}\Schemas"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension

; Set up data dir in {app}
Source: "Data\Emoticons.bmp"; DestDir: "{app}\Data"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "Data\Emoticons.xml"; DestDir: "{app}\Data"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "Data\gwebcache.txt"; DestDir: "{app}\Data"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension skipifsourcedoesntexist
Source: "Data\Vendors.xml"; DestDir: "{app}\Data"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "Data\WorldGPS.dat"; DestDir: "{app}\Data"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "Data\DefaultAvatar.png"; DestDir: "{app}\Data"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension

; Copy repair installer
Source: "setup\builds\repair.exe"; DestDir: "{app}\Uninstall"; Flags: uninsremovereadonly sortfilesbyextension onlyifdoesntexist

; Plugins
; Don't register RazaWebHook.dll since it will setup Shareaza as download manager
Source: "setup\plugins\*.dll"; DestDir: "{app}\Plugins"; Flags: overwritereadonly replacesameversion restartreplace uninsremovereadonly sortfilesbyextension regserver; Excludes: "RazaWebHook.dll"; MinVersion: 0,4.0
Source: "setup\plugins\*.dll"; DestDir: "{app}\Plugins"; Flags: overwritereadonly replacesameversion uninsremovereadonly sortfilesbyextension regserver; Excludes: "RazaWebHook.dll"; MinVersion: 4.0,0
Source: "setup\plugins\RazaWebHook.dll"; DestDir: "{app}\Plugins"; Flags: overwritereadonly replacesameversion restartreplace uninsremovereadonly sortfilesbyextension; MinVersion: 0,4.0
Source: "setup\plugins\RazaWebHook.dll"; DestDir: "{app}\Plugins"; Flags: overwritereadonly replacesameversion uninsremovereadonly sortfilesbyextension; MinVersion: 4.0,0

; Uninstall icon for software panel
Source: "setup\misc\uninstall.ico"; DestDir: "{app}\Uninstall"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension

; Skins
Source: "Skins\*"; DestDir: "{app}\Skins"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension recursesubdirs; Excludes: "CVS"

; Languages: English gets installed by default
Source: "Languages\default-en.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "Languages\*"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Components: "language"; Excludes: "default-en.xml"

; Copy skins back from {userappdata}\Shareaza\Skins
Source: "{userappdata}\Shareaza\Skins\*"; DestDir: "{app}\Skins"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist recursesubdirs; AfterInstall: DeleteMultiSkinDir

; Switch user data between locations
Source: "{ini:{param:SETTINGS|},Locations,Path|{reg:HKCU\Software\Shareaza\Shareaza,Path|{app}}}\Data\Library1.dat"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: multiuser
Source: "{ini:{param:SETTINGS|},Locations,Path|{reg:HKCU\Software\Shareaza\Shareaza,Path|{app}}}\Data\Library2.dat"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: multiuser
Source: "{ini:{param:SETTINGS|},Locations,Path|{reg:HKCU\Software\Shareaza\Shareaza,Path|{app}}}\Data\DownloadGroups.dat"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: multiuser
Source: "{ini:{param:SETTINGS|},Locations,Path|{reg:HKCU\Software\Shareaza\Shareaza,Path|{app}}}\Data\TigerTree.dat"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: multiuser
Source: "{ini:{param:SETTINGS|},Locations,Path|{reg:HKCU\Software\Shareaza\Shareaza,Path|{app}}}\Data\Security.dat"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: multiuser
Source: "{ini:{param:SETTINGS|},Locations,Path|{reg:HKCU\Software\Shareaza\Shareaza,Path|{app}}}\Data\UploadQueues.dat"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: multiuser
Source: "{ini:{param:SETTINGS|},Locations,Path|{reg:HKCU\Software\Shareaza\Shareaza,Path|{app}}}\Data\Searches.dat"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: multiuser
Source: "{ini:{param:SETTINGS|},Locations,Path|{reg:HKCU\Software\Shareaza\Shareaza,Path|{app}}}\Data\Profile.xml"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: multiuser
Source: "{ini:{param:SETTINGS|},Locations,UserPath|{reg:HKCU\Software\Shareaza\Shareaza,UserPath|{userappdata}\Shareaza}}\Data\Library1.dat"; DestDir: "{app}\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: not multiuser
Source: "{ini:{param:SETTINGS|},Locations,UserPath|{reg:HKCU\Software\Shareaza\Shareaza,UserPath|{userappdata}\Shareaza}}\Data\Library2.dat"; DestDir: "{app}\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: not multiuser
Source: "{ini:{param:SETTINGS|},Locations,UserPath|{reg:HKCU\Software\Shareaza\Shareaza,UserPath|{userappdata}\Shareaza}}\Data\DownloadGroups.dat"; DestDir: "{app}\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: not multiuser
Source: "{ini:{param:SETTINGS|},Locations,UserPath|{reg:HKCU\Software\Shareaza\Shareaza,UserPath|{userappdata}\Shareaza}}\Data\TigerTree.dat"; DestDir: "{app}\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: not multiuser
Source: "{ini:{param:SETTINGS|},Locations,UserPath|{reg:HKCU\Software\Shareaza\Shareaza,UserPath|{userappdata}\Shareaza}}\Data\Security.dat"; DestDir: "{app}\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: not multiuser
Source: "{ini:{param:SETTINGS|},Locations,UserPath|{reg:HKCU\Software\Shareaza\Shareaza,UserPath|{userappdata}\Shareaza}}\Data\UploadQueues.dat"; DestDir: "{app}\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: not multiuser
Source: "{ini:{param:SETTINGS|},Locations,UserPath|{reg:HKCU\Software\Shareaza\Shareaza,UserPath|{userappdata}\Shareaza}}\Data\Searches.dat"; DestDir: "{app}\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; Tasks: not multiuser
Source: "{ini:{param:SETTINGS|},Locations,UserPath|{reg:HKCU\Software\Shareaza\Shareaza,UserPath|{userappdata}\Shareaza}}\Data\Profile.xml"; DestDir: "{app}\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist; AfterInstall: DeleteMultiDataDir; Tasks: not multiuser

; Copy installer into download and uninstall dir
Source: "{srcexe}"; DestDir: "{ini:{param:SETTINGS|},Locations,CompletePath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,CompletePath|{userdocs}\Downloads}}"; DestName: "Shareaza_{#version}.exe"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension external onlyifdoesntexist; Tasks: multiuser
Source: "{srcexe}"; DestDir: "{ini:{param:SETTINGS|},Locations,CompletePath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,CompletePath|{app}\Downloads}}"; DestName: "Shareaza_{#version}.exe"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension external onlyifdoesntexist; Tasks: not multiuser
Source: "{srcexe}"; DestDir: "{app}\Uninstall"; DestName: "setup.exe"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension external

[Icons]
; Shareaza icons
Name: "{userprograms}\{groupname}\Shareaza"; Filename: "{app}\Shareaza.exe"; WorkingDir: "{app}"; Comment: "{cm:reg_apptitle}"
Name: "{userdesktop}\Shareaza"; Filename: "{app}\Shareaza.exe"; WorkingDir: "{app}"; Comment: "{cm:reg_apptitle}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Shareaza"; Filename: "{app}\Shareaza.exe"; WorkingDir: "{app}"; Comment: "{cm:reg_apptitle}"; Tasks: quicklaunch

; Other icons in user language
Name: "{userprograms}\{groupname}\{cm:icons_license}"; Filename: "{app}\Uninstall\license.rtf"; WorkingDir: "{app}\Uninstall"; Comment: "{cm:icons_license}"
Name: "{userprograms}\{groupname}\{cm:icons_uninstall}"; Filename: "{uninstallexe}"; WorkingDir: "{app}\Uninstall"; Comment: "{cm:UninstallProgram,Shareaza}"; IconFilename: "{app}\Uninstall\uninstall.ico"
Name: "{userprograms}\{groupname}\{cm:icons_downloads}"; Filename: "{ini:{param:SETTINGS|},Locations,CompletePath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,CompletePath|{userdocs}\Downloads}}"; WorkingDir: "{ini:{param:SETTINGS|},Locations,CompletePath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,CompletePath|{userappdata}\Shareaza\Downloads}}"; Comment: "{cm:icons_downloads}"; Tasks: multiuser; Check: not WizardNoIcons
Name: "{userprograms}\{groupname}\{cm:icons_downloads}"; Filename: "{ini:{param:SETTINGS|},Locations,CompletePath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,CompletePath|{app}\Downloads}}"; WorkingDir: "{ini:{param:SETTINGS|},Locations,CompletePath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,CompletePath|{app}\Downloads}}"; Comment: "{cm:icons_downloads}"; Tasks: not multiuser; Check: not WizardNoIcons

[Messages]
; Overwrite standard ISL entries
; DO NOT use for localized messages
BeveledLabel=Shareaza Development Team

[Run]
; Run the skin installer at end of installation
Filename: "{app}\skin.exe"; Parameters: "/installsilent"; WorkingDir: "{app}"; StatusMsg: "{cm:run_skinexe}"
; Run Shareaza at end of installation
Filename: "{app}\Shareaza.exe"; Description: "{cm:LaunchProgram,Shareaza}"; WorkingDir: "{app}"; Flags: postinstall skipifsilent nowait

[UninstallRun]
; Run the skin installer at start of uninstallation and make sure it only runs once
Filename: "{app}\skin.exe"; Parameters: "/uninstallsilent"; WorkingDir: "{app}"; StatusMsg: "{cm:run_skinexe}"; RunOnceId: "uninstallskinexe"

[Registry]
; Write installation path to registry
Root: HKLM; Subkey: "SOFTWARE\Shareaza"; ValueType: string; ValueName: ; ValueData: "{app}"; Flags: uninsdeletekey deletevalue
Root: HKCU; Subkey: "Software\Shareaza\Shareaza"; ValueType: string; ValueName: "Path" ; ValueData: "{app}"; Flags: uninsdeletekey deletevalue
Root: HKCU; Subkey: "Software\Shareaza\Shareaza"; ValueType: string; ValueName: "UserPath" ; ValueData: "{ini:{param:SETTINGS|},Locations,UserPath|{userappdata}\Shareaza}"; Flags: uninsdeletekey deletevalue ; Tasks: multiuser
Root: HKCU; Subkey: "Software\Shareaza\Shareaza"; ValueType: string; ValueName: "UserPath" ; ValueData: "{ini:{param:SETTINGS|},Locations,UserPath|{app}}"; Flags: uninsdeletekey deletevalue; Tasks: not multiuser
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Shareaza.exe"; ValueType: string; ValueName: ; ValueData: "{app}\Shareaza.exe"; Flags: uninsdeletekey deletevalue
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Shareaza.exe"; ValueType: string; ValueName: "Path"; ValueData: "{app}"; Flags: uninsdeletekey deletevalue

; Install chat notify sound
Root: HKCU; Subkey: "AppEvents\EventLabels\RAZA_IncomingChat"; ValueType: string; ValueName: ; ValueData: "{cm:reg_incomingchat}"; Flags: uninsdeletekey
Root: HKCU; Subkey: "AppEvents\Schemes\Apps\Shareaza"; ValueType: string; ValueName: ; ValueData: "{cm:reg_apptitle}"; Flags: uninsdeletekey
Root: HKCU; Subkey: "AppEvents\Schemes\Apps\Shareaza\RAZA_IncomingChat\.current"; ValueType: string; ValueName: ; ValueData: "%SystemRoot%\media\notify.wav"; Flags: uninsdeletekey
Root: HKCU; Subkey: "AppEvents\Schemes\Apps\Shareaza\RAZA_IncomingChat\.default"; ValueType: string; ValueName: ; ValueData: "%SystemRoot%\media\notify.wav"; Flags: uninsdeletekey

; Set directory locations
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\Downloads"; ValueType: string; ValueName: "CompletePath"; ValueData: "{ini:{param:SETTINGS|},Locations,CompletePath|{userdocs}\Downloads}"; Flags: uninsdeletekey createvalueifdoesntexist; Tasks: multiuser
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\Downloads"; ValueType: string; ValueName: "IncompletePath"; ValueData: "{ini:{param:SETTINGS|},Locations,IncompletePath|{localappdata}\Shareaza\Incomplete}"; Flags: uninsdeletekey createvalueifdoesntexist; Tasks: multiuser
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\Downloads"; ValueType: string; ValueName: "TorrentPath"; ValueData: "{ini:{param:SETTINGS|},Locations,TorrentPath|{userappdata}\Shareaza\Torrents}"; Flags: uninsdeletekey createvalueifdoesntexist; Tasks: multiuser
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\Downloads"; ValueType: string; ValueName: "CollectionPath"; ValueData: "{ini:{param:SETTINGS|},Locations,CollectionPath|{userappdata}\Shareaza\Collections}"; Flags: uninsdeletekey createvalueifdoesntexist; Tasks: multiuser
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\Downloads"; ValueType: string; ValueName: "CompletePath"; ValueData: "{ini:{param:SETTINGS|},Locations,CompletePath|{app}\Downloads}"; Flags: uninsdeletekey createvalueifdoesntexist; Tasks: not multiuser
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\Downloads"; ValueType: string; ValueName: "IncompletePath"; ValueData: "{ini:{param:SETTINGS|},Locations,IncompletePath|{app}\Incomplete}"; Flags: uninsdeletekey createvalueifdoesntexist; Tasks: not multiuser
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\Downloads"; ValueType: string; ValueName: "TorrentPath"; ValueData: "{ini:{param:SETTINGS|},Locations,TorrentPath|{app}\Torrents}"; Flags: uninsdeletekey createvalueifdoesntexist; Tasks: not multiuser
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\Downloads"; ValueType: string; ValueName: "CollectionPath"; ValueData: "{ini:{param:SETTINGS|},Locations,CollectionPath|{app}\Collections}"; Flags: uninsdeletekey createvalueifdoesntexist; Tasks: not multiuser

; Delete keys at uninstall
Root: HKLM; Subkey: "SOFTWARE\Shareaza"; Flags: dontcreatekey uninsdeletekey
Root: HKCU; Subkey: "Software\Shareaza"; Flags: dontcreatekey uninsdeletekey
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueName: "Shareaza"; Flags: dontcreatekey uninsdeletevalue

; Delete NSIS entry on software panel
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Shareaza"; Flags: dontcreatekey deletekey

; Clear version check key
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\VersionCheck"; Flags: dontcreatekey deletekey

; Create TorrentAid default dir locations
Root: HKCU; Subkey: "Software\TorrentAid\TorrentWizard\Folders"; ValueType: string; ValueName: "001.Path"; ValueData: "{userappdata}\Shareaza\Torrents"; Flags: createvalueifdoesntexist; Tasks: multiuser
Root: HKCU; Subkey: "Software\TorrentAid\TorrentWizard\Folders"; ValueType: string; ValueName: "Last"; ValueData: "{userappdata}\Shareaza\Torrents"; Flags: createvalueifdoesntexist; Tasks: multiuser
Root: HKCU; Subkey: "Software\TorrentAid\TorrentWizard\Folders"; ValueType: string; ValueName: "001.Path"; ValueData: "{app}\Torrents"; Flags: createvalueifdoesntexist; Tasks: not multiuser
Root: HKCU; Subkey: "Software\TorrentAid\TorrentWizard\Folders"; ValueType: string; ValueName: "Last"; ValueData: "{app}\Torrents"; Flags: createvalueifdoesntexist; Tasks: not multiuser

[Dirs]
; Make incomplete, torrent and collection dir
; Note: download dir will be created when installer is copied
Name: "{ini:{param:SETTINGS|},Locations,IncompletePath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,IncompletePath|{localappdata}\Shareaza\Incomplete}}"; Flags: uninsalwaysuninstall; Tasks: multiuser
Name: "{ini:{param:SETTINGS|},Locations,TorrentPath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,TorrentPath|{userappdata}\Shareaza\Torrents}}"; Flags: uninsalwaysuninstall; Tasks: multiuser
Name: "{ini:{param:SETTINGS|},Locations,CollectionPath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,CollectionPath|{userappdata}\Shareaza\Collections}}"; Flags: uninsalwaysuninstall; Tasks: multiuser
Name: "{ini:{param:SETTINGS|},Locations,IncompletePath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,IncompletePath|{app}\Incomplete}}"; Flags: uninsalwaysuninstall; Tasks: not multiuser
Name: "{ini:{param:SETTINGS|},Locations,TorrentPath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,TorrentPath|{app}\Torrents}}"; Flags: uninsalwaysuninstall; Tasks: not multiuser
Name: "{ini:{param:SETTINGS|},Locations,CollectionPath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,CollectionPath|{app}\Collections}}"; Flags: uninsalwaysuninstall; Tasks: not multiuser
Name: "{userappdata}\Shareaza\Data"; Flags: uninsalwaysuninstall; Tasks: multiuser


[InstallDelete]
; Clean up old files from Shareaza
Type: files; Name: "{app}\zlib1.dll"
Type: files; Name: "{app}\LICENSE.txt"
Type: files; Name: "{app}\uninstall.exe"
Type: files; Name: "{app}\Plugins\DivFix.dll"
Type: files; Name: "{app}\Skins\skin.exe"
Type: files; Name: "{app}\*.dat"
Type: files; Name: "{app}\*.xml"
Type: files; Name: "{app}\*.png"
Type: files; Name: "{app}\*.bmp"
Type: filesandordirs; Name: "{userappdata}\Shareaza\Remote"
Type: filesandordirs; Name: "{userappdata}\Shareaza\Schemas"
Type: files; Name: "{userappdata}\Shareaza\Data\DefaultAvatar.png"
Type: files; Name: "{app}\Skins\Languages\default-es-mx.xml"
Type: files; Name: "{app}\Skins\Languages\default-es-mx.ico"

; Clean up old Shareaza icons
Type: files; Name: "{userdesktop}\Start Shareaza.lnk"
Type: files; Name: "{userdesktop}\Shareaza.lnk"; Tasks: not desktopicon
Type: filesandordirs; Name: "{userprograms}\Shareaza"
Type: filesandordirs; Name: "{userprograms}\{reg:HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Shareaza_is1,Inno Setup: Icon Group|{groupname}}"
Type: files; Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Shareaza.lnk"; Tasks: not quicklaunch

; Delete extra components so installer can "uninstall" them
Type: filesandordirs; Name: "{app}\Remote"
Type: filesandordirs; Name: "{app}\Skins\Languages"; Components: not language
Type: filesandordirs; Name: "{userappdata}\Shareaza\Skins\Languages"; Components: not language

[UninstallDelete]
; Clean up files created after installation
Type: filesandordirs; Name: "{app}\Data"
Type: filesandordirs; Name: "{userappdata}\Shareaza\Data"
Type: filesandordirs; Name: "{app}\Skins"

; Pull in languages and localized files
#include "languages.iss"
; Pull in Shareaza settings to write to registry
#include "settings.iss"

; Code sections need to be the last section in a script or the compiler will get confused
[Code]
const
  WM_CLOSE = $0010;
  KeyLoc1 = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Shareaza_is1';
  KeyLoc2 = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Shareaza';
  KeyName = 'UninstallString';
var
  Installed: Boolean;

Function InnoSetupUsed(): boolean;
Begin
    Result := RegKeyExists(HKEY_LOCAL_MACHINE, KeyLoc1);
End;

Function NSISUsed(): boolean;
Begin
    Result := RegKeyExists(HKEY_LOCAL_MACHINE, KeyLoc2);
End;

Procedure CurStepChanged(CurStep: TSetupStep);
var
  Wnd: HWND;
  Shutdownmessage: string;
Begin
  Shutdownmessage := ExpandConstant('{cm:dialog_shutdown,Shareaza}');
  if CurStep = ssInstall then
    Wnd := FindWindowByClassName('ShareazaMainWnd');
  if Wnd <> 0 then
    if MsgBox(Shutdownmessage, mbConfirmation, MB_YESNO) = IDYES then begin
      SendMessage(Wnd, WM_CLOSE, 0, 0);
      while Wnd <> 0 do
        begin
        Sleep(100);
        Wnd := FindWindowByClassName('ShareazaMainWnd');
        End;
    End else
        MainForm.close;
        exit;
End;

Function InitializeSetup: Boolean;
Begin
  Result := True;
  Installed := RegValueExists(HKEY_LOCAL_MACHINE, KeyLoc1, KeyName) or RegValueExists(HKEY_LOCAL_MACHINE, KeyLoc2, KeyName);
End;

Function ShouldSkipPage(PageID: Integer): Boolean;
Begin
  Result := False;
  if PageID = wpSelectDir then Result := Installed;
End;

Procedure DeleteMultiDataDir();
var
  MultiDataDir: string;
Begin
  MultiDataDir := ExpandConstant('{userappdata}\Shareaza\Data');
  DelTree(MultiDataDir, True, True, True);
End;

Procedure DeleteMultiSkinDir();
var
  MultiSkinDir: string;
Begin
  MultiSkinDir := ExpandConstant('{userappdata}\Shareaza\Skins');
  DelTree(MultiSkinDir, True, True, True);
End;

Procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  Wnd: HWND;
Begin
  if CurUninstallStep = usUninstall then
    Wnd := FindWindowByClassName('ShareazaMainWnd');
  if Wnd <> 0 then
      SendMessage(Wnd, WM_CLOSE, 0, 0);
  while Wnd <> 0 do
      begin
        Sleep(100);
        Wnd := FindWindowByClassName('ShareazaMainWnd');
      End
End;


