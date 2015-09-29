; Installation script
;--------------------------------

SetCompressor /SOLID LZMA

; Modern UI
;--------------------------------

  !include "MUI.nsh"
  !define REVISION "1.6"
  !define /date DATE "%Y-%m"
  
; Unzip FPK module
;--------------------------------
!include "ZipDLL.nsh"

; General information
;--------------------------------

; The name of the installer
Name "Civilization IV: A New Dawn - Mega civ. pack"

; The file to write
OutFile "rand_mcp_full_installer_${DATE}_${REVISION}.exe"

; The default installation directory
InstallDir "$DOCUMENTS\My Games\Beyond the sword\Mods\Rise of Mankind - A New Dawn\"

; Request application privileges
RequestExecutionLevel user

;Variables
;--------------------------------

; Layout
;--------------------------------
!define MUI_ICON "AND_icon.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP "installer_left_image.bmp"

; Page definition
;--------------------------------
!define MUI_WELCOMEPAGE_TITLE $(WELCOME_TITLE)
!define MUI_WELCOMEPAGE_TEXT $(WELCOME)

!define MUI_DIRECTORYPAGE_TEXT_TOP $(DIRECTORY)

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
RequestExecutionLevel admin
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Language
;--------------------------------
!insertmacro MUI_LANGUAGE "English"
;!insertmacro MUI_LANGUAGE "Arabic"
;!insertmacro MUI_LANGUAGE "Bulgarian"
;!insertmacro MUI_LANGUAGE "Catalan"
;!insertmacro MUI_LANGUAGE "SimpChinese"
;!insertmacro MUI_LANGUAGE "TradChinese"
;!insertmacro MUI_LANGUAGE "Czech"
;!insertmacro MUI_LANGUAGE "Danish"
;!insertmacro MUI_LANGUAGE "Dutch"
;!insertmacro MUI_LANGUAGE "Finnish"
!insertmacro MUI_LANGUAGE "French"
;!insertmacro MUI_LANGUAGE "German"
;!insertmacro MUI_LANGUAGE "Greek"
;!insertmacro MUI_LANGUAGE "Hungarian"
;!insertmacro MUI_LANGUAGE "Italian"
;!insertmacro MUI_LANGUAGE "Japanese"
;!insertmacro MUI_LANGUAGE "Korean"
;!insertmacro MUI_LANGUAGE "Polish"
;!insertmacro MUI_LANGUAGE "Portuguese"
;!insertmacro MUI_LANGUAGE "PortugueseBR"
;!insertmacro MUI_LANGUAGE "Russian"
;!insertmacro MUI_LANGUAGE "Spanish"
;!insertmacro MUI_LANGUAGE "Turkish"
;!insertmacro MUI_LANGUAGE "Ukrainian"


Function .onInit
        !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Function .onInstSuccess
Exec "$INSTDIR\and2_checker.exe"
FunctionEnd

AutoCloseWindow true 

; Translations
;--------------------------------

; English

LangString WELCOME_TITLE ${LANG_ENGLISH} "Civilization IV: A New Dawn - Mega Civ Pack"
LangString WELCOME ${LANG_ENGLISH} "Revision: ${REVISION}\n\n This setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\n The mod will be extracted into your Civilization IV: A New Dawn current installation.\n\n Note: The installation can take some minutes, please be patient."
LangString REQUIRED ${LANG_ENGLISH} "required"
LangString DIRECTORY ${LANG_ENGLISH} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
LangString FINISH ${LANG_ENGLISH} "The new civilizations are now installed. Enjoy."

; Arabic

; LangString WELCOME_TITLE ${LANG_ARABIC} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_ARABIC} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_ARABIC} "required"
; LangString DIRECTORY ${LANG_ARABIC} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_ARABIC} "The new civilizations are now installed. Enjoy."

; Bulgarian

