; Download  latest translations from Transifex
SetWorkingDir, %A_ScriptDir%\translations\main
RunWait, %A_ScriptDir%\tools\tx.exe pull -a -f

; Import translations from the downloaded to the mod files
SetWorkingDir, %A_ScriptDir%\tools
RunWait, importer.exe

; Move the reports to the report folder
SetWorkingDir, %A_ScriptDir%
FileMove, %A_ScriptDir%\translations\import\report*.xml, %A_ScriptDir%\translations\reports\, 1

; Open the new text files folder
Msgbox, The new translations are available in "translations\import"`nReports are available in "translations\reports"
