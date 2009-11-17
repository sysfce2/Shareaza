; This sub-script defines all languages to be compiled
; WARNING: Do not change this file's encoding

[Languages]
; Use compiler's built in ISL file to patch up holes in ISL collection and specify localized license files
; Note: first language specified is default > English

Name: "en"; MessagesFile: "compiler:Default.isl"; LicenseFile: "setup/license/default.rtf"
Name: "nl"; MessagesFile: "compiler:Languages\dutch.isl"; LicenseFile: "setup/license/dutch.rtf"
Name: "lt"; MessagesFile: "setup\isl\lithuanian.isl"; LicenseFile: "setup/license/lithuanian.rtf"
Name: "de"; MessagesFile: "compiler:Languages\German.isl"; LicenseFile: "setup/license/German.rtf"
Name: "it"; MessagesFile: "compiler:Languages\Italian.isl"; LicenseFile: "setup/license/italian.rtf"
Name: "no"; MessagesFile: "compiler:Languages\Norwegian.isl"; LicenseFile: "setup/license/norwegian.rtf"
Name: "af"; MessagesFile: "setup\isl\afrikaans.isl"; LicenseFile: "setup/license/afrikaans.rtf"
Name: "pt"; MessagesFile: "compiler:Languages\Portuguese.isl"; LicenseFile: "setup/license/portuguese.rtf"
Name: "pt_br"; MessagesFile: "setup\isl\portuguese-braz.isl"; LicenseFile: "setup/license/portuguese-braz.rtf"
Name: "fr"; MessagesFile: "compiler:Languages\french.isl"; LicenseFile: "setup/license/french.rtf"
Name: "es"; MessagesFile: "compiler:Languages\Spanish.isl"; LicenseFile: "setup/license/spanish.rtf"
Name: "es_mx"; MessagesFile: "setup\isl\spanish-mexican.isl"; LicenseFile: "setup/license/spanish-mexican.rtf"
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"; LicenseFile: "setup/license/russian.rtf"
Name: "gr"; MessagesFile: "setup\isl\greek.isl"; LicenseFile: "setup/license/greek.rtf"
Name: "hu"; MessagesFile: "compiler:Languages\Hungarian.isl"; LicenseFile: "setup/license/hungarian.rtf"
Name: "chs"; MessagesFile: "setup\isl\chinese-simp.isl"; LicenseFile: "setup/license/chinese.rtf"
Name: "sv"; MessagesFile: "setup\isl\swedish.isl"; LicenseFile: "setup/license/swedish.rtf"
Name: "fi"; MessagesFile: "compiler:Languages\Finnish.isl"; LicenseFile: "setup/license/finnish.rtf"
Name: "heb"; MessagesFile: "compiler:Languages\Hebrew.isl"; LicenseFile: "setup/license/hebrew.rtf"
Name: "pl"; MessagesFile: "compiler:Languages\Polish.isl"; LicenseFile: "setup/license/polish.rtf"
Name: "cz"; MessagesFile: "compiler:Languages\Czech.isl"; LicenseFile: "setup/license/czech.rtf"
Name: "sr"; MessagesFile: "setup\isl\Serbian.isl"; LicenseFile: "setup/license/serbian.rtf"
Name: "tr"; MessagesFile: "setup\isl\turkish.isl"; LicenseFile: "setup/license/turkish.rtf"
Name: "ja"; MessagesFile: "setup\isl\japanese.isl"; LicenseFile: "setup/license/japanese.rtf"
Name: "ar"; MessagesFile: "setup\isl\arabic.isl"; LicenseFile: "setup/license/arabic.rtf"
Name: "ee"; MessagesFile: "setup\isl\estonian.isl"; LicenseFile: "setup/license/estonian.rtf"
Name: "tw"; MessagesFile: "setup\isl\chinese-trad.isl"; LicenseFile: "setup/license/chinese-trad.rtf"
Name: "sl"; MessagesFile: "compiler:Languages\Slovenian.isl"; LicenseFile: "setup/license/default.rtf"
Name: "ca"; MessagesFile: "compiler:Languages\Catalan.isl"; LicenseFile: "setup/license/catalan.rtf"
Name: "sq"; MessagesFile: "setup\isl\albanian.isl"; LicenseFile: "setup/license/albanian.rtf"

[Files]
; Install all languages
Source: "Languages\default-*.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Tasks: language; Excludes: "default-en.xml"
Source: "Languages\default-*.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Tasks: language
; Install localized language
; English
; Dutch
Source: "Languages\default-nl.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: nl; Tasks: not language
Source: "Languages\default-nl.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: nl; Tasks: not language
; Lithuanian
Source: "Languages\default-lt.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: lt; Tasks: not language
Source: "Languages\default-lt.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: lt; Tasks: not language
; German
Source: "Languages\default-de.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: de; Tasks: not language
Source: "Languages\default-de.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: de; Tasks: not language
; Italian
Source: "Languages\default-it.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: it; Tasks: not language
Source: "Languages\default-it.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: it; Tasks: not language
; Norwegian
Source: "Languages\default-no.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: no; Tasks: not language
Source: "Languages\default-no.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: no; Tasks: not language
; Afrikaans
Source: "Languages\default-af.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: af; Tasks: not language
Source: "Languages\default-af.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: af; Tasks: not language
; Portuguese std
Source: "Languages\default-pt-br.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: pt; Tasks: not language
Source: "Languages\default-pt-br.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: pt; Tasks: not language
; Portuguese Braz
Source: "Languages\default-pt-br.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: pt_br; Tasks: not language
Source: "Languages\default-pt-br.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: pt_br; Tasks: not language
; French
Source: "Languages\default-fr.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: fr; Tasks: not language
Source: "Languages\default-fr.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: fr; Tasks: not language
; Spanish std
Source: "Languages\default-es.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: es; Tasks: not language
Source: "Languages\default-es.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: es; Tasks: not language
; Spanish Mexican
Source: "Languages\default-es-mx.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: es_mx; Tasks: not language
Source: "Languages\default-es-mx.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: es_mx; Tasks: not language
; Russian
Source: "Languages\default-ru.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ru; Tasks: not language
Source: "Languages\default-ru.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ru; Tasks: not language
; Greek
Source: "Languages\default-gr.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: gr; Tasks: not language
Source: "Languages\default-gr.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: gr; Tasks: not language
; Hungarian
Source: "Languages\default-hu.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: hu; Tasks: not language
Source: "Languages\default-hu.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: hu; Tasks: not language
; Chinese Simp
Source: "Languages\default-chs.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: chs; Tasks: not language
Source: "Languages\default-chs.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: chs; Tasks: not language
; Swedish
Source: "Languages\default-sv.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sv; Tasks: not language
Source: "Languages\default-sv.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sv; Tasks: not language
; Finnish
Source: "Languages\default-fi.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: fi; Tasks: not language
Source: "Languages\default-fi.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: fi; Tasks: not language
; Hebrew
Source: "Languages\default-heb.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: heb; Tasks: not language
Source: "Languages\default-heb.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: heb; Tasks: not language
; Polish
Source: "Languages\default-pl.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: pl; Tasks: not language
Source: "Languages\default-pl.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: pl; Tasks: not language
; Czech
Source: "Languages\default-cz.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: cz; Tasks: not language
Source: "Languages\default-cz.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: cz; Tasks: not language
; Serbian
Source: "Languages\default-sr.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sr; Tasks: not language
Source: "Languages\default-sr.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sr; Tasks: not language
; Turkish
Source: "Languages\default-tr.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: tr; Tasks: not language
Source: "Languages\default-tr.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: tr; Tasks: not language
; Japanese
Source: "Languages\default-ja.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ja; Tasks: not language
Source: "Languages\default-ja.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ja; Tasks: not language
; Arabic
Source: "Languages\default-ar.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ar; Tasks: not language
Source: "Languages\default-ar.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ar; Tasks: not language
; Estonian
Source: "Languages\default-ee.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ee; Tasks: not language
Source: "Languages\default-ee.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ee; Tasks: not language
; Chinese Trad
Source: "Languages\default-tw.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: tw; Tasks: not language
Source: "Languages\default-tw.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: tw; Tasks: not language
; Slovenian
Source: "Languages\default-sl-si.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sl; Tasks: not language
Source: "Languages\default-sl-si.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sl; Tasks: not language
; Catalan
Source: "Languages\default-ca.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ca; Tasks: not language
Source: "Languages\default-ca.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ca; Tasks: not language
; Albanian
Source: "Languages\default-sq.xml"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sq; Tasks: not language
Source: "Languages\default-sq.ico"; DestDir: "{app}\Skins\Languages"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sq; Tasks: not language

; Install common remote
Source: "Remote\Common\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension recursesubdirs; Excludes: ".svn"
; Install localized remote
; English
Source: "Remote\en\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: en
; Dutch
Source: "Remote\nl\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: nl
; Lithuanian
Source: "Remote\lt\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: lt
; German
Source: "Remote\de\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: de
; Italian
Source: "Remote\it\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: it
; Norwegian
Source: "Remote\no\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: no
; Afrikaans
Source: "Remote\en\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: af
; Portuguese std
Source: "Remote\pt-br\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: pt
; Portuguese Braz
Source: "Remote\pt-br\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: pt_br
; French
Source: "Remote\fr\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: fr
; Spanish std
Source: "Remote\es-mx\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: es
; Spanish Mexican
Source: "Remote\es-mx\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: es_mx
; Russian
Source: "Remote\ru\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: ru
; Greek
Source: "Remote\gr\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: gr
; Hungarian
Source: "Remote\hu\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: hu
; Chinese Simp
Source: "Remote\chs\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: chs
; Swedish
Source: "Remote\sv\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: sv
; Finnish
Source: "Remote\en\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: fi
; Hebrew
Source: "Remote\en\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: heb
; Polish
Source: "Remote\en\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: pl
; Czech
Source: "Remote\cz\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: cz
; Serbian
Source: "Remote\en\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: sr
; Turkish
Source: "Remote\en\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: tr
; Japanese
Source: "Remote\ja\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: ja
; Arabic
Source: "Remote\en\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: ar
; Estonian
Source: "Remote\en\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: ee
; Chinese Trad
Source: "Remote\en\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: tw
; Slovenian
Source: "Remote\en\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: sl
; Catalan
Source: "Remote\en\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: ca
; Albanian
Source: "Remote\sq\*"; DestDir: "{app}\Remote"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Excludes: ".svn"; Languages: sq