; LangString WELCOME_TITLE ${LANG_BULGARIAN} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_BULGARIAN} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_BULGARIAN} "required"
; LangString DIRECTORY ${LANG_BULGARIAN} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_BULGARIAN} "The new civilizations are now installed. Enjoy."

; Catalan

; LangString WELCOME_TITLE ${LANG_CATALAN} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_CATALAN} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_CATALAN} "required"
; LangString DIRECTORY ${LANG_CATALAN} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_CATALAN} "The new civilizations are now installed. Enjoy."

; Simplified Chinese

; LangString WELCOME_TITLE ${LANG_SIMPCHINESE} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_SIMPCHINESE} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_SIMPCHINESE} "required"
; LangString DIRECTORY ${LANG_SIMPCHINESE} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_SIMPCHINESE} "The new civilizations are now installed. Enjoy."

; Traditional Chinese

; LangString WELCOME_TITLE ${LANG_TRADCHINESE} "Civilization IV: A New Dawn Expansion pack"
; LangString WELCOME ${LANG_TRADCHINESE} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of Civilization IV: A New Dawn.\n\nThe mod will be installed in 'My Documents\My Games\Beyond the Sword\Mods\' by default. \nIt will create a shortcut (optional) to the mod launcher, which will be used to easily download, update or configure the mod installation.\n\nWARNING : Any existing mod installation is compatible. However, if you have modded files, it could be overwritten on mod update."
; LangString REQUIRED ${LANG_TRADCHINESE} "required"
; LangString DIRECTORY ${LANG_TRADCHINESE} "Setup will install the expansion pack in the following folder.$\nTo install it in a different folder, click on 'Browse...' and select another folder.$\n$\nNOTA: It is highly recommended to use the default folder selected below. However, you can choose to install the mod directly into the game folder ('Sid Meier's Civilization IV Beyond the Sword\Beyond the Sword\Mods\')."
; LangString FINISH ${LANG_TRADCHINESE} "The launcher is now installed. On the first launch, it will detect if the mod is present in the directory. If it's not, just follow the installation procedure."

; Czech

; LangString WELCOME_TITLE ${LANG_CZECH} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_CZECH} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_CZECH} "required"
; LangString DIRECTORY ${LANG_CZECH} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_CZECH} "The new civilizations are now installed. Enjoy."

; Danish

; LangString WELCOME_TITLE ${LANG_DANISH} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_DANISH} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_DANISH} "required"
; LangString DIRECTORY ${LANG_DANISH} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_DANISH} "The new civilizations are now installed. Enjoy."

; Dutch

; LangString WELCOME_TITLE ${LANG_DUTCH} "Civilization IV: A New Dawn Expansion pack"
; LangString WELCOME ${LANG_DUTCH} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of Civilization IV: A New Dawn.\n\nThe mod will be installed in 'My Documents\My Games\Beyond the Sword\Mods\' by default. \nIt will create a shortcut (optional) to the mod launcher, which will be used to easily download, update or configure the mod installation.\n\nWARNING : Any existing mod installation is compatible. However, if you have modded files, it could be overwritten on mod update."
; LangString REQUIRED ${LANG_DUTCH} "required"
; LangString DIRECTORY ${LANG_DUTCH} "Setup will install the expansion pack in the following folder.$\nTo install it in a different folder, click on 'Browse...' and select another folder.$\n$\nNOTA: It is highly recommended to use the default folder selected below. However, you can choose to install the mod directly into the game folder ('Sid Meier's Civilization IV Beyond the Sword\Beyond the Sword\Mods\')."
; LangString FINISH ${LANG_DUTCH} "The launcher is now installed. On the first launch, it will detect if the mod is present in the directory. If it's not, just follow the installation procedure."

; Finnish

