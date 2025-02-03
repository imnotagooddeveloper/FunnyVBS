@echo off
set "sourceFile=%~dp0a.vbs"
set "destinationFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

copy "%sourceFile%" "%destinationFolder%"

echo File copied to startup folder.
pause
