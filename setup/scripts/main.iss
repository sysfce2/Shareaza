; WARNING: Compile repair.iss first!

#define version GetFileVersion("..\builds\Shareaza.exe")

[Setup]
AppComments=Shareaza Ultimate File Sharing
AppId=Shareaza
AppName=Shareaza
AppPublisher=Shareaza Development Team
AppReadmeFile={app}\Uninstall\readme.txt
AppVersion={#version}
AppVerName=Shareaza {#version}
VersionInfoVersion={#version}
DefaultDirName={reg:HKLM\SOFTWARE\Shareaza,|{pf}\Shareaza}
DirExistsWarning=no
DefaultGroupName=Shareaza
DisableReadyPage=yes
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

; Set the CVS root as source dir (up 2 levels)
SourceDir=..\..

; links to website for software panel
AppPublisherURL=http://www.shareaza.com/?id=home
AppSupportURL=http://www.shareaza.com/?id=support
AppUpdatesURL=http://www.shareaza.com/?id=download

[Components]
; Ask user wich components to install
Name: "language"; Description: "{cm:components_languages}"; Types: full; Flags: disablenouninstallwarning

[Files]
; Install unicows.dll on Win 9X
Source: "setup\builds\unicows.dll"; DestDir: "{app}"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension regserver noregerror; MinVersion: 4.0,0
Source: "setup\builds\unicows.dll"; DestDir: "{sys}"; Flags: regserver noregerror overwritereadonly replacesameversion restartreplace sharedfile uninsneveruninstall sortfilesbyextension; MinVersion: 4.0,0

; Main files
Source: "setup\builds\1.dll"; DestDir: "{app}"; DestName: "zlib.dll"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "setup\builds\1.dll"; DestDir: "{userappdata}\Shareaza\Plugins"; DestName: "zlib.dll"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "setup\builds\Shareaza.exe"; DestDir: "{app}"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "setup\builds\skin.exe"; DestDir: "{app}"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "Data\*"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension;
Source: "Schemas\*"; DestDir: "{userappdata}\Shareaza\Schemas"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension

; Copy repair installer
Source: "setup\builds\repair.exe"; DestDir: "{app}\Uninstall"; Flags: uninsremovereadonly sortfilesbyextension onlyifdoesntexist

; Plugins
; Don't register RazaWebHook.dll since it will setup Shareaza as download manager
Source: "setup\plugins\*.dll"; DestDir: "{userappdata}\Shareaza\Plugins"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension regserver; Excludes: "RazaWebHook.dll"
Source: "setup\plugins\RazaWebHook.dll"; DestDir: "{userappdata}\Shareaza\Plugins"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension

; Uninstall icon for software panel
Source: "setup\misc\uninstall.ico"; DestDir: "{app}\Uninstall"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension

; Skins
Source: "Skins\BlueStreak\*"; DestDir: "{userappdata}\Shareaza\Skins\BlueStreak"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "Skins\CleanBlue\*"; DestDir: "{userappdata}\Shareaza\Skins\CleanBlue"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "Skins\Corona\*"; DestDir: "{userappdata}\Shareaza\Skins\Corona"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "Skins\Shareaza2\*"; DestDir: "{userappdata}\Shareaza\Skins\Shareaza2"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "Skins\ShareazaOS\*"; DestDir: "{userappdata}\Shareaza\Skins\ShareazaOS"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension

; Languages: English gets installed by default
Source: "Languages\default-en.xml"; DestDir: "{userappdata}\Shareaza\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension
Source: "Languages\*"; DestDir: "{userappdata}\Shareaza\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Components: "language"; Excludes: "default-en.xml"

; Old versions of Shareaza stored data under {app}
; These need to be copied to {userappdata}\Shareaza
Source: "{app}\*.dat"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist
Source: "{app}\*.xml"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist
Source: "{app}\*.png"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist
Source: "{app}\*.bmp"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist
Source: "{app}\Data\*"; DestDir: "{userappdata}\Shareaza\Data"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist recursesubdirs; AfterInstall: DeleteDataDir
Source: "{app}\Skins\*"; DestDir: "{userappdata}\Shareaza\Skins"; Flags: ignoreversion uninsremovereadonly sortfilesbyextension external onlyifdoesntexist skipifsourcedoesntexist recursesubdirs; AfterInstall: DeleteSkinDir

; Copy installer into download and uninstall dir
Source: "{srcexe}"; DestDir: "{ini:{param:SETTINGS|},Locations,CompletePath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,CompletePath|{userappdata}\Shareaza\Downloads}}"; DestName: "Shareaza_{#version}.exe"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension external
Source: "{srcexe}"; DestDir: "{app}\Uninstall"; DestName: "setup.exe"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension external

[Icons]
; Shareaza icons
Name: "{userprograms}\{groupname}\Shareaza"; Filename: "{app}\Shareaza.exe"; WorkingDir: "{app}"; Comment: "Shareaza Ultimate File Sharing"
Name: "{userdesktop}\Shareaza"; Filename: "{app}\Shareaza.exe"; WorkingDir: "{app}"; Comment: "Shareaza Ultimate File Sharing"

; License and uninstall icon in user language
Name: "{userprograms}\{groupname}\{cm:icons_license}"; Filename: "{app}\Uninstall\license.rtf"; WorkingDir: "{app}\Uninstall"; Comment: "{cm:icons_license}"
Name: "{userprograms}\{groupname}\{cm:icons_uninstall}"; Filename: "{uninstallexe}"; WorkingDir: "{app}\Uninstall"; Comment: "{cm:UninstallProgram,Shareaza}"; IconFilename: "{app}\Uninstall\uninstall.ico"

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
Root: HKLM; Subkey: "SOFTWARE\Shareaza"; ValueType: string; ValueName: ; ValueData: "{app}"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\Shareaza\Shareaza"; ValueType: string; ValueName: "Path" ; ValueData: "{userappdata}\Shareaza"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Shareaza.exe"; ValueType: string; ValueName: ; ValueData: "{app}\Shareaza.exe"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Shareaza.exe"; ValueType: string; ValueName: "Path"; ValueData: "{app}"; Flags: uninsdeletekey

; Install chat notify sound
Root: HKCU; Subkey: "AppEvents\EventLabels\RAZA_IncomingChat"; ValueType: string; ValueName: ; ValueData: "{cm:reg_incomingchat}"; Flags: uninsdeletekey
Root: HKCU; Subkey: "AppEvents\Schemes\Apps\Shareaza"; ValueType: string; ValueName: ; ValueData: "{cm:reg_apptitle}"; Flags: uninsdeletekey
Root: HKCU; Subkey: "AppEvents\Schemes\Apps\Shareaza\RAZA_IncomingChat\.current"; ValueType: string; ValueName: ; ValueData: "%SystemRoot%\media\notify.wav"; Flags: uninsdeletekey
Root: HKCU; Subkey: "AppEvents\Schemes\Apps\Shareaza\RAZA_IncomingChat\.default"; ValueType: string; ValueName: ; ValueData: "%SystemRoot%\media\notify.wav"; Flags: uninsdeletekey

; Set directory locations
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\Downloads"; ValueType: string; ValueName: "CompletePath"; ValueData: "{userappdata}\Shareaza\Downloads"; Flags: uninsdeletekey createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\Downloads"; ValueType: string; ValueName: "IncompletePath"; ValueData: "{userappdata}\Shareaza\Incomplete"; Flags: uninsdeletekey createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\Downloads"; ValueType: string; ValueName: "TorrentPath"; ValueData: "{userappdata}\Shareaza\Torrents"; Flags: uninsdeletekey createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Shareaza\Shareaza\Downloads"; ValueType: string; ValueName: "CollectionPath"; ValueData: "{userappdata}\Shareaza\Collections"; Flags: uninsdeletekey createvalueifdoesntexist

; Delete keys at uninstall
Root: HKLM; Subkey: "SOFTWARE\Shareaza"; Flags: dontcreatekey uninsdeletekey
Root: HKCU; Subkey: "Software\Shareaza"; Flags: dontcreatekey uninsdeletekey
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "Shareaza"; Flags: dontcreatekey uninsdeletevalue

; Delete NSIS entry on software panel
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Shareaza"; Flags: dontcreatekey deletekey

; Create TorrentAid default dir locations
Root: HKCU; Subkey: "Software\TorrentAid\TorrentWizard\Folders"; ValueType: string; ValueName: "001.Path"; ValueData: "{userappdata}\Shareaza\Torrents"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\TorrentAid\TorrentWizard\Folders"; ValueType: string; ValueName: "Last"; ValueData: "{userappdata}\Shareaza\Torrents"; Flags: createvalueifdoesntexist

[Dirs]
; Make incomplete, torrent and collection dir
; Note: download dir will be created when installer is copied
Name: "{ini:{param:SETTINGS|},Locations,IncompletePath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,IncompletePath|{userappdata}\Shareaza\Incomplete}}"; Flags: uninsalwaysuninstall
Name: "{ini:{param:SETTINGS|},Locations,TorrentPath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,TorrentPath|{userappdata}\Shareaza\Torrents}}"; Flags: uninsalwaysuninstall
Name: "{ini:{param:SETTINGS|},Locations,CollectionPath|{reg:HKCU\Software\Shareaza\Shareaza\Downloads,CollectionPath|{userappdata}\Shareaza\Collections}}"; Flags: uninsalwaysuninstall

[InstallDelete]
; Clean up old files from Shareaza
Type: files; Name: "{app}\zlib1.dll"
Type: files; Name: "{app}\LICENSE.txt"
Type: files; Name: "{app}\uninstall.exe"
Type: files; Name: "{app}\Plugins\DivFix.dll"
Type: files; Name: "{app}\Skins\zlib.dll"
Type: files; Name: "{app}\Skins\skin.exe"

; Clean up old Shareaza icons
Type: files; Name: "{userdesktop}\Start Shareaza.lnk"
Type: filesandordirs; Name: "{userprograms}\Shareaza"

; Delete extra components so installer can "uninstall" them
Type: filesandordirs; Name: "{userappdata}\Shareaza\Remote"

; Clean up {app} after moving to {userappdata}\Shareaza
Type: filesandordirs; Name: "{app}\Schemas"
Type: filesandordirs; Name: "{app}\Remote"
Type: filesandordirs; Name: "{app}\Plugins"


[UninstallDelete]
Type: files; Name: "{app}\*.dat"
Type: files; Name: "{app}\*.xml"
Type: files; Name: "{app}\*.png"
Type: files; Name: "{app}\*.bmp"
Type: filesandordirs; Name: "{app}\Data"
Type: filesandordirs; Name: "{userappdata}\Shareaza\Data"
Type: filesandordirs; Name: "{app}\Skins"
Type: filesandordirs; Name: "{userappdata}\Shareaza\Skins"

; Pull in languages and localized files
#include "languages.iss"
; Pull in Shareaza settings to write to registry
#include "settings.iss"

; Code sections need to be the last section in a script or the compiler will get confused
; This code still needs work:

[Code]
const
  WM_CLOSE = $0010;
  KeyLoc1 = 'Software\Microsoft\Windows\CurrentVersion\Uninstall\Shareaza_is1';
  KeyLoc2 = 'Software\Microsoft\Windows\CurrentVersion\Uninstall\Shareaza';
  KeyName = 'UninstallString';
var
  Installed: Boolean;

Function ShareazaInstalled(): boolean;
Begin
    Result := RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Shareaza');
End;

Function InnoSetupUsed(): boolean;
Begin
    Result := RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Shareaza_is1');
End;

Function NSISUsed(): boolean;
Begin
    Result := RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Shareaza_');
End;

Procedure CurStepChanged(CurStep: TSetupStep);
var
  Wnd: HWND;
Begin
  if CurStep = ssInstall then
    Wnd := FindWindowByClassName('ShareazaMainWnd');
  if Wnd <> 0 then
    SendMessage(Wnd, WM_CLOSE, 0, 0);
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
  if PageID = wpSelectProgramGroup then Result := Installed;
End;

Procedure DeleteDataDir();
var
  DataDir: string;
Begin
  DataDir := ExpandConstant('{app}\Data');
  DelTree(DataDir, True, True, True);
End;

Procedure DeleteSkinDir();
var
  SkinDir: string;
Begin
  SkinDir := ExpandConstant('{app}\Skins');
  DelTree(SkinDir, True, True, True);
End;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  Wnd: HWND;
begin
  if CurUninstallStep = usUninstall then
    Wnd := FindWindowByClassName('ShareazaMainWnd');
    if Wnd <> 0 then
      SendMessage(Wnd, WM_CLOSE, 0, 0);
      Sleep(1000)
;end;


