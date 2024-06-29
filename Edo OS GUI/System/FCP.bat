@echo off
:FCP
color 07
cls
echo FCP is loading...
 
echo Checking files...

if not exist batbox.exe goto error
ping localhost -n 1 >nul
if not exist Box.bat goto error
if not exist Button.bat goto error
ping localhost -n 4 >nul
if not exist Check_MenuBar_Click.bat goto error
if not exist GetDim.Bat goto error
if not exist GetInput.exe goto error
ping localhost -n 2 >nul
if not exist Getlen.bat  goto error
ping localhost -n 3 >nul
if not exist getlen.exe goto error
if not exist List.bat goto error
if not exist Loading.bat goto error
if not exist MenuBar.Bat goto error
ping localhost -n 1 >nul
if not exist wget.exe goto error
echo Check completed. No issues found.
echo Press a key to boot to selected os.
pause >nul
call so-ode.bat
:error
cls
color 4F
echo ALTERIA FCP HAS FOUND FILES THAT ARE MISSING.
echo.
echo Edo OS GUI cannot start. Please reinstall Edo OS GUI.
echo Press any key to restart ALTERIA FCP.
pause >nul
cls
goto FCP