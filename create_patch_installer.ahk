findDependency(executable)
{
    RunWait, %comspec% /c @powershell "(gcm %executable%).Path" > %A_Temp%\cmd.txt,,Hide
    FileRead, cmd, %A_Temp%\cmd.txt
    FileDelete, %A_Temp%\cmd.txt
    If cmd contains %executable%.exe
    {
        return %cmd%
    } Else {
        return
    }    
}

git := findDependency("git")
If !git
{
    Msgbox, git isn't properly configured. It is needed to create a patch file.
} Else 
{
    Gui, add, text, ,Go to the website below and click "Copy the full SHA"`nfor the base revision and for the patch revision you both commited.
    Gui, Font, Underline cBlue
    Gui, add, text,  gLink, https://github.com/dbkblk/civ4_and2_civmegapack/commits/master
    Gui, Font
    Gui, add, text, ,Type here the base revision SHA checksum:
    Gui, add, edit, w200 vbaseRevision
    Gui, add, text, ,Type here the patch revision SHA checksum you've commited:
    Gui, add, edit, w200 vpatchRevision
    Gui, add, button, yp+30 w150 gValidate, Ok
    Gui, add, button, xp+200 yp w150 gCancel, Cancel
    Gui, show
}    
return

Validate:
{
    Gui, hide

    ; Getting variables
    GuiControlGet, baseRevision
    GuiControlGet, patchRevision
    ;baseRevision = 8accb17dc33b66415a4ef4d56f11d284b85dc6e0
    ;patchRevision = ee76148cadcca7298633123ab799d401537da704

    ; Getting differents files between the two revisions
    SetWorkingDir, %A_ScriptDir%\patch
    cmdModifiedFiles=
    (
        git diff --name-only %baseRevision% %patchRevision%
    )
    RunWait, %comspec% /c @powershell %cmdModifiedFiles% > %A_Temp%\cmd, , Hide



    ;StringReplace, mainDir, mainDir, \, /, 1
    Loop, Read, %A_Temp%\cmd
    {
        RegExMatch(A_LoopReadLine, "^files/(.*)", file)
        if file1
        {
            StringReplace, file1, file1, /, \, 1
            SplitPath, file1, fileName, fileDir
            IfNotExist, %A_ScriptDir%\patch\%fileDir%
            {
                FileCreateDir, %A_ScriptDir%\patch\%fileDir%
            }
                
            FileCopy, %A_ScriptDir%\%A_LoopReadLine%, %A_ScriptDir%\patch\%file1%
        }
            ;RunWait, 7z a patch.zip file1,,Hide
    }
    FileDelete, %A_Temp%\cmd

    ; Get the version strings
    UrlDownloadToFile, http://raw.githubusercontent.com/dbkblk/civ4_and2_civmegapack/%baseRevision%/files/Assets/Modules/Custom_Civilizations_MCP/modInfo.xml, %A_Temp%\old_rev.xml
    UrlDownloadToFile, http://raw.githubusercontent.com/dbkblk/civ4_and2_civmegapack/%patchRevision%/files/Assets/Modules/Custom_Civilizations_MCP/modInfo.xml, %A_Temp%\new_rev.xml

    ; Extract current version
    FileRead, v, %A_Temp%\old_rev.xml
    RegExMatch(v, "<version>(.*)</version>", versOld)
    FileRead, v, %A_Temp%\new_rev.xml
    RegExMatch(v, "<version>(.*)</version>", versNew)
    FileDelete, %A_Temp%\old_rev.xml
    FileDelete, %A_Temp%\new_rev.xml

    ; Replace in installer file
    FileRead, inst, %A_ScriptDir%\installer\mcp_patch_installer_script.nsi
    FileDelete, %A_ScriptDir%\installer\mcp_patch_installer_script.nsi
    def_revision = !define REVISION "%versNew1%"
    def_base_revision = !define BASE_REVISION "%versOld1%"
    inst := RegExReplace(inst, "!define REVISION "".*""", def_revision)
    inst := RegExReplace(inst, "!define BASE_REVISION "".*""", def_base_revision)

    ; Save modified file
    FileAppend, %inst%,  %A_ScriptDir%\installer\mcp_patch_installer_script.nsi

    ; # Building patch installer #
    nsis = %A_ScriptDir%\tools\nsis\makensis.exe
    IfNotExist, %nsis%
    {
        Msgbox, NSIS (Unicode version) need to be installed for the installer to be compiled. Go to http://nsis.sourceforge.net/Main_Page to download it.
        ExitApp, 1
    }
    SetWorkingDir, %A_ScriptDir%
    RunWait, %nsis% %A_ScriptDir%\installer\mcp_patch_installer_script.nsi

    ; Removing patch folder
    FileRemoveDir, %A_ScriptDir%\patch, 1

    Msgbox, The full installer has been generated.

    ExitApp, 0

}
return

Link:
{
    Run, https://github.com/dbkblk/civ4_and2_civmegapack/commits/master
}