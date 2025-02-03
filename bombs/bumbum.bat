@echo off
set "TheFileIWantCopy=%~dp0a.vbs"
set "StartupFolduur=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

copy "%TheFileIWantCopy%" "%StartupFolduur%"

pause
