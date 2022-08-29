@echo off
cd %temp%
set appdir=%random%
title .ORG Framework Creator - Convert Any HTML/CSS Files Into An App Without Coding!

:App
md %temp%\%appdir%
start explorer %temp%\%appdir%
set dircr=%temp%\%appdir%
echo New Folder Created : %dircr%
echo Put Your HTML Files In It. Then :
pause

cls
if exist %temp%\%appdir%\index.html goto :Convert
if not exist %temp%\%appdir%\index.html gecho "<r>There's No index.html Detected.</>"
pause
goto :App

:Convert
cd %temp%\%appdir%
cls
gecho "                         Converting...      "
timeout 1 >nul
ren %temp%\%appdir%\index.html app.hta
echo @echo off > %temp%\%appdir%\run.bat
echo cd /d %%~dp0 >> %temp%\%appdir%\run.bat
echo start "%WINDIR%\system32\mshta.exe"  "%%~dp0app.hta" --sfx %%1 >> %temp%\%appdir%\run.bat
move /y "%temp%\%appdir%\run.bat" ".\Converted\run.bat"
move /y "%temp%\%appdir%\app.hta" ".\Converted\app.hta"
move /y "%temp%\%appdir%\*.*" ".\Converted\"
cls
gecho "<gn>                       Done!                "
echo Press Any Key To Exit. . . &&pause>nul
exit