; LangString WELCOME_TITLE ${LANG_FINNISH} "Civilization IV: A New Dawn Expansion pack"
; LangString WELCOME ${LANG_FINNISH} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of Civilization IV: A New Dawn.\n\nThe mod will be installed in 'My Documents\My Games\Beyond the Sword\Mods\' by default. \nIt will create a shortcut (optional) to the mod launcher, which will be used to easily download, update or configure the mod installation.\n\nWARNING : Any existing mod installation is compatible. However, if you have modded files, it could be overwritten on mod update."
; LangString REQUIRED ${LANG_FINNISH} "required"
; LangString DIRECTORY ${LANG_FINNISH} "Setup will install the expansion pack in the following folder.$\nTo install it in a different folder, click on 'Browse...' and select another folder.$\n$\nNOTA: It is highly recommended to use the default folder selected below. However, you can choose to install the mod directly into the game folder ('Sid Meier's Civilization IV Beyond the Sword\Beyond the Sword\Mods\')."
; LangString FINISH ${LANG_FINNISH} "The launcher is now installed. On the first launch, it will detect if the mod is present in the directory. If it's not, just follow the installation procedure."

; French

LangString WELCOME_TITLE ${LANG_FRENCH} "Civilization IV: A New Dawn - Mega Civ Pack"
LangString WELCOME ${LANG_FRENCH} "Révision : ${REVISION}\n\n Cet assistant d'installation vous guidera dans l'installation de plus de 100 nouvelles civilisations pour Civilization IV: A New Dawn.\n\n Le module sera extrait dans le dossier de votre installation de Civilization IV: A New Dawn.\n\n Note : L'installation peut prendre quelques minutes, soyez patient."
LangString REQUIRED ${LANG_FRENCH} "requis"
LangString DIRECTORY ${LANG_FRENCH} "Le programme d'installation va installer le pack d'extension où Civilization IV: A New Dawn est installé.$\nSi l'extension originale est installée dans un autre dossier, sélectionnez-le s'il vous plaît avant de continuer."
LangString FINISH ${LANG_FRENCH} "Les nouvelles civilisations sont maintenant installées. Profitez."

; German

; LangString WELCOME_TITLE ${LANG_GERMAN} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_GERMAN} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_GERMAN} "required"
; LangString DIRECTORY ${LANG_GERMAN} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_GERMAN} "The new civilizations are now installed. Enjoy."

; Greek

; LangString WELCOME_TITLE ${LANG_GREEK} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_GREEK} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_GREEK} "required"
; LangString DIRECTORY ${LANG_GREEK} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_GREEK} "The new civilizations are now installed. Enjoy."

; Hungarian

; LangString WELCOME_TITLE ${LANG_HUNGARIAN} ""
; LangString WELCOME ${LANG_HUNGARIAN} ""
; LangString REQUIRED ${LANG_HUNGARIAN} ""
; LangString DIRECTORY ${LANG_HUNGARIAN} ""
; LangString FINISH ${LANG_HUNGARIAN} ""

; Italian

; LangString WELCOME_TITLE ${LANG_ITALIAN} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_ITALIAN} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_ITALIAN} "required"
; LangString DIRECTORY ${LANG_ITALIAN} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_ITALIAN} "The new civilizations are now installed. Enjoy."

; Japanese

; LangString WELCOME_TITLE ${LANG_JAPANESE} "Civilization IV: A New Dawn Expansion pack"
; LangString WELCOME ${LANG_JAPANESE} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of Civilization IV: A New Dawn.\n\nThe mod will be installed in 'My Documents\My Games\Beyond the Sword\Mods\' by default. \nIt will create a shortcut (optional) to the mod launcher, which will be used to easily download, update or configure the mod installation.\n\nWARNING : Any existing mod installation is compatible. However, if you have modded files, it could be overwritten on mod update."
; LangString REQUIRED ${LANG_JAPANESE} "required"
; LangString DIRECTORY ${LANG_JAPANESE} "Setup will install the expansion pack in the following folder.$\nTo install it in a different folder, click on 'Browse...' and select another folder.$\n$\nNOTA: It is highly recommended to use the default folder selected below. However, you can choose to install the mod directly into the game folder ('Sid Meier's Civilization IV Beyond the Sword\Beyond the Sword\Mods\')."
; LangString FINISH ${LANG_JAPANESE} "The launcher is now installed. On the first launch, it will detect if the mod is present in the directory. If it's not, just follow the installation procedure."

