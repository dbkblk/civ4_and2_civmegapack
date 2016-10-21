Gui, Add, Text, xm+10 ym+10, Which action would you like to do?`n`nWarning: This executable is basic and`ndoes not check for errors.
Gui,Add, Button, xm+10 yp+65 h25 w150 gupdModTranslations vupdModTranslations, Update mod translations
Gui,Add, Button, xm+10 yp+35 h25 w150 gupdInstTranslations, Update installer translations
Gui,Add, Button, xm+10 yp+35 h25 w150 gcreateInstaller, Create a new installer
Gui,Add, Button, xm+10 yp+35 h25 w150 gcreatePatch vcreatePatch, Create a patch file
Gui, Show

; Disable not implemented
GuiControl, disable, createPatch

return

updModTranslations:
{
    ; Get latest translations
    SetWorkingDir, %A_ScriptDir%\translations\main
    RunWait, %A_ScriptDir%\translations\tools\tx.exe pull -a

    ;

    SetWorkingDir, %A_ScriptDir%
}
return

updInstTranslations:
{
    ; Get latest translations
    SetWorkingDir, %A_ScriptDir%\translations\installer
    RunWait, %A_ScriptDir%\translations\tools\tx.exe pull -a

    SetWorkingDir, %A_ScriptDir%\installer
    ; Extract current version
    FileRead, v, %A_ScriptDir%\files\Assets\Modules\Custom_Civilizations_MCP\modInfo.xml
    RegExMatch(v, "<version>(.*)</version>", vers)

    version = %vers1%

    ; Replace in installer file
    FileRead, inst, mcp_full_installer_script.nsi
    FileDelete, mcp_full_installer_script.nsi
    def_revision = !define REVISION "%version%"
    inst := RegExReplace(inst, "!define REVISION "".*""", def_revision)

    ; Read language map (to guess what are the translations names for NSIS)
    l := {}
    Loop, Read, language_map.md
    {
        IfInString, A_LoopReadLine, :
        {
            RegExMatch(A_LoopReadLine, "(\w*) : (\w*)", match)
            l[match1] := match2
        }
    }

    ; Read default text key (english)
    text_en := {}
    Loop, Read, %A_ScriptDir%\translations\main\installer_en.xml
    {
        RegExMatch(A_LoopReadLine, "name=""(.*)"">(.*)</string", key)
        If key
            text_en[key1] := key2
    }

    ; Get NSIS language code then, if empty, get english translation, then replace in file (if exist)
    Loop, Files, %A_ScriptDir%\translations\main\installer_*.xml
    {
        RegExMatch(A_LoopFileName, "installer_(.*)\.xml", langcode)

        langName := l[langcode1]
        ;msgbox % langName
        If langName
        {
            text := {}

            ; Read the translated file and get keys
            Loop, Read, %A_LoopFileFullPath%
            {
                RegExMatch(A_LoopReadLine, "name=""(.*)"">(.*)</string", key)
                If key
                    text[key1] := key2
            }

            ; Check if all the translated values exist and replace with english if not
            For index, value in text
            {
                If !text[index]
                    text[index] := text_en[index]
            }

            ; Parse installer file
            n = 0
            For index, value in text
            {
                n := n + 1
                idx := StrReplace(index, "INSTALLER_")
                match = LangString %idx% \${LANG_%langName%} "[^\t\n\r]*"
                RegExMatch(inst, match, find)
                if find
                {
                    ;StringReplace, valNew, value, `\', '
                    valNew := RegExReplace(value, "\\'", "'")
                    replace = LangString %idx% ${LANG_%langName%} "%valNew%"
                    ;inst := RegExReplace(inst, match, replace)
                    StringReplace, inst, inst, %find%, %replace%
                    ;msgbox % find replace
                }
            }
        }    
    }

    ; Save modified file
    FileAppend, %inst%, %A_WorkingDir%\mcp_full_installer_script.nsi

    Msgbox, Process had ended. If new translations were added, check the file "installer/mcp_full_installer_script.nsi" and uncomment the following lines (remove the '`;'):`n- `;!insertmacro MUI_LANGUAGE "thelanguage"`n- `; thelanguage`n; LangString WELCOME_TITLE ${LANG_THELANGUAGE} "etc."
    SetWorkingDir, %A_ScriptDir%
}
return

createInstaller:
{
    nsis = C:\Program Files (x86)\NSIS\Unicode\makensis.exe
    IfNotExist, %nsis%
    {
        Msgbox, NSIS (Unicode version) need to be installed for the installer to be compiled. Go to http://nsis.sourceforge.net/Main_Page to download it.
        ExitApp, 1
    }
    SetWorkingDir, %A_ScriptDir%\installer
    RunWait, %nsis% mcp_full_installer_script.nsi
    FileMove, %A_ScriptDir%\installer\rand_mcp_full_*.exe, %A_ScriptDir%, 1
    SetWorkingDir, %A_ScriptDir%
    Msgbox, The full installer has been generated.
}
return

createPatch:
{
    ; test git
    ; git
    ;if (%ERRORLEVEL%) > 0 then ( )
}
return