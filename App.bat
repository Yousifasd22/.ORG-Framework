@echo off
cd %temp%
set appdir=%random%
setlocal enabledelayedexpansion
title .ORG Framework Converter - Made By NEOAPPS @ Asd22 Entertainment

:App
md %temp%\%appdir%
start explorer %temp%\%appdir%
set dircr=%temp%\%appdir%
echo New Folder Created : %dircr%
echo Put Your HTML Files In It. Then :
pause

cls
if exist %temp%\%appdir%\index.html goto :Settings
if not exist %temp%\%appdir%\index.html gecho "<r>There's No index.html Detected.</>"
pause
goto :App



:Settings
cls
echo .ORG Framework Application Settings
set /p id=Application ID: 
set /p windowTitle=Application Name (Title): 
echo Do you want a border for your application?
choice /c yn
if %errorlevel%==y set hasBorder==border
if %errorlevel%==n set hasBorder==XD
echo Do you want to allow right clicking?
choice /c yn
if %errorlevel%==y set allowRightClick==yes
if %errorlevel%==n set allowRightClick==no
set /p iconPath=Drag and drop your .ico file here and press enter: ^> 
echo Do you want to have the maximize button?
choice /c yn
if %errorlevel%==y set maximize==yes
if %errorlevel%==n set maximize==no
echo Do you want to have the minimize button?
choice /c yn
if %errorlevel%==y set minimize==yes
if %errorlevel%==n set minimize==no
echo Do you want your app to be scrollable?
choice /c yn
if %errorlevel%==y set scrollable==yes
if %errorlevel%==n set scrollable==no
echo Do you want your app to be selectable?
choice /c yn
if %errorlevel%==y set allowSelect==yes
if %errorlevel%==n set allowSelect==no
echo Do you want your app to be shown on taskbar?
choice /c yn
if %errorlevel%==y set taskbar==yes
if %errorlevel%==n set taskbar==no
set /p version=Application Version: 
powershell -Command "(gc options.org) -replace '$id$', '!id!' | Out-File -encoding ASCII opt.txt
powershell -Command "(gc options.org) -replace '$windowTitle$', '!windowTitle!' | Out-File -encoding ASCII opt.txt
powershell -Command "(gc options.org) -replace '$allowRightClick$', '!allowRightClick!' | Out-File -encoding ASCII opt.txt
powershell -Command "(gc options.org) -replace '$iconPath$', '!iconPath!' | Out-File -encoding ASCII opt.txt
powershell -Command "(gc options.org) -replace '$maximize$', '!maximize!' | Out-File -encoding ASCII opt.txt
powershell -Command "(gc options.org) -replace '$minimize$', '!minimize!' | Out-File -encoding ASCII opt.txt
powershell -Command "(gc options.org) -replace '$scrollable$', '!scrollable!' | Out-File -encoding ASCII opt.txt
powershell -Command "(gc options.org) -replace '$allowSelect$', '!allowSelect!' | Out-File -encoding ASCII opt.txt
powershell -Command "(gc options.org) -replace '$taskbar$', '!taskbar!' | Out-File -encoding ASCII opt.txt
powershell -Command "(gc options.org) -replace '$version$', '!version!' | Out-File -encoding ASCII opt.txt
echo Type the following command before the <body> in "index.html": (This is important so the settings will work :) if you don't want the settings to be applied just press space):
type opt.txt
echo.
echo And Then:
pause
goto :Convert





:Convert
cd %temp%\%appdir%
cls
gecho "                         Converting...      "
timeout 1 >nul
ren %temp%\%appdir%\index.html app.hta
ren %temp%\%appdir%\*.html *.hta
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