; Korean

; LangString WELCOME_TITLE ${LANG_KOREAN} "Civilization IV: A New Dawn Expansion pack"
; LangString WELCOME ${LANG_KOREAN} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of Civilization IV: A New Dawn.\n\nThe mod will be installed in 'My Documents\My Games\Beyond the Sword\Mods\' by default. \nIt will create a shortcut (optional) to the mod launcher, which will be used to easily download, update or configure the mod installation.\n\nWARNING : Any existing mod installation is compatible. However, if you have modded files, it could be overwritten on mod update."
; LangString REQUIRED ${LANG_KOREAN} "required"
; LangString DIRECTORY ${LANG_KOREAN} "Setup will install the expansion pack in the following folder.$\nTo install it in a different folder, click on 'Browse...' and select another folder.$\n$\nNOTA: It is highly recommended to use the default folder selected below. However, you can choose to install the mod directly into the game folder ('Sid Meier's Civilization IV Beyond the Sword\Beyond the Sword\Mods\')."
; LangString FINISH ${LANG_KOREAN} "The launcher is now installed. On the first launch, it will detect if the mod is present in the directory. If it's not, just follow the installation procedure."

; Polish

; LangString WELCOME_TITLE ${LANG_POLISH} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_POLISH} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_POLISH} "required"
; LangString DIRECTORY ${LANG_POLISH} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_POLISH} "The new civilizations are now installed. Enjoy."

; Portuguese

; LangString WELCOME_TITLE ${LANG_PORTUGUESE} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_PORTUGUESE} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_PORTUGUESE} "required"
; LangString DIRECTORY ${LANG_PORTUGUESE} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_PORTUGUESE} "The new civilizations are now installed. Enjoy."

; PortugueseBR

; LangString WELCOME_TITLE ${LANG_PORTUGUESEBR} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_PORTUGUESEBR} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_PORTUGUESEBR} "required"
; LangString DIRECTORY ${LANG_PORTUGUESEBR} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_PORTUGUESEBR} "The new civilizations are now installed. Enjoy."

; Russian

; LangString WELCOME_TITLE ${LANG_RUSSIAN} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_RUSSIAN} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_RUSSIAN} "required"
; LangString DIRECTORY ${LANG_RUSSIAN} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_RUSSIAN} "The new civilizations are now installed. Enjoy."

; Spanish

; LangString WELCOME_TITLE ${LANG_SPANISH} "Civilization IV: A New Dawn - Mega Civ Pack"
; LangString WELCOME ${LANG_SPANISH} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of more than 100 new civilizations for Civilization IV: A New Dawn.\n\nThe mod will be extracted into your Civilization IV: A New Dawn current installation."
; LangString REQUIRED ${LANG_SPANISH} "required"
; LangString DIRECTORY ${LANG_SPANISH} "Setup will install the expansion pack where Civilization IV: A New Dawn is installed.$\nIf the original mod is installed in another folder, please select it before to continue."
; LangString FINISH ${LANG_SPANISH} "The new civilizations are now installed. Enjoy."

; Turkish

