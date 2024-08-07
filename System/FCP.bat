@echo off
:FCP
color 07
cls
mode 120,70
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
if not exist board.Bat goto error
if not exist calc.Bat goto error
if not exist wget.exe goto error
if not exist colous.exe goto error
if not exist cw.Bat goto error
if not exist cygbz2-1.dll goto error
if not exist cygcrypto-1.0.0.dll goto error
if not exist cyggcc_s-1.dll goto error
if not exist cyglzma-5.dll goto error
if not exist cygssl-1.0.0.dll goto error
if not exist cygwin1.dll goto error
if not exist cygz.dll goto error
if not exist droll.bat goto error
if not exist explorer.bat goto error
if not exist FileMain.txt goto error
if not exist Fn.dll goto error
if not exist guess.bat goto error
if not exist links.exe goto error
if not exist magic8.bat goto error
if not exist notepad.bat goto error
if not exist paint.bat goto error
if not exist RUN.bat goto error
if not exist so-ode.bat goto error
if not exist timer.bat goto error
if not exist ttt.bat goto error
if not exist Login.bat goto error
if not exist splayer.bat goto error
if not exist b-anti.bat goto error
echo Check completed. No issues found.
echo Press a key to boot to selected os.
pause >nul
cls
Batbox /g 24 2 /d "Edo OS GUI"
 For /l %%A in (0,1,46) Do (
 Call loading 3 3 50 87 # 2 Fill %%A
	)
 For /l %%A in (46,1,86) Do (
 Call loading 3 3 50 87 # 2 Fill %%A
	batbox /w 5
	)	
 For /l %%A in (86,1,100) Do (
 Call loading 3 3 50 87 # 2 Fill %%A
	batbox /w 10
	)
call Login.bat
:error
cls
color 4F
echo KERNEL_PANIC
echo =====================================================
echo.
echo CODE.(000000x12) MESSAGE.(ERROR_FILESNOTFOUND)
ping localhost -n 2 >nul
echo FILE.(1+MORE_NOTFOUND)
ping localhost -n 2 >nul
ping localhost -n 2 >nul
echo ACTION.(REINSTALL_OS)
ping localhost -n 2 >nul
echo MESSAGE.(PRESS_ANY_KEY_TO_RESTART_ALTERIA_FCP)
ping localhost -n 2 >nul
pause >nul
cls
goto FCP