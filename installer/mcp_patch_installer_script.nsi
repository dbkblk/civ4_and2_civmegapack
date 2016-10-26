; Installation script
;--------------------------------

SetCompressor /SOLID LZMA

; Modern UI
;--------------------------------

  !include "MUI.nsh"
  !define REVISION "1.8"
  !define BASE_REVISION "1.7"
  !define /date DATE "%Y-%m"
  
; Unzip FPK module
;--------------------------------
!include "ZipDLL.nsh"

; General information
;--------------------------------

; The name of the installer
Name "Civilization IV: A New Dawn - Mega civ. pack"

; The file to write
OutFile "rand_mcp_patch_${BASE_REVISION}_to_${REVISION}.exe"

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
!insertmacro MUI_LANGUAGE "German"
!insertmacro MUI_LANGUAGE "Greek"
;!insertmacro MUI_LANGUAGE "Hungarian"
;!insertmacro MUI_LANGUAGE "Italian"
;!insertmacro MUI_LANGUAGE "Japanese"
;!insertmacro MUI_LANGUAGE "Korean"
;!insertmacro MUI_LANGUAGE "Polish"
;!insertmacro MUI_LANGUAGE "Portuguese"
!insertmacro MUI_LANGUAGE "PortugueseBR"
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

!include "..\translations\installer_translations.nsi"

; Installation
;--------------------------------

Section "Mega civ. Pack" ;No components page, name is not important
SectionIn RO

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File /r "..\patch\*"

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