; LangString WELCOME_TITLE ${LANG_TURKISH} "Civilization IV: A New Dawn Expansion pack"
; LangString WELCOME ${LANG_TURKISH} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of Civilization IV: A New Dawn.\n\nThe mod will be installed in 'My Documents\My Games\Beyond the Sword\Mods\' by default. \nIt will create a shortcut (optional) to the mod launcher, which will be used to easily download, update or configure the mod installation.\n\nWARNING : Any existing mod installation is compatible. However, if you have modded files, it could be overwritten on mod update."
; LangString REQUIRED ${LANG_TURKISH} "required"
; LangString DIRECTORY ${LANG_TURKISH} "Setup will install the expansion pack in the following folder.$\nTo install it in a different folder, click on 'Browse...' and select another folder.$\n$\nNOTA: It is highly recommended to use the default folder selected below. However, you can choose to install the mod directly into the game folder ('Sid Meier's Civilization IV Beyond the Sword\Beyond the Sword\Mods\')."
; LangString FINISH ${LANG_TURKISH} "The launcher is now installed. On the first launch, it will detect if the mod is present in the directory. If it's not, just follow the installation procedure."

; Ukrainian

; LangString WELCOME_TITLE ${LANG_UKRAINIAN} "Civilization IV: A New Dawn Expansion pack"
; LangString WELCOME ${LANG_UKRAINIAN} "Revision: ${REVISION}\n\nThis setup wizard will guide you through the installation of Civilization IV: A New Dawn.\n\nThe mod will be installed in 'My Documents\My Games\Beyond the Sword\Mods' by default. \nIt will create a shortcut (optional) to the mod launcher, which will be used to easily download, update or configure the mod installation.\n\nWARNING : Any existing mod installation is compatible. However, if you have modded files, it could be overwritten on mod update."
; LangString REQUIRED ${LANG_UKRAINIAN} "required"
; LangString DIRECTORY ${LANG_UKRAINIAN} "Setup will install the expansion pack in the following folder.$\nTo install it in a different folder, click on 'Browse...' and select another folder.$\n$\nNOTA: It is highly recommended to use the default folder selected below. However, you can choose to install the mod directly into the game folder ('Sid Meier's Civilization IV Beyond the Sword\Beyond the Sword\Mods')."
; LangString FINISH ${LANG_UKRAINIAN} "The launcher is now installed. On the first launch, it will detect if the mod is present in the directory. If it's not, just follow the installation procedure."



; Installation
;--------------------------------

Section "Mega civ. Pack" ;No components page, name is not important
SectionIn RO
AddSize 1180000

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File /r "..\files\*"
  
  ZipDLL::extractall "$INSTDIR\Assets\MCP0.zip" "$INSTDIR\Assets\"
  Delete "$INSTDIR\Assets\MCP0.zip"

;Create uninstaller
  WriteUninstaller "$INSTDIR\mcp_uninstall.exe"
 
SectionEnd ; end the section

; Uninstallation
;--------------------------------


Section "Uninstall"

; Delete files

RMDir /r "$INSTDIR\Assets\Modules\Custom_Civilizations_MCP"
Delete "$INSTDIR\Assets\MCP0.FPK"
Delete "$INSTDIR\Assets\XML\Text\MCP_BUILDINGS.xml"
Delete "$INSTDIR\Assets\XML\Text\MCP_BUILDINGS_PEDIA.xml"
Delete "$INSTDIR\Assets\XML\Text\MCP_CITIES.xml"
Delete "$INSTDIR\Assets\XML\Text\MCP_CIVILIZATIONS.xml"
Delete "$INSTDIR\Assets\XML\Text\MCP_CIVILIZATIONS_PEDIA.xml"
Delete "$INSTDIR\Assets\XML\Text\MCP_DIPLOMACY.xml"
Delete "$INSTDIR\Assets\XML\Text\MCP_LEADERS.xml"
Delete "$INSTDIR\Assets\XML\Text\MCP_LEADERS_PEDIA.xml"
Delete "$INSTDIR\Assets\XML\Text\MCP_MISC.xml"
Delete "$INSTDIR\Assets\XML\Text\MCP_UNITS.xml"
Delete "$INSTDIR\Assets\XML\Text\MCP_UNITS_PEDIA.xml"
Delete "$INSTDIR\mcp_uninstall.exe"

SectionEnd


