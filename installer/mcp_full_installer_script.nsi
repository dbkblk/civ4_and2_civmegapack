; Installation script
;--------------------------------

SetCompressor /SOLID LZMA

; Modern UI
;--------------------------------

  !include "MUI.nsh"
  !define REVISION "1.8.5"
  !define /date DATE "%Y-%m"

; Unzip FPK module
;--------------------------------
!include "ZipDLL.nsh"

; General information
;--------------------------------

; The name of the installer
Name "Civilization IV: A New Dawn - Mega civ. pack"

; The file to write
OutFile "..\rand_mcp_full_installer_${DATE}_${REVISION}.exe"

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

Function .onInstSuccess
Exec "$INSTDIR\and2_checker.exe"
FunctionEnd

AutoCloseWindow true

!include "..\translations\installer_translations.nsi"

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