; Install localized license
; English
Source: "setup\license\default.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: en
; Dutch
Source: "setup\license\dutch.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: nl
; Lithuanian
Source: "setup\license\lithuanian.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: lt
; German
Source: "setup\license\german.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: de
; Italian
Source: "setup\license\italian.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: it
; Norwegian
Source: "setup\license\norwegian.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: no
; Afrikaans
Source: "setup\license\afrikaans.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: af
; Portuguese std
Source: "setup\license\portuguese.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: pt
; Portuguese Braz
Source: "setup\license\portuguese-braz.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: pt_br
; French
Source: "setup\license\french.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: fr
; Spanish std
Source: "setup\license\spanish.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: es
; Spanish Mexican
Source: "setup\license\spanish-mexican.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: es_mx
; Russian
Source: "setup\license\russian.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ru
; Greek
Source: "setup\license\greek.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: gr
; Hungarian
Source: "setup\license\hungarian.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: hu
; Chinese Simp
Source: "setup\license\chinese.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: chs
; Swedish
Source: "setup\license\swedish.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sv
; Finnish
Source: "setup\license\finnish.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: fi
; Hebrew
Source: "setup\license\hebrew.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: heb
; Polish
Source: "setup\license\polish.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: pl
; Czech
Source: "setup\license\czech.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: cz
; Serbian
Source: "setup\license\serbian.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sr
; Turkish
Source: "setup\license\turkish.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: tr
; Japanese
Source: "setup\license\japanese.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ja
; Arabic
Source: "setup\license\arabic.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ar
; Estonian
Source: "setup\license\estonian.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ee
; Chinese Trad
Source: "setup\license\chinese-trad.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: tw
; Slovenian
Source: "setup\license\default.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sl
; Catalan
Source: "setup\license\catalan.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ca
; Catalan
Source: "setup\license\albanian.rtf"; DestDir: "{app}\Uninstall"; DestName: "license.rtf"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sq

; Install localized filter
; English
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: en
; Dutch
Source: "setup\filter\dutch.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: nl
; Lithuanian
Source: "setup\filter\lithuanian.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: lt
; German
Source: "setup\filter\german.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: de
; Italian
Source: "setup\filter\italian.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: it
; Norwegian
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: no
; Afrikaans
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: af
; Portuguese std
Source: "setup\filter\portuguese-br.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: pt
; Portuguese Braz
Source: "setup\filter\portuguese-br.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: pt_br
; French
Source: "setup\filter\french.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: fr
; Spanish std
Source: "setup\filter\spanish-mexican.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: es
; Spanish Mexican
Source: "setup\filter\spanish-mexican.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: es_mx
; Russian
Source: "setup\filter\russian.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ru
; Greek
Source: "setup\filter\greek.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: gr
; Hungarian
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: hu
; Chinese Simp
Source: "setup\filter\chinese-simpl.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: chs
; Swedish
Source: "setup\filter\swedish.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sv
; Finnish
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: fi
; Hebrew
Source: "setup\filter\hebrew.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: heb
; Polish
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: pl
; Czech
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: cz
; Serbian
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sr
; Turkish
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: tr
; Japanese
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ja
; Arabic
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ar
; Estonian
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ee
; Chinese Trad
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: tw
; Slovenian
Source: "setup\filter\default.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sl
; Catalan
Source: "setup\filter\catalan.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: ca
; Albanian
Source: "setup\filter\albanian.dat"; DestDir: "{app}\Data"; DestName: "AdultFilter.dat"; Flags: ignoreversion overwritereadonly uninsremovereadonly sortfilesbyextension; Languages: sq

[CustomMessages]
; This section specifies phrazes and words not specified in the ISL files
; Avoid customizing the ISL files since they will change with each version of Inno Setup.
; English
components_plugins=Plugins
components_skins=Skins
tasks_languages=Multi-language
tasks_allusers=All users
tasks_selectusers=Install %1 for:
tasks_currentuser=%1 only
tasks_multisetup=Enable multi-user support
tasks_firewall=Add an exception to the Windows Firewall
tasks_upnp=Enable discovery of UPnP devices
tasks_deleteoldsetup=Delete old installers
tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
run_skinexe=Running skin installation...
reg_incomingchat=Incoming chat message
reg_apptitle=Shareaza Ultimate File Sharing
icons_license=License
icons_uninstall=Uninstall
icons_downloads=Downloads
icons_basicmode=Basic Mode
icons_tabbedmode=Tabbed Mode
icons_windowedmode=Windowed Mode
dialog_shutdown=%1 is currently running. Would you like %1 to be shutdown so the installation can continue?
dialog_firewall=Setup failed to add Shareaza to the Windows Firewall.%nPlease add Shareaza to the exception list manually.
dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
page_viruswarning_text=When using the internet, you should always ensure you have an up-to-date virus scanner to protect you from trojans, worms, and other malicious programs. You can find list of good virus scanners and other security tips to protect your computer by following this link:
page_viruswarning_title=Virus Warning
page_viruswarning_subtitle=Do you have an AntiVirus program installed?
CreateDesktopIcon=Display a &desktop icon
CreateQuickLaunchIcon=Display a &Quick Launch icon
PathNotExist=Error, the path of the %1 folder doesn't exist
; Don't copy these last 2 messages, they are just links.
page_viruswarning_link=http://shareaza.sourceforge.net/securityhelp
page_viruswarning_destination=http://shareaza.sourceforge.net/securityhelp/

