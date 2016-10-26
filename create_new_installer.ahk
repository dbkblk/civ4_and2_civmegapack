nsis = %A_ScriptDir%\tools\nsis\makensis.exe
IfNotExist, %nsis%
{
    Msgbox, NSIS (Unicode version) need to be installed for the installer to be compiled. Go to http://nsis.sourceforge.net/Main_Page to download it.
    ExitApp, 1
}
RunWait, %nsis% %A_ScriptDir%\installer\mcp_full_installer_script.nsi
Msgbox, The full installer has been generated.