; Dutch
nl.components_plugins=Plugins
nl.components_skins=Skins
nl.tasks_languages=Talen
nl.tasks_allusers=Alle gebruikers
nl.tasks_selectusers=Installeer %1 voor:
nl.tasks_currentuser=Alleen %1
nl.tasks_multisetup=Ondersteuning voor meerdere gebruikers inschakelen
nl.tasks_firewall=Een uitzondering aan de Windows Firewall toevoegen
nl.tasks_upnp=Configureer automatisch mijn router
nl.tasks_deleteoldsetup=Oude installatieprogramma's wissen
nl.tasks_resetdiscoveryhostcache=Herstel de Discovery- en Hostcachelist
nl.run_skinexe=Skin installatie uitvoeren...
nl.reg_incomingchat=Nieuw chat bericht
nl.reg_apptitle=Shareaza: De Ultieme FileSharer
nl.icons_license=Gebruiksovereenkomst
nl.icons_uninstall=Verwijderen
nl.icons_downloads=Downloads
nl.icons_basicmode=Normale Stijl
nl.icons_tabbedmode=Tabblad Stijl
nl.icons_windowedmode=Venster Stijl
nl.dialog_shutdown=%1 is momenteel open. Wil je %1 afsluiten zodat de installatie verder kan gaan?
nl.dialog_firewall=Het installatieprogramma kon Shareaza niet toevoegen aan de Windows Firewall.%nVoeg Shareaza alstublieft manueel toe aan de uitzonderingenlijst.
nl.dialog_malwaredetected=Er werd malware gevonden op %1, verwijder het alstublieft met een virus/malware scanner vooraleer Shareaza verder te installeren. Wil je nu sluiten?
nl.page_viruswarning_text=Als u het internet gebruikt moet u een recente virusscanner gebruiken om u te beschermen tegen virussen, wormen en andere kwaadaardige programma's. U kan een lijst van virusscanners en andere veiligheidstips vinden om uw computer the beschermen door deze link te volgen:
nl.page_viruswarning_title=Virus Waarschuwing
nl.page_viruswarning_subtitle=Heeft u een antivirus programma ge�nstalleerd?
nl.CreateDesktopIcon=Toon een snelkoppeling op het &bureaublad
nl.CreateQuickLaunchIcon=Toon een snelkoppeling op de &Snel Starten werkbalk
; Lithuanian
lt.components_plugins=Papildiniai
lt.components_skins=Apvalkalai
lt.tasks_languages=Kalbos
lt.tasks_allusers=Visiems vartotojams
lt.tasks_selectusers=�diegti �%1� �iems vartotojams:
lt.tasks_currentuser=Tik vartotojui %1
lt.tasks_multisetup=�galinti keli� vartotoj� palaikym�
lt.tasks_firewall=Prid�ti prie Windows ugniasien�s i�im�i� s�ra�o
lt.tasks_upnp=�galinti UPnP �rengini� aptikim�
lt.tasks_deleteoldsetup=Trinti senas diegimo programas
lt.tasks_resetdiscoveryhostcache=Apnulinti tarnybas ir adresat� talpyklas
lt.run_skinexe=Vykdoma apvalkalo s�ranka...
lt.reg_incomingchat=Gaunama �inut� pokalbiui
lt.reg_apptitle=Shareaza � geriausia programa byl� mainams
lt.icons_license=Licencin� sutartis
lt.icons_uninstall=Pa�alinti
lt.icons_downloads=Atsisiuntimai
lt.icons_basicmode=�prastin� veiksena
lt.icons_tabbedmode=Korteli� veiksena
lt.icons_windowedmode=Lang� veiksena
lt.dialog_shutdown=�%1� �iuo metu dirba. Ar norite nutraukti �%1� darb�, tam kad b�t� galima t�sti �diegim�?
lt.dialog_firewall=�diegimo programai nepavyko prid�ti �Shareaza� prie Windows ugniasien�s i�im�i� s�ra�o.%nPrid�kite j� � �� s�ra�� rankiniu b�du.
lt.dialog_malwaredetected=J�s� sistemoje aptiktos kenk�ji�kos programos (%1). Prie� diegdami �Shareaza�, pa�alinkite jas antivirusine programa ar skeneriu. Nutraukti diegim� dabar?
lt.page_viruswarning_text=Visada, kai naudojat�s Internetu, �sitikinkite, jog turite naujausi� virus� skener�, tam kad b�tum�te apsaugoti nuo trojan�, kirmin� ir kitoki� kenk�ji�k� program�. J�s galite rasti ger� virus� skeneri� s�ra�� ir kitokius kompiuterio apsaugojimo patarimus nu�j� �iuo adresu:
lt.page_viruswarning_title=�sp�jimas apie virusus
lt.page_viruswarning_subtitle=Ar J�s turite �sidieg� antivirusin� program�?
lt.CreateDesktopIcon=Rodyti piktogram� &Darbalaukyje
lt.CreateQuickLaunchIcon=Rodyti Spar�iosios &Paleisties piktogram�
lt.PathNotExist=Klaida, katalogo kelias �%1� neegzistuoja
; German
de.components_plugins=Plugins
de.components_skins=Skins
de.tasks_languages=Sprachen
de.tasks_allusers=Alle Benutzer
de.tasks_selectusers=Installieren %1 f�r:
de.tasks_currentuser=Nur f�r %1
de.tasks_multisetup=Mehrbenutzerunterst�tzung aktivieren
de.tasks_firewall=Eine Ausnahme zur Windows-Firewall hinzuf�gen
de.tasks_upnp=Automatische Routerkonfiguration benutzen ( UPnP )
de.tasks_deleteoldsetup=Alte Installer l�schen
de.tasks_resetdiscoveryhostcache=Service-Provider und Host-Cache zur�cksetzen
de.run_skinexe=Skin-Installer einrichten...
de.reg_incomingchat=Eingehende Chatnachricht
de.reg_apptitle=Shareaza
de.icons_license=Lizenz
de.icons_uninstall=Shareaza deinstallieren
de.icons_downloads=Downloads
de.icons_basicmode=Normalmodus
de.icons_tabbedmode=Tab-Modus
de.icons_windowedmode=Fenstermodus
de.dialog_shutdown=%1 wird zur Zeit ausgef�hrt. Wollen Sie %1 beenden, um mit der Installation fortzufahren?
de.dialog_firewall=Setup konnte Shareaza nicht zur Windows-Firewall hinzuf�gen.%nBitte tragen Sie Shareaza manuell in die Ausnahmenliste ein.
de.dialog_malwaredetected=Auf ihrem Computer wurde sch�dliche Software im Ordner %1 entdeckt. Bitte entfernen Sie die Software mit Hilfe eines Viren- bzw. Malware-Scanners bevor Sie mir der Installation von Shareaza fortfahren.M�chten sie die Installation jetzt abbrechen?
de.page_viruswarning_text=Wenn Sie das Internet benutzen, sollten Sie stets einen aktuellen Virenscanner installiert haben, der ihren Computer vor Trojanern, W�rmern und anderen b�sartigen Programmen besch�tzt. Sie finden eine Liste guter Virenscanner und andere Tipps, wie Sie ihren Computer sch�tzen k�nnen, unter folgendem Link:
de.page_viruswarning_title=Virenwarnung
de.page_viruswarning_subtitle=Haben Sie ein Antivirenprogramm installiert?
de.CreateDesktopIcon=&Symbol auf dem Desktop erstellen
de.CreateQuickLaunchIcon=&Shareaza zur Schnellstartleiste hinzuf�gen
de.PathNotExist=Fehler: der Pfad zum %1-Ordner existiert nicht
; Italian
it.components_plugins=Plugin
it.components_skins=Skin
it.tasks_languages=Multi-lingua
it.tasks_allusers=Tutti gli utenti
it.tasks_selectusers=Installa %1 per:
it.tasks_currentuser=Solo %1
it.tasks_multisetup=Abilita il supporto multi-utente
it.tasks_firewall=Aggiungi un'eccezione a Windows Firewall
it.tasks_upnp=Abilita il rilevamento dei dispositivi UPnP
it.tasks_deleteoldsetup=Cancella installer vecchi
it.tasks_resetdiscoveryhostcache=Resetta i servizi di connessione e la cache host
it.run_skinexe=Installazione delle skin in corso...
it.reg_incomingchat=Messaggio di chat in arrivo
it.reg_apptitle=Shareaza, il programma definitivo di P2P
it.icons_license=Licenza
it.icons_uninstall=Disinstalla
it.icons_downloads=Download
it.icons_basicmode=Modalit� normale
it.icons_tabbedmode=Modalit� a tabelle
it.icons_windowedmode=Modalit� a finestre
it.dialog_shutdown=%1 � attualmente in esecuzione. Vuoi che %1 sia chiuso cos� l'installazione pu� continuare?
it.dialog_firewall=Impossibile aggiungere Shareaza a Windows Firewall.%nAggiungi Shareaza alla lista delle eccezioni manualmente.
it.dialog_malwaredetected=Un programma malevolo (malware) � stato rilevato sul tuo sistema in %1, rimuovilo con un programma anti-virus/anti-malware prima di installare Shareaza. Vuoi uscire adesso?
it.page_viruswarning_text=Quando usi internet, dovresti sempre assicurarti di aver un antivirus aggiornato per proteggerti dai trojan, worm e dagli altri programmi malevoli. Puoi trovare una lista di buoni antivirus e altri suggerimenti di sicurezza per proteggere il tuo computer seguendo questo link:
it.page_viruswarning_title=Attenzione ai virus
it.page_viruswarning_subtitle=Hai installato un programma antivirus?
it.CreateDesktopIcon=Visualizza un'icona sul &desktop
it.CreateQuickLaunchIcon=Visualizza un'icona in &Avvio veloce
it.PathNotExist=Errore, il percorso della cartella %1 non esiste
; Norwegian
no.components_plugins=Plugins
no.components_skins=Skins
no.tasks_languages=Spr�k
no.tasks_allusers=Alle brukere
no.tasks_selectusers=Installer %1 for:
no.tasks_currentuser=Kun %1
no.tasks_multisetup=Flere brukere
no.tasks_firewall=Lag nytt unntak i Windows brannmur
no.tasks_upnp=Enable discovery of UPnP devices
no.tasks_deleteoldsetup=Slett eldre installasjonsfiler
no.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
no.run_skinexe=Kj�rer skin installasjon...
no.reg_incomingchat=Innkommende melding
no.reg_apptitle=Shareaza Ultimate File Sharing
no.icons_license=Lisens
no.icons_uninstall=Uninstall
no.icons_downloads=Downloads
no.icons_basicmode=Normalmodus
no.icons_tabbedmode=Fanemodus
no.icons_windowedmode=Vindumodus
no.dialog_shutdown=%1 kj�rer. �nsker du at %1 avsluttes slik at installasjonen kan fortsette?
no.dialog_firewall=Installasjonen klarte ikke � lage unntak for Shareaza i Windows Brannmuren. %nVennligst legg til shareaza i brannmurens unntak manuelt.
no.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
no.page_viruswarning_text=N�r du bruker internett b�r du alltid ha et oppdatert antivirus-program, for � beskytte deg fra trojaner, ormer, og annen skadelig programvare. Du kan finne en liste over gode antivirus-prgrammer og andre sikkerhetstips, for � beskytte din datamaskin, ved � f�lge denne linken:
no.page_viruswarning_title=Virusadvarsel
no.page_viruswarning_subtitle=Har du et antivirus-program installert?
no.CreateDesktopIcon=Vis ikon p� &skrivebordet
no.CreateQuickLaunchIcon=Vis et &Hurtigstarts-ikon
; Afrikaans
af.components_plugins=Inpropprogramme
af.components_skins=Omslagte
af.tasks_languages=Tale
af.tasks_allusers=Alle gebruikers van hierdie rekenaar
af.tasks_selectusers=Installeer %1 vir die volgende gebruikers:
af.tasks_currentuser=Vir %1 alleenlik
af.tasks_multisetup=Skakel ondersteuning vir veelvuldige gebruikers aan
af.tasks_firewall=Voeg 'n uitsondering by die Windows Netskans
af.tasks_upnp=Enable discovery of UPnP devices
af.tasks_deleteoldsetup=Skrap ou opstellersl�ers
af.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
af.run_skinexe=Hardloop omslagte installasie...
af.reg_incomingchat=Inkomende Geselsie-boodskap
af.reg_apptitle=Shareaza Ultimate File Sharing
af.icons_license=Lisensie-ooreenkoms
af.icons_uninstall=De�nstalleer
af.icons_downloads=Aflaaie
af.icons_basicmode=Normale Modus
af.icons_tabbedmode=Tabelmodus
af.icons_windowedmode=Venstermodus
af.dialog_shutdown=%1 is op die oomblik besig om te loop. Wil jy graag %1 sluit sodat die installasie kan voortgaan?
af.dialog_firewall=Die Opsteller kon nie Shareaza by die Windows netskans uitsonderings voeg nie.%nVoeg Shareaza asseblief met die hand op die uitsonderingslys.
af.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
af.page_viruswarning_text=Maak altyd seker dat jy 'n opgedateerde anti-virus program ge�nstalleer het wanneer jy die internet gebruik, om jou rekenaar te beskerm teen virusse, wurms, en ander ongewenste programme. Jy kan 'n lys van goeie anti-virus programme en ander sekuriteitswenke oor hoe om jou rekenaar te beskerm verkry deur die volgende skakel te volg:
af.page_viruswarning_title=Virus Waarskuwing
af.page_viruswarning_subtitle=Het jy 'n Anti-Virus program ge�nstalleer?
af.CreateDesktopIcon=Vertoon 'n &werkskerm ikoon
af.CreateQuickLaunchIcon=Vertoon 'n &Quick Launch ikoon
; Portuguese std
pt.components_plugins=Plugins
pt.components_skins=Skins
pt.tasks_languages=Linguagens
pt.tasks_allusers=Todos os usu�rios
pt.tasks_selectusers=Instalar %1 para:
pt.tasks_currentuser=somente %1
pt.tasks_multisetup=Ativar o suporte a v�rios usu�rios
pt.tasks_firewall=Adicionar exce��o ao Firewall do Windows
pt.tasks_upnp=Ativar a descoberta de dispositivos UPnP
pt.tasks_deleteoldsetup=Apagar os instaladores antigos
pt.tasks_resetdiscoveryhostcache=Resetar o Cache de Armazenamento e Descoberta
pt.run_skinexe=Instalando a Skin...
pt.reg_incomingchat=Mensagem de chat
pt.reg_apptitle=Shareaza Compartilhamento de Arquivos Incompar�vel
pt.icons_license=Licen�a
pt.icons_uninstall=Desinstalar
pt.icons_downloads=Downloads
pt.icons_basicmode=Modo Normal
pt.icons_tabbedmode=Modo de Abas
pt.icons_windowedmode=Modo de Janelas
pt.dialog_shutdown=O %1 est� sendo executado. Voc� gostaria que o %1 fosse fechado para que a instala��o continue?
pt.dialog_firewall=O Setup falhou em adicionar o Shareaza no Firewall do Windows.%nPor favor adicione o Shareaza a lista de exce��es manualmente.
pt.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
pt.page_viruswarning_text=Quando usando a internet, voc� deve sempre garantir que voc� tenha um scanner contra v�rus atualizado para proteger voc� de trojans, worms e outros programas maliciosos. Voc� pode achar uma lista de bons scanners contra v�rus e outras dicas de seguran�a para proteger o seu computador seguindo este link:
pt.page_viruswarning_title=Alerta contra V�rus
pt.page_viruswarning_subtitle=Voc� tem um programa Anti-V�rus instalado?
pt.CreateDesktopIcon=Criar �cone no &Ambiente de Trabalho
pt.CreateQuickLaunchIcon=Criar �cone na barra de Inicializa��o &R�pida
; Portuguese Braz
pt_br.components_plugins=Plugins
pt_br.components_skins=Skins
pt_br.tasks_languages=Multi-idioma
pt_br.tasks_allusers=Todos os Usu�rios
pt_br.tasks_selectusers=Instalar o %1 para:
pt_br.tasks_currentuser=s� para o %1
pt_br.tasks_multisetup=Ativar suporte para v�rios usu�rios
pt_br.tasks_firewall=Adicionar uma exce��o ao Firewall do Windows
pt_br.tasks_upnp=Ativar o descobrimento de dispositivos UPnP
pt_br.tasks_deleteoldsetup=Apagar os instaladores antigos
pt_br.tasks_resetdiscoveryhostcache=Resetar o Descobrimento e o Cache dos Hosts
pt_br.run_skinexe=Executando a instala��o das skins...
pt_br.reg_incomingchat=Mensagem de chat a entrar
pt_br.reg_apptitle=Shareaza o �ltimo Compartilhador de Arquivo
pt_br.icons_license=Licen�a
pt_br.icons_uninstall=Desinstalar
pt_br.icons_downloads=Downloads
pt_br.icons_basicmode=Modo Simples
pt_br.icons_tabbedmode=Modo em Abas
pt_br.icons_windowedmode=Modo de Janelas
pt_br.dialog_shutdown=O %1 est� rodando atualmente. Voc� gostaria que o %1 fosse fechado para que a instala��o possa continuar?
pt_br.dialog_firewall=A instala��o falhou ao tentar adicionar o Shareaza a lista de exce��es do Firewall do Windows.%nPor favor adicione o Shareaza a lista de exce��es manualmente.
pt_br.dialog_malwaredetected=Um malware foi detectado no seu sistema em %1, por favor remova-o com um scanner contra v�rus/malware antes de instalar o Shareaza. Voc� quer sair agora?
pt_br.page_viruswarning_text=Quando usar a Internet voc� deve sempre garantir que voc� tenha um scanner contra v�rus atualizado para proteger voc� de trojans, worms e outros programas maliciosos. Voc� pode achar uma lista de bons scanners contra v�rus e outras dicas de seguran�a para proteger seu computador seguindo este link:
pt_br.page_viruswarning_title=Aviso sobre_V�rus
pt_br.page_viruswarning_subtitle=Voc� tem um programa anti-v�rus instalado?
pt_br.CreateDesktopIcon=Exibir um �cone na &�rea de trabalho
pt_br.CreateQuickLaunchIcon=Exibir um �cone na barra de &Inicializa��o R�pida
pt_br.PathNotExist=Erro, o caminho da pasta %1 n�o existe
; French
fr.components_plugins=Plugins
fr.components_skins=Skins
fr.tasks_languages=Langues
fr.tasks_allusers=Tous les utilisateurs
fr.tasks_selectusers=Installer %1 pour :
fr.tasks_currentuser=%1 seulement
fr.tasks_multisetup=Activer le support multi-utilisateurs
fr.tasks_firewall=Ajouter une exception au Pare-feu Windows
fr.tasks_upnp=Activer UPnP pour essayer de d�couvrir les pare-feux/routeurs.
fr.tasks_deleteoldsetup=Voulez-vous supprimer les anciens fichiers d'installation de Shareaza ?
fr.tasks_resetdiscoveryhostcache=Remettre � z�ro les services de d�couverte et le tampon pour les h�tes
fr.run_skinexe=Installation de la skin en cours...
fr.reg_incomingchat=R�ception d'un message chat
fr.reg_apptitle=Shareaza Ultimate File Sharing
fr.icons_license=Licence
fr.icons_uninstall=D�sinstaller
fr.icons_downloads=T�l�chargements
fr.icons_basicmode=Mode simple
fr.icons_tabbedmode=Mode tabul�
fr.icons_windowedmode=Mode fen�tr�
fr.dialog_shutdown=%1 est en cours d'ex�cution. Voulez-vous quitter %1 pour que l'installation puisse se poursuivre ?
fr.dialog_firewall=L'installation n'a pas pu ajouter Shareaza au Pare-feu Windows.%nVeuillez ajouter Shareaza manuellement � la liste des exceptions.
fr.dialog_malwaredetected=Un logiciel malveillant a �t� d�tect� sur votre syst�me � %1, veuillez l'enlever avec un antivirus avant d'installer Shareaza. Voulez-vous quitter maintenant ?
fr.page_viruswarning_text=Lorsque vous utilisez internet, vous devriez toujours vous assurer que vous avez un antivirus � jour pour vous prot�ger des troyens (trojans), vers (worms), et autres programmes malveillants. Vous pouvez trouver une liste de bons antivirus et des conseils de s�curit� pour prot�ger votre ordinateur en suivant ce lien :
fr.page_viruswarning_title=Avertissement sur les virus
fr.page_viruswarning_subtitle=Avez-vous un antivirus install� ?
fr.CreateDesktopIcon=Afficher un raccourci sur le &Bureau
fr.CreateQuickLaunchIcon=Afficher un raccourci dans la barre de &Lancement rapide
; Spanish std
es.components_plugins=Plugins
es.components_skins=Skins
es.tasks_languages=Idiomas
es.tasks_allusers=Todos los usuarios
es.tasks_selectusers=Instalar %1 para:
es.tasks_currentuser=%1 solamente
es.tasks_multisetup=Habilitar soporte multi-usuario
es.tasks_firewall=Agregar una excepci�n al Firewall de Windows
es.tasks_upnp=Enable discovery of UPnP devices
es.tasks_deleteoldsetup=Borrar archivos de instaladores viejos
es.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
es.run_skinexe=Instalando Skin...
es.reg_incomingchat=Hay un mensaje de chat entrante
es.reg_apptitle=Shareaza Ultimate File Sharing
es.icons_license=Licencia
es.icons_uninstall=Desinstalar
es.icons_downloads=Descargas
es.icons_basicmode=Modo B�sico
es.icons_tabbedmode=Modo Avanzado
es.icons_windowedmode=Modo Ventanas
es.dialog_shutdown=%1 se encuentra ejecut�ndose. �Deseas que %1 sea cerrado para que la instalaci�n pueda continuar?
es.dialog_firewall=La instalaci�n fallo al agregar la excepci�n de Shareaza al cortafuego Firewall.%n Por favor h�galo manualmente.
es.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
es.page_viruswarning_text=Cuando estas usando Internet, debes siempre asegurarte que tienes un antivirus actualizado hasta la fecha para protegerte de troyanos, gusanos, y otros programas maliciosos. Puedes encontrar una lista de buenos antivirus y sugerencias de seguridad para proteger tu computadora en la siguiente direcci�n:
es.page_viruswarning_title=Peligro de Virus
es.page_viruswarning_subtitle=�Tienes un programa antivirus instalado?
es.CreateDesktopIcon=Mostrar/Quitar icono de &Escritorio
es.CreateQuickLaunchIcon=Mostrar/Quitar icono de &Inicio R�pido
; Spanish Mexican
es_mx.components_plugins=Plugins
es_mx.components_skins=Skins
es_mx.tasks_languages=Idiomas
es_mx.tasks_allusers=Todos los usuarios
es_mx.tasks_selectusers=Instalar %1 para:
es_mx.tasks_currentuser=%1 solamente
es_mx.tasks_multisetup=Habilitar soporte multi-usuario
es_mx.tasks_firewall=Agregar una excepci�n al Firewall de Windows
es_mx.tasks_upnp=Enable discovery of UPnP devices
es_mx.tasks_deleteoldsetup=Borrar archivos de instaladores viejos
es_mx.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
es_mx.run_skinexe=Instalando Skin...
es_mx.reg_incomingchat=Hay un mensaje de chat entrante
es_mx.reg_apptitle=Shareaza Ultimate File Sharing
es_mx.icons_license=Licencia
es_mx.icons_uninstall=Desinstalar
es_mx.icons_downloads=Descargas
es_mx.icons_basicmode=Modo B�sico
es_mx.icons_tabbedmode=Modo Avanzado
es_mx.icons_windowedmode=Modo Ventanas
es_mx.dialog_shutdown=%1 se encuentra ejecut�ndose. �Deseas que %1 sea cerrado para que la instalaci�n pueda continuar?
es_mx.dialog_firewall=La instalaci�n fallo al agregar la excepci�n de Shareaza al cortafuego Firewall.%n Por favor h�galo manualmente.
es_mx.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
es_mx.page_viruswarning_text=Cuando estas usando Internet, debes siempre asegurarte que tienes un antivirus actualizado hasta la fecha para protegerte de troyanos, gusanos, y otros programas maliciosos. Puedes encontrar una lista de buenos antivirus y sugerencias de seguridad para proteger tu computadora en la siguiente direcci�n:
es_mx.page_viruswarning_title=Peligro de Virus
es_mx.page_viruswarning_subtitle=�Tienes un programa antivirus instalado?
es_mx.CreateDesktopIcon=Mostrar/Quitar icono de &Escritorio
es_mx.CreateQuickLaunchIcon=Mostrar/Quitar icono de &Inicio R�pido
; Russian
ru.components_plugins=������
ru.components_skins=������
ru.tasks_languages=�����
ru.tasks_allusers=���� �������������
ru.tasks_selectusers=���������� %1 ���:
ru.tasks_currentuser=������ ��� %1
ru.tasks_multisetup=��������� ��������� ���������� �������������
ru.tasks_firewall=�������� � ������ ���������� ���������� Windows
ru.tasks_upnp=�������� ���������� �������� UPnP
ru.tasks_deleteoldsetup=������� ������ ������������
ru.tasks_resetdiscoveryhostcache=�������� ������� ���������� � ��� ������
ru.run_skinexe=��� ��������� ������...
ru.reg_incomingchat=�������� ��������� ��� ����
ru.reg_apptitle=Shareaza - ��������� ��� ������ �������
ru.icons_license=��������
ru.icons_uninstall=�������������
ru.icons_downloads=��������
ru.icons_basicmode=������� �����
ru.icons_tabbedmode=����� ��������
ru.icons_windowedmode=������� �����
ru.dialog_shutdown=%1 � ������ ������ ��������. ������ �� ��������� ������ %1, ����� ���������� ���������?
ru.dialog_firewall=��������� ��������� �� ������ �������� Shareaza � ������ ���������� ����������� Windows.%n����������, �������� �� � ���� ������ �������.
ru.dialog_malwaredetected=� ����� ������� ����������� ����������� ��������� (%1), ������� �� ����� ������������ Shareaza ��� ������� ������������ ��������� ��� �������. ������ ����� ������?
ru.page_viruswarning_text=������, ����� ����������� ����������, ��������������, ��� � ��� ���� �������� ������ ��� �������, ����� �������� ��������� �� �������, ������ � ������ ������������� ��������. �� ������ ����� ������ ������� �������� ��� ������� � ������ ������ � ������ ���������� �� ����� ������:
ru.page_viruswarning_title=��������������� � �������
ru.page_viruswarning_subtitle=������ �� �� ������������� ������������ ���������?
ru.CreateDesktopIcon=���������� ������ �� &������� �����
ru.CreateQuickLaunchIcon=���������� ������ � &������ �������� �������
ru.PathNotExist=������, ���� � ����� %1 �� ����������
; Greek
gr.components_plugins=???s?eta
gr.components_skins=F?????
gr.tasks_languages=???????ss?
gr.tasks_allusers=????? t??? ???ste?
gr.tasks_selectusers=???at?stas? %1 ??a:
gr.tasks_currentuser=%1 �???
gr.tasks_multisetup=??e???p???s? ?p?st?????? p???ap??? ???st??
gr.tasks_firewall=???s???? e?a??es?? st? ?e???? ???stas?a? t?? Windows
gr.tasks_upnp=??e???p???s? a?a??????? s?s?e??? UPnP
gr.tasks_deleteoldsetup=??a??af? pa?e?? e??atastat??
gr.tasks_resetdiscoveryhostcache=?pa?af??? ??a?a???e?? ?a? Hostcache
gr.run_skinexe=???at?stas? f????? se e??????...
gr.reg_incomingchat=??se???�e?? �???�a s???�???a?
gr.reg_apptitle=Shareaza Ultimate File Sharing
gr.icons_license=?de?a
gr.icons_uninstall=?pe??at?stas?
gr.icons_downloads=???e??
gr.icons_basicmode=?as??? ???f?
gr.icons_tabbedmode=???f? ?a?te???
gr.icons_windowedmode=???f? ?a?a?????
gr.dialog_shutdown=?? %1 a?t?? t? st??�? e?te?e?ta?. T??ete ?a te?�at?ste? ? ?e?t?????a t?? %1 ?ste ?a s??e??ste? ? e??at?stas?;
gr.dialog_firewall=? e??at?stas? ap?t??e ?a p??s??se? t? Shareaza st? ?e???? ???stas?a? t?? Windows.%n?a?a?a?? p??s??ste t? Shareaza st? ??sta e?a???se?? ?e???????ta.
gr.dialog_malwaredetected=??t?p?st??e ?a??�???? ????s�??? st? %1. ?a?a?a?? afa???ste t? �e ??p??? ?a?a??st??? p????a��a p??? e??atast?sete t? Shareaza. ???d?? t??a;
gr.page_viruswarning_text=?ta? ???s?�?p??e?te t? d?ad??t??, ?a p??pe? p??ta ?a ??ete se ?e?t?????a ??a e??�e??�??? p????a��a p??stas?a? ap? ???? ?a? ???a ?a??�???a ????s�???. ?p??e?te ?a �?e?te �?a ??sta �e ?a?? p?????��ata ?a? ???a �????�ata p??stas?a? t?? ?p?????st? sa? st?? e??? ?st?se??da:
gr.page_viruswarning_title=???e?d?p???s? ??a ??
gr.page_viruswarning_subtitle=??ete e??atest?�??? ??p??? ??t?�??t??? ?????a��a;
gr.CreateDesktopIcon=?�f???s? e?????d??? st?? &?p?f??e?a ???as?a?
gr.CreateQuickLaunchIcon=?�f???s? e?????d??? st?? &?p??a G??????? ??????s??
gr.PathNotExist=Sf??�a. ? ??s? t?? fa????? %1 de? ?p???e?
; Hungarian
hu.components_plugins=Pluginek
hu.components_skins=Kin�zetek
hu.tasks_languages=Nyelvek telep�t�se
hu.tasks_allusers=Minden felhaszn�l�
hu.tasks_selectusers=Megadott felhasz�l�:
hu.tasks_currentuser=Jelenlegi felhaszn�l�
hu.tasks_multisetup=T�bbfelhaszn�l�s m�d enged�lyez�se
hu.tasks_firewall=Felv�tel a Windows t�zfal kiv�teleihez
hu.tasks_upnp=Automatikus routerbe�ll�t�s (UPnP szolg�ltat�s)
hu.tasks_deleteoldsetup=R�gi telep�t�k t�rl�se
hu.tasks_resetdiscoveryhostcache=A Szerverkeres� �s a Kiszolg�l�k list�j�nak alaphelyzetbe �ll�t�sa
hu.run_skinexe=Kin�zet telep�t�se folyamatban...
hu.reg_incomingchat=Bej�v� chat �zenet
hu.reg_apptitle=Shareaza f�jlmegoszt� program
hu.icons_license=Licenc
hu.icons_uninstall=Shareaza elt�vol�t�sa
hu.icons_downloads=Let�lt�sek
hu.icons_basicmode=Egyszer� n�zet
hu.icons_tabbedmode=�sszetett n�zet
hu.icons_windowedmode=Ablakos n�zet
hu.dialog_shutdown=A %1 jelenleg fut. Be akarja z�rni a programot, hogy a telep�t�s folytat�dhasson?
hu.dialog_firewall=A telep�t� nem tudta hozz�adni a Shareaz�t a Windows t�zfal kiv�teleihez.%nManu�lisan kell ezt megtenni.
hu.dialog_malwaredetected=A telep�t� egy k�rt�kony programot tal�lt a rendszerben: %1. Miel�tt telep�ten� a Shareaz�t, el�bb t�vol�tsa el azt. Ki akar most l�pni?
hu.page_viruswarning_text=Az internet haszn�lata sor�n mindig legyen feltelep�tve egy, a legfrissebb v�rusadatb�zissal rendelkez� antiv�rus program, ami megv�d a f�rgekt�l, tr�jai �s egy�b k�rt�kony programokt�l. Ha k�veti ezt a linket, sok j� v�ruskeres�t tal�lhat �s tov�bbi hasznos tippeket kaphat a sz�m�t�g�p v�delm�r�l:
hu.page_viruswarning_title=V�rusvesz�ly
hu.page_viruswarning_subtitle=Van feltelep�tett antiv�rus programja?
hu.CreateDesktopIcon=Ikon l�trehoz�sa az &Asztalon
hu.CreateQuickLaunchIcon=Ikon l�trehoz�sa a &Gyorsind�t�s eszk�zt�ron
hu.PathNotExist=Hiba, a megadott %1 mappa nem l�tezik
; Chinese Simp
chs.components_plugins=���
chs.components_skins=Ƥ��
chs.tasks_languages=����
chs.tasks_allusers=�����û�
chs.tasks_selectusers=��װ %1 Ϊ:
chs.tasks_currentuser=�� %1
chs.tasks_multisetup=���ö��û�֧��
chs.tasks_firewall=����һ�����⵽ Windows ����ǽ
chs.tasks_upnp=���� UPnP ��������ѯ
chs.tasks_deleteoldsetup=ɾ���ɵİ�װ�ļ�
chs.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
chs.run_skinexe=��װƤ��...
chs.reg_incomingchat=����������Ϣ
chs.reg_apptitle=Shareaza �ռ��ļ�����
chs.icons_license=����
chs.icons_uninstall=ж��
chs.icons_downloads=����
chs.icons_basicmode=��ͨģʽ
chs.icons_tabbedmode=��ǩģʽ
chs.icons_windowedmode=�Ӵ�ģʽ
chs.dialog_shutdown=%1 �������С���ϣ���ر� %1 �Ա������װ��
chs.dialog_firewall=��װ���� Shareaza �� Windows ����ǽʧ�ܡ�%n�뽫 Shareaza �ֶ������������б���
chs.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
chs.page_viruswarning_text=�����û�����ʱ������Ҫȷ����ӵ�����µĲ���ɨ�������Ա���������ľ���������������������ֺ����������������������ҵ��ϺõĲ���ɨ���������б��Լ������������ļ�����İ�ȫ����:
chs.page_viruswarning_title=��������
chs.page_viruswarning_subtitle=����װ�˷�������������
chs.CreateDesktopIcon=��ʾ����ͼ��(&D)
chs.CreateQuickLaunchIcon=��ʾ����������ͼ��(&Q)
; Swedish
sv.components_plugins=Insticksprogram
sv.components_skins=Skinn
sv.tasks_languages=Spr�k
sv.tasks_allusers=Alla anv�ndare
sv.tasks_selectusers=Installera %1 f�r:
sv.tasks_currentuser=%1 endast
sv.tasks_multisetup=Aktivera st�d f�r flera anv�ndare
sv.tasks_firewall=L�gg till ett undantag till Windows brandv�gg
sv.tasks_upnp=Till�t uppt�ckt av UPnP-enheter
sv.tasks_deleteoldsetup=Radera gamla installationer
sv.tasks_resetdiscoveryhostcache=�terst�ll uppt�ckstj�nster och v�rdcache
sv.run_skinexe=K�r skinninstallation...
sv.reg_incomingchat=Inkommande chattmeddelande
sv.reg_apptitle=Shareaza ultimat fildelning
sv.icons_license=Licens
sv.icons_uninstall=Avinstallera
sv.icons_downloads=Nedladdningar
sv.icons_basicmode=Normalt l�ge
sv.icons_tabbedmode=Tabbl�ge
sv.icons_windowedmode=F�nsterl�ge
sv.dialog_shutdown=%1 k�rs f�r tillf�llet. Vill du att %1 ska st�ngas ned s� att installationen kan forts�tta?
sv.dialog_firewall=Installationsprogrammet lyckades inte l�gga till Shareaza till brandv�ggen i Windows .%nL�gg till Shareaza till undantagslistan manuellt.
sv.dialog_malwaredetected=Skadlig programvara har hittats p� din dator vid %1, ta bort den med ett antivirusprogram innan du installerar Shareaza. Vill du avbryta nu?
sv.page_viruswarning_text=N�r du anv�nder internet ska du alltid f�rs�kra dig om att du har ett uppdaterat antivirusprogram som skyddar dig mot trojaner, maskar och andra skadliga program. H�r finns en lista p� bra antivirusprogram och andra s�kerhetstips f�r att skydda din dator:
sv.page_viruswarning_title=Virusvarning
sv.page_viruswarning_subtitle=Har du ett antivirusprogram installerat?
sv.CreateDesktopIcon=Skapa en ikon p� srivbordet
sv.CreateQuickLaunchIcon=Skapa en ikon i Snabbstartf�ltet
sv.PathNotExist=S�kv�gen till mappen %1 existerar inte
; Finnish
fi.components_plugins=Laajennukset
fi.components_skins=Ulkoasut
fi.tasks_languages=Kielet
fi.tasks_allusers=Kaikille k�ytt�jille
fi.tasks_selectusers=Asenna %1 k�ytt�jille:
fi.tasks_currentuser=%1 vain
fi.tasks_multisetup=Asenna kaikille koneen k�ytt�jille
fi.tasks_firewall=Lis�� poikkeus Windowsin palomuuriin
fi.tasks_upnp=Enable discovery of UPnP devices
fi.tasks_deleteoldsetup=Poista vanhat asennusohjelmat
fi.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
fi.run_skinexe=K�ynniss� ulkoasujen asennus...
fi.reg_incomingchat=Tuleva keskusteluviesti
fi.reg_apptitle=Shareaza jako-ohjelma
fi.icons_license=Lisenssi
fi.icons_uninstall=Poista
fi.icons_downloads=Lataukset
fi.icons_basicmode=Normaali Tila
fi.icons_tabbedmode=V�lilehti Tila
fi.icons_windowedmode=Ikkunoitu Tila
fi.dialog_shutdown=%1 on t�ll� hetkell� k�ynniss�. Haluatko ett� %1 suljetaan jotta asennus voisi jatkua?
fi.dialog_firewall=Asentaja ep�onnistui lis�tess��n Shareazaa Windowsiin Firewall.%nOle hyv� ja lis�� Shareaza poikkeuslistaan manuaalisesti.
fi.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
fi.page_viruswarning_text=Kun k�yt�t interneti�, sinun tulee aina varmistaa ett� sinulla on viimeisimm�t p�ivitykset virusohjelmissasi jotka suojaavat sinua troijalaisilta, madoilta, ja muilta haittaohjelmilta. L�yd�t hyv�n listan hyvist� virusohjelmista ja turvallisuusvinkkej� seuraavista linkeist�:
fi.page_viruswarning_title=Virus Varoitus
fi.page_viruswarning_subtitle=Onko sinulla AntiVirus ohjelmaa asennettuna?
fi.CreateDesktopIcon=Luo kuvake ty�p�yd�lle
fi.CreateQuickLaunchIcon=Luo kuvake pikak�ynnistyspalkkiin
; Hebrew
heb.components_plugins=������
heb.components_skins=������
heb.tasks_languages=����
heb.tasks_allusers=�� ��������
heb.tasks_selectusers=���� �� %1 ����
heb.tasks_currentuser=%1 ��
heb.tasks_multisetup=���� ����� �������� ������
heb.tasks_firewall=���� ��� ����� ��� ������� ����
heb.tasks_upnp=Enable discovery of UPnP devices
heb.tasks_deleteoldsetup=��� ������ �����
heb.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
heb.run_skinexe=���� ����� ������...
heb.reg_incomingchat=����� �'�� �����
heb.reg_apptitle=����� ������ ����������� �� ����
heb.icons_license=�����
heb.icons_uninstall=��� �����
heb.icons_downloads=������
heb.icons_basicmode=��� ����
heb.icons_tabbedmode=��� �����
heb.icons_windowedmode=��� ������
heb.dialog_shutdown=?���� %1 ���� ��� �� ���� ����� �� %1 �� ������� ���� �����
heb.dialog_firewall=������ ����� ������ �� ���� �� ���� ���%n��� ���� �� ���� ������ ������� ����� ��� ����� ����
heb.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
heb.page_viruswarning_text=����/� ����� �������� ����� ���� ����� ������ ���� ����-����� ������ ����� ���� �������/������/������, ������ �� ����-������� ������ ����� ����� ��� ������ ���:
heb.page_viruswarning_title=����� �����
heb.page_viruswarning_subtitle=?��� �� �� ����� ����-����� ������
heb.CreateDesktopIcon= ��� ��� �� �&���� �����
heb.CreateQuickLaunchIcon=��� ��� �� �&���� �����
; Polish
pl.components_plugins=Wtyczki
pl.components_skins=Sk�rki
pl.tasks_languages=J�zyki
pl.tasks_allusers=Dla wszystkich u�ytkownik�w
pl.tasks_selectusers=Instaluj dla %1:
pl.tasks_currentuser=tylko %1
pl.tasks_multisetup=W��cz obs�ug� wielu u�ytkownik�w
pl.tasks_firewall=Dodaj wyj�tek do Firewall'a Windows'a
pl.tasks_upnp=Enable discovery of UPnP devices
pl.tasks_deleteoldsetup=Usu� stare instalatory
pl.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
pl.run_skinexe=Instalowanie sk�rek...
pl.reg_incomingchat=Przychodz�ca wiadomo�� chatowa
pl.reg_apptitle=Shareaza Ultimate File Sharing
pl.icons_license=Licencja
pl.icons_uninstall=Odinstaluj
pl.icons_downloads=Pobierania
pl.icons_basicmode=Tryb normalny
pl.icons_tabbedmode=Tryb zaawansowany
pl.icons_windowedmode=Tryb okienkowy
pl.dialog_shutdown=%1 obecnie dzia�a. Czy chcia�by� wy��czy� %1 aby kontynuowa� instalacj�?
pl.dialog_firewall=Instalator nie potrafi� doda� Shareazy do Firewall'a Windows'a.%nProsz� doda� Shareaz� do listy wyj�tk�w r�cznie.
pl.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
pl.page_viruswarning_text=Podczas u�ywania internetu zawsze powiniene� by� pewny, �e masz program antywirusowy z aktualn� baz� wirus�w, kt�ry ci� ochroni przed trojanami, robakami i innym niebezpiecznym oprogramowaniem. Mo�esz znale�� list� dobrych program�w antywirusowych i porady jak zabezpieczy� komputer pod nast�puj�cymi adresami:
pl.page_viruswarning_title=Ostrze�enie przed wirusem
pl.page_viruswarning_subtitle=Czy masz zainstalowany jaki� program antywirusowy?
pl.CreateDesktopIcon=Wy�wietl ikon� na pulpicie
pl.CreateQuickLaunchIcon=Wy�wietl ikon� na pasku szybkiego uruchamiania
; Serbian
sr.components_plugins=Pluginovi
sr.components_skins=Skinovi
sr.tasks_languages=Jezici
sr.tasks_allusers=Svi korisnici
sr.tasks_selectusers=Instaliraj %1 za:
sr.tasks_currentuser=%1 samo
sr.tasks_multisetup=Omogu�i vi�e-korisni�ku podr�ku
sr.tasks_firewall=Dodaj izuzetak u Windows Vatrozid
sr.tasks_upnp=Enable discovery of UPnP devices
sr.tasks_deleteoldsetup=Ukloni stare instalere
sr.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
sr.run_skinexe=Instalacija skina u toku...
sr.reg_incomingchat=Dolaze�e cet poruke
sr.reg_apptitle=Shareaza Najbolji P2P za Deljenje Datoteka
sr.icons_license=Licenca
sr.icons_uninstall=Ukloni Program
sr.icons_downloads=Skinutno
sr.icons_basicmode=Normalni Prikaz
sr.icons_tabbedmode=Prikaz s Karticama
sr.icons_windowedmode=U Prozoru
sr.dialog_shutdown=%1 je uklju�ena. Da li bi �eleli da %1 bude uga�ena da bi se instalacija nastavila?
sr.dialog_firewall=Instalacija nije uspla da doda Shareaza-u u Windows Vatrozid.%nMolimo dodajte Shareaza-u na listu izuzetaka ru�no.
sr.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
sr.page_viruswarning_text=Kada koristite internet, trebali bi uvek da budete sigurni da imate a�uriaran virus skener koji Vas �titi od trojanaca, crva, i drugih zlonamernih programa. Mo�ete prona�i listu dobrih anti-virus programa i drugih sigurnosnih saveta kako da za�titite Va� ra�unar prate�i ovaj link:
sr.page_viruswarning_title=Virus Uopzorenje
sr.page_viruswarning_subtitle=Da li imate AntiVirus program instaliran?
sr.CreateDesktopIcon=Napravi &desktop ikonu
sr.CreateQuickLaunchIcon=Napravi &Brzo Pokretanje(QL) ikonu
;Turkish
tr.components_plugins=Eklentiler
tr.components_skins=Aray�zler
tr.tasks_languages=Diller
tr.tasks_allusers=T�m Kullan�c�lar
tr.tasks_selectusers=%1 Kuruldu:
tr.tasks_currentuser=Sadece %1
tr.tasks_multisetup=�oklu kullan�c� deste�ini etkinle�tir
tr.tasks_firewall=Windows G�venlik Duvar�na bir de�i�iklik ekle
tr.tasks_upnp=UPnP cihazlarin kesfini etkinlestir
tr.tasks_deleteoldsetup=Eski kurulumlar� sil
tr.tasks_resetdiscoveryhostcache=Kesif servisleri ile host bellegini sifirla
tr.run_skinexe=Aray�z kurulumu �al���yor...
tr.reg_incomingchat=Gelen sohbet mesaj�
tr.reg_apptitle=Shareaza En iyi Dosya Payla��m�
tr.icons_license=Lisans
tr.icons_uninstall=Kurulumu Kald�r
tr.icons_downloads=�ndirmeler
tr.icons_basicmode=Temel Mod
tr.icons_tabbedmode=Sekmeli Mod
tr.icons_windowedmode=Pencereli Mode
tr.dialog_shutdown=�uan %1 �al���yor.Kurulumun devam edebilmesi i�in %1'in kapal� olmas�n� istiyor musunuz?
tr.dialog_firewall=Windows g�venlik duvar�na Shareaza kurulumunu eklemek ba�ar�s�z oldu.%n L�tfen Shareaza'y� el ile istisna listesine ekle
tr.dialog_malwaredetected=K�t�c�l bir yazilim %1'de tespit edilmistir, Shareaza'nin kurulumundan �nce s�z� ge�en k�t�c�l yazilimi bir antivirus programi kullanarak sisteminizden silmeniz gerekmektedir. Simdi terk etmek ister misiniz?
tr.page_viruswarning_text=�nternet kullan�yorken, trojanlardan, wormlardan ve di�er k�t� niyetli programlardan sizi koruyan g�ncel bir vir�s taray�c�s�na sahip oldu�unuzdan emin olmal�s�n�z. Bu ba�lant�y� izleyerek bilgisayar�n�z� koruyan iyi vir�s taray�c�lar�n�n ve di�er g�venlik tiplerinin listesini bulacaks�n�z:
tr.page_viruswarning_title=Vir�s Uyar�s�
tr.page_viruswarning_subtitle=Bir AntiVirus program� y�klediniz mi?
tr.CreateDesktopIcon=Bir &Masa�st� ikonu g�r�nt�le
tr.CreateQuickLaunchIcon=Bir &H�zl� Ba�lat ikonu g�r�nt�le
; Czech
cz.components_plugins=Dopl�ky
cz.components_skins=Skiny
cz.tasks_languages=V�ce jazyk�
cz.tasks_allusers=v�echny u�ivatele
cz.tasks_selectusers=Instalovat %1 pro:
cz.tasks_currentuser=jen %1
cz.tasks_multisetup=Povolit p��stup v�ce u�ivatel�
cz.tasks_firewall=P�idat pravidlo do Windows firewallu
cz.tasks_upnp=Povolit zji��ov�n� UPnP za��zen�
cz.tasks_deleteoldsetup=Smazat star� instal�tory
cz.tasks_resetdiscoveryhostcache=Obnovit seznamy server�
cz.run_skinexe=Spou�t�m instalaci skin�...
cz.reg_incomingchat=P��choz� zpr�va chatu
cz.reg_apptitle=Shareaza Ultimate File Sharing
cz.icons_license=Licence
cz.icons_uninstall=Odinstalovat
cz.icons_downloads=Sta�en� soubory
cz.icons_basicmode=Norm�ln� re�im
cz.icons_tabbedmode=Re�im z�lo�ek
cz.icons_windowedmode=Re�im oken
cz.dialog_shutdown=Aplikace %1 je spu�t�na. Chcete ukon�it %1 a pokra�ovat v instalaci?
cz.dialog_firewall=Instal�tor nem��e p�idat pravidlo pro Shareazu do nastaven� Windows Firewallu.%nPros�m p�idejte pravidlo ru�n�.
cz.dialog_malwaredetected=Byl nalezen �kodliv� software (malware) v %1. P�ed pokra�ov�n� instalace jej pros�m odstra�te pomoc� vhodn�ho n�stroje pro odstra�ov�n� �kodliv�ho softwaru. Ukon�it instalaci?
cz.page_viruswarning_text=P�i pou��v�n� internetu se v�dy ujist�te, �e m�te aktu�ln� antivirov� program, kter� v�s chr�n� p�ed nebezpe�n�mi a �kodliv�mi programy. Seznam vhodn�ch program� a dal�� rady t�kaj�c� se bezpe�nosti m��ete nal�zt na n�sleduj�c� adrese:
cz.page_viruswarning_title=Nalezen virus
cz.page_viruswarning_subtitle=M�te nainstalovan� antivirov� program?
cz.CreateDesktopIcon=Zobrazovat ikonu na &plo�e
cz.CreateQuickLaunchIcon=Zobrazovat ikonu v panelu &Snadn� spou�t�n�
; japanese
ja.components_plugins=�v���O�C��
ja.components_skins=�X�L��
ja.tasks_languages=����t�@�C��
ja.tasks_allusers=���ׂẴ��[�U�[
ja.tasks_selectusers=%1�����悤���郆�[�U�[:
ja.tasks_currentuser=%1�̂�
ja.tasks_multisetup=�}���`���[�U�[�T�|�[�g
ja.tasks_firewall=Windows�t�@�C���[�E�H�[���̗�O�ɐݒ�
ja.tasks_upnp=UPnP�Ή��@��̌��o��L���ɂ���
ja.tasks_deleteoldsetup=�Â��C���X�g�[���[�̍폜
ja.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
ja.run_skinexe=�X�L���C���X�g�[���[�����s���Ă��܂�...
ja.reg_incomingchat=�`���b�g���b�Z�[�W���󂯓����
ja.reg_apptitle=Shareaza�t�@�C�����L�\�t�g
ja.icons_license=���C�Z���X
ja.icons_uninstall=�A���C���X�g�[��
ja.icons_downloads=�_�E�����[�h
ja.icons_basicmode=�W�����[�h
ja.icons_tabbedmode=�^�u���[�h
ja.icons_windowedmode=�E�B���h�E���[�h
ja.dialog_shutdown=%1 ���������ł�. %1���I�����ăC���X�g�[���𑱂��܂���?
ja.dialog_firewall=WindowsXP�t�@�C���[�E�H�[���̓o�^�Ɏ��s���܂���.%n�蓮�œo�^���Ă�������.
ja.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
ja.page_viruswarning_text=���Ȃ����C���^�[�l�b�g�ɐڑ�����Ƃ��́A�g���C�⃏�[�����́A����ȊO�̊댯�ȃt�@�C������PC��ی삷�邽�߂ɁA�K���E�C���X��`�t�@�C�����ŐV�̂��̂ɂ��܂��傤�B�E�C���X�X�L���i�[��Z�L�����e�B-�Ɋւ����񂪉��L�̃����N�ɂ���܂��B
ja.page_viruswarning_title=�E�C���X�̌x��
ja.page_viruswarning_subtitle=�A���`�E�E�C���X�E�\�t�g�͓����Ă��܂���?
ja.CreateDesktopIcon=�f�X�N�g�b�v�ɃA�C�R����\��(&d)
ja.CreateQuickLaunchIcon=�N�C�b�N�����`�ɃA�C�R����\��(&Q)
; arabic
ar.components_plugins=������� ��������
ar.components_skins=��������
ar.tasks_languages=������
ar.tasks_allusers=���� ����������
ar.tasks_selectusers=�� ��� %1 �����:
ar.tasks_currentuser=%1 ���
ar.tasks_multisetup=����� ����� ���� ��������
ar.tasks_firewall=����� ������� ��� ���� �������� ������
ar.tasks_upnp=Enable discovery of UPnP devices
ar.tasks_deleteoldsetup=��� ����� ������� �������
ar.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
ar.run_skinexe=...��� ����� ����� ������
ar.reg_incomingchat=����� ������ �����
ar.reg_apptitle=���-��� �������� ����� ������ ��������
ar.icons_license=������
ar.icons_uninstall=����� �������
ar.icons_downloads=���������
ar.icons_basicmode=���� ����
ar.icons_tabbedmode=���� �����
ar.icons_windowedmode=���� �� �����
ar.dialog_shutdown=%1 ���� ����� . �� ���� ����� %1 ������ ������� �
ar.dialog_firewall=��� ������� �� ����� ���-��� ��� ������ ����� �������� %n������ ����� ���-��� ��� ����� ����������� �����
ar.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
ar.page_viruswarning_text=����� ������� �������� � ��� �� ����� �� ���� ���� ������ ������� ���� . ����� ������ ��� ����� ��������� � ����� ����� ���� ������ �������� �� ��� ������:
ar.page_viruswarning_title=����� �� ���������
ar.page_viruswarning_subtitle=�� ���� ������ ��������� �
ar.CreateDesktopIcon=����� &������ ��� ������
ar.CreateQuickLaunchIcon=����� &������ ������� ������
; estonian
ee.components_plugins=Pluginad
ee.components_skins=Nahad
ee.tasks_languages=Keeled
ee.tasks_allusers=K�ik kasutajad
ee.tasks_selectusers=Installi %1 jaoks:
ee.tasks_currentuser=%1 ainult
ee.tasks_multisetup=V�imalda mitmekasutaja tugi
ee.tasks_firewall=Lisa erand Windowsi Tulem��ri
ee.tasks_upnp=Enable discovery of UPnP devices
ee.tasks_deleteoldsetup=Kustuta vanad installerid
ee.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
ee.run_skinexe=K�ivitan Naha installi...
ee.reg_incomingchat=Sisse tulev vestlusteade
ee.reg_apptitle=Shareaza �lim Failijagamine
ee.icons_license=Litsents
ee.icons_uninstall=Uninstalli
ee.icons_downloads=T�mbamised
ee.icons_basicmode=Tavaline Vaade
ee.icons_tabbedmode=Sakiline Vaade
ee.icons_windowedmode=Akendega Vaade
ee.dialog_shutdown=%1 t��tab hetkel. Kas tahad  %1 sulgeda, et saaksid installeerimist j�tkata?
ee.dialog_firewall=Installeril eba�nnestus Shareaza lisamine Windowsi Tulem��ri.%Palun lisa Shareaza k�sitsi erandite nimekirja.
ee.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
ee.page_viruswarning_text=Internetti kasutades peaksid kontrollima, et sul oleks uusim viiruset�rje, et kaitsta ennast troojalaste, usside, viiruste ja teiste kahjulike programmide eest. Sa leiad nimekirja headest viirus sk�nneritest ja teisi turva n�uandeid oma arvuti kaitseks sellelt lingilt:
ee.page_viruswarning_title=Viiruse Hoiatus
ee.page_viruswarning_subtitle=Kas sul on AntiVirus programm installeeeritud?
ee.CreateDesktopIcon=Loo &T��laua ikoon
ee.CreateQuickLaunchIcon=Loo &Quick Launch ikoon
; Chinese Trad
tw.components_plugins=�~��
tw.components_skins=�~�[
tw.tasks_languages=�y��
tw.tasks_allusers=�Ҧ����ϥΪ�
tw.tasks_selectusers=���o�ǨϥΪ̦w�� %1:
tw.tasks_currentuser=�u�� %1
tw.tasks_multisetup=�ҥΦh���ϥΪ̤䴩
tw.tasks_firewall=�W�[�ҥ~�� Windows ������ (XP)
tw.tasks_upnp=Enable discovery of UPnP devices
tw.tasks_deleteoldsetup=�R���ª��w�˵{��
tw.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
tw.run_skinexe=���b�w�˥~�[...
tw.reg_incomingchat=��J����ѰT��
tw.reg_apptitle=Shareaza---�̲ת��ɮפ��ɳn��
tw.icons_license=�n����v��w
tw.icons_uninstall=�Ѱ��w��
tw.icons_downloads=�U��
tw.icons_basicmode=�зǼҦ�
tw.icons_tabbedmode=���ҼҦ�
tw.icons_windowedmode=�h�������Ҧ�
tw.dialog_shutdown=%1 ���b�B�@��. �z�n���� %1 , ���w�˵{���o�H�~��i���?
tw.dialog_firewall=�w�˵{���L�k�s�W Shareaza ��Windows ������.%n�Ф�ʷs�W Shareaza �ܨҥ~�M��
tw.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
tw.page_viruswarning_text=�ϥκ��ں�����, �z�����`�O�T�O���r�n�鬰�̷s����, �p���~��O�@�z�קK����차, į��, �άO�c�N�{�����I�`. �z�i�H�I��o�ӳs�����o�w���ʯ��Z�P�}�n���r�n�骺�M��:
tw.page_viruswarning_title=�f�rĵ�i
tw.page_viruswarning_subtitle=�z�O�_�w�g�w�ˤF�@�Ө��r�n��?
tw.CreateDesktopIcon=�зs�W�@��&�ୱ�ϥ�
tw.CreateQuickLaunchIcon=�зs�W�@��&�ֳt�Ұʹϥ�
; Slovenian
sl.components_plugins=Vti�niki
sl.components_skins=Preobleke
sl.tasks_languages=Jeziki
sl.tasks_allusers=Vsi uporabniki
sl.tasks_selectusers=Namesti %1 za:
sl.tasks_currentuser=Samo %1
sl.tasks_multisetup=Omogo�i ve�-uporabni�ko podporo
sl.tasks_firewall=Dodaj izjemo v Windows po�arni zid
sl.tasks_upnp=Enable discovery of UPnP devices
sl.tasks_deleteoldsetup=Bri�i stare name��evalce
sl.tasks_resetdiscoveryhostcache=Reset Discovery and Hostcache
sl.run_skinexe=Namestitev preobleke v teku...
sl.reg_incomingchat=Vhodno kramljalno sporo�ilo
sl.reg_apptitle=Izjemno Shareaza deljenje datotek
sl.icons_license=Licenca
sl.icons_uninstall=Odnamestitev
sl.icons_downloads=Prenosi
sl.icons_basicmode=Navadni na�in
sl.icons_tabbedmode=Na�in z zavihki
sl.icons_windowedmode=Na�in z okni
sl.dialog_shutdown=%1 je trenutno v teku. Ali �elite zapreti %1 zato, da se lahko nadaljuje namestitev?
sl.dialog_firewall=Program namestitve ni uspel dodati Shareaze v po�arni zid Windows-ov.%nShareazo boste morali ro�no dodati v seznam izjem v po�arnem zidu.
sl.dialog_malwaredetected=A malware has been detected on your system at %1, please remove it with a virus/malware scanner before installing Shareaza. Do you want to exit now?
sl.page_viruswarning_text=Pri uporabi medmre�ja imejte name��eno vedno najnovej�o razli�ico protivirusne za��ite. Tako boste kar najbolje za��iteni pred trojanskimi konji, �rvi in drugimi zlonamernimi programji. Seznam dobrih protivirusnih programov, ter drugih nasvetov glede za��ite va�ega ra�unalnika, boste na�li preko naslednje spletne povezave:
sl.page_viruswarning_title=Virusno opozorilo
sl.page_viruswarning_subtitle=Ali imate name��en protivirusni program?
sl.CreateDesktopIcon=Prika�i ikono &namizja
sl.CreateQuickLaunchIcon=Prika�i ikono &Hitrega zaganjalnika
; Catalan
ca.components_plugins=Agregats (plug-in)
ca.components_skins=Pells (skins)
ca.tasks_languages=Idiomes
ca.tasks_allusers=Tots els usuaris
ca.tasks_selectusers=Instal�lar %1 per a:
ca.tasks_currentuser=%1 �nicament
ca.tasks_multisetup=Habilita el suport multi-usuari
ca.tasks_firewall=Afegeix una excepci� al tallafocs del Windows
ca.tasks_upnp=Habilita el descobriment de dispositius UPnP
ca.tasks_deleteoldsetup=Esborra instal�lacions antigues
ca.tasks_resetdiscoveryhostcache=Reestableix els serveis de descobriment i cax� de servidors
ca.run_skinexe=Executant la instal�laci� de la pell (skin)...
ca.reg_incomingchat=Missatge de xat entrant
ca.reg_apptitle=Shareaza: compartici� d'arxius d'�ltima generaci�
ca.icons_license=Llic�ncia
ca.icons_uninstall=Desinstal�laci�
ca.icons_downloads=Desc�rregues
ca.icons_basicmode=Mode normal
ca.icons_tabbedmode=Mode en pestanyes
ca.icons_windowedmode=Mode de finestres
ca.dialog_shutdown=%1 est� sent executat. Dessitja que %1 siga aturat per que la instal�laci� puga continuar?
ca.dialog_firewall=La instal�laci� ha fallat mentre s'afegia una exepci� al tallafocs del Windows.%nSi us plau, afegeix Shareaza al llistat d'excepcions manualment.
ca.dialog_malwaredetected=Shareaza ha detectat un arxiu malici�s (malware) a %1. Si us plau, elimine'l amb un antivirus abans d'instal�lar. Vol sortir de la instal�laci�?
ca.page_viruswarning_text=Mentre utilitzes Internet, has d'assegurar-te que tens un antivirus actualitzat per a protegir-te de troians, cucs, virus i altres programes maliciosos. Pots consultar un llistat de programari antivirus i consells de seguretat fent clic a la seg�ent drecera:
ca.page_viruswarning_title=Advert�ncia de virus
ca.page_viruswarning_subtitle=Tens un programa antiv�ric instal�lat?
ca.CreateDesktopIcon=Afegeix una icona a l'&escriptori
ca.CreateQuickLaunchIcon=Afegeix una icona a la barra d'Acc�s R�pid
ca.PathNotExist=Error: la carpeta %1 no existeix.
; Albanian
sq.components_plugins=Spina
sq.components_skins=Veshje
sq.tasks_languages=Shum� gjuh�
sq.tasks_allusers=T�r� p�rdoruesit
sq.tasks_selectusers=Instalo %1 p�r:
sq.tasks_currentuser=%1 vet�m
sq.tasks_multisetup=Lejo p�rkrahjen m� shum� p�rdorues
sq.tasks_firewall=Shto nj� p�rjashtim te Fajruolli i Windows-it
sq.tasks_upnp=Lejo zbulimin e pajisjeve UPnP
sq.tasks_deleteoldsetup=Fshiji instaluesit e vjet�r
sq.tasks_resetdiscoveryhostcache=Rivendos Zbulimin dhe Depon e Hosteve
sq.run_skinexe=Vepron instalimi i veshjes...
sq.reg_incomingchat=Mesazh hyr�s n� chat
sq.reg_apptitle=Shp�rndarja m� e Lart� e Skedave me Shareaza
sq.icons_license=Licenc�
sq.icons_uninstall=�instalo
sq.icons_downloads=Shkarkesa
sq.icons_basicmode=M�nyr� Normale
sq.icons_tabbedmode=M�nyr� me Fusha
sq.icons_windowedmode=M�nyr� me Dritare
sq.dialog_shutdown=%1 aktualisht po vepron. A do e mbyll�sh %1, q� t� vijosh me instalimin?
sq.dialog_firewall=Sistemimi d�shtoi ta shtoj� Shareaza-n te Fajruolli i Windows-it.%nT� lutem shtoje vet� Shareaza-n te lista e p�rjashtimeve.
sq.dialog_malwaredetected=Te sistemi yt n� %1 diktohet nj� keqb�r�s. T� lutem fshije at� me nj� skanues virusi/keqb�r�si para se t� instalohet Shareaza. Do e mbyll�sh tani?
sq.page_viruswarning_text=Kur p�rdor internetin duhet t� sigurohesh q� ke nj� skanues virusi t� ridatuar q� t� mbrohesh nga trojan�t, krimbat dhe programet e tjera keqb�r�se. N�se ndjek k�t� link mund t� gjesh nj� list� me skanuesa virusi t� mir� dhe k�shilla t� tjera sigurie se si mbrohet kompjuteri:
sq.page_viruswarning_title=Lajm�rim Virusi
sq.page_viruswarning_subtitle=A ke instaluar nj� program AntiVirus?
sq.CreateDesktopIcon=Trego nj� ikon� n� &tryez�
sq.CreateQuickLaunchIcon=Trego nj� ikon� n� &Quick Launch
sq.PathNotExist=Gabim, shtegu i dosjes s� %1 nuk ekziston!


