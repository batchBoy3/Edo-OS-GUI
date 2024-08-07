@echo off
cls
mode 94,22
title Edo OS Install
cd System
Call Box 1 1 20 2 - - 87 1
call Box.bat 1 1 20 6 - - 87 1
ping localhost -n 1 >nul
call Box.bat 1 1 20 12 - - 87 1
ping localhost -n 1 >nul
call Box.bat 1 1 20 17 - - 87 1
ping localhost -n 1 >nul
call Box.bat 1 1 20 26 - - 87 1
ping localhost -n 1 >nul
call Box.bat 1 1 20 31 - - 87 1
ping localhost -n 1 >nul
call Box.bat 1 1 20 46 - - 87 1
ping localhost -n 1 >nul
call Box.bat 1 1 20 59 - - 87 1
ping localhost -n 1 >nul
call Box.bat 1 1 20 60 - - 87 1
ping localhost -n 1 >nul
call Box.bat 1 1 20 72 - - 87 1
ping localhost -n 1 >nul
call Box.bat 1 1 20 86 - - 87 1
ping localhost -n 1 >nul
call Box.bat 1 1 20 90 - - 87 1
Batbox /g 35 8 /d "Edo OS Installer"
ping localhost -n 1 >nul
call Box.bat 1 1 20 90 - - 87 1
Batbox /g 35 7 /d "Edo OS Installer"
ping localhost -n 1 >nul
call Box.bat 1 1 20 90 - - 87 1
Batbox /g 35 6 /d "Edo OS Installer"
ping localhost -n 1 >nul
call Box.bat 1 1 20 90 - - 87 1
Batbox /g 35 5 /d "Edo OS Installer"
ping localhost -n 1 >nul
call Box.bat 1 1 20 90 - - 87 1
Batbox /g 35 4 /d "Edo OS Installer"
ping localhost -n 1 >nul
call Box.bat 1 1 20 90 - - 87 1
Batbox /g 35 3 /d "Edo OS Installer"
ping localhost -n 1 >nul
call Box.bat 1 1 20 90 - - 87 1
Batbox /g 35 2 /d "Edo OS Installer"
Batbox /g 35 6 /d "Loading Setup..."
ping localhost -n 4 >nul
:installdrive
call Box.bat 1 1 20 90 - - 87 1
Batbox /g 2 2 /d "Edo OS Installer"
Batbox /g 30 6 /d "Please specify a drive to install Edo OS GUI on."
Batbox /g 30 8
set /p edoinstall='>'
if %edoinstall%==A: goto Install
if %edoinstall%==B: goto Install
if %edoinstall%==C: goto installerror
if %edoinstall%==D: goto Install
if %edoinstall%==E: goto Install
if %edoinstall%==F: goto Install
if %edoinstall%==G: goto Install
if %edoinstall%==H: goto Install
if %edoinstall%==I: goto Install
if %edoinstall%==J: goto Install
if %edoinstall%==K: goto Install
if %edoinstall%==L: goto Install
if %edoinstall%==M: goto Install
if %edoinstall%==N: goto Install
if %edoinstall%==O: goto Install
if %edoinstall%==P: goto Install
if %edoinstall%==Q: goto Install
if %edoinstall%==R: goto Install
if %edoinstall%==S: goto Install
if %edoinstall%==T: goto Install
if %edoinstall%==U: goto Install
if %edoinstall%==V: goto Install
if %edoinstall%==W: goto Install
if %edoinstall%==X: goto Install
if %edoinstall%==Y: goto Install
if %edoinstall%==Z: goto Install
:installerror
call Box.bat 1 1 20 90 - - 87 1
Batbox /g 2 2 /d "Edo OS Installer"
Batbox /g 25 4 /d "If you are seeing this message, it could be one of 4 reasons."
Batbox /g 25 6 /d "1) You specified a drive letter that is not a valid drive letter."
Batbox /g 25 7 /d "2) The drive you specified is not avalible."
Batbox /g 25 8 /d "3) You gave a backslash at the end of your drive letter"
Batbox /g 25 9 /d "4) You specified the C: drive."
Batbox /g 25 10
pause
goto installdrive
:Install
call Box.bat 1 1 20 90 - - 87 1

Batbox /g 30 4 /d "Installing..."
copy batbox.exe %edoinstall% >nul
copy Box.bat %edoinstall% >nul
copy timer.bat %edoinstall% >nul
copy links.exe %edoinstall% >nul
copy splayer.bat %edoinstall% >nul
if %errorlevel%==1 goto installerror
For /l %%A in (0,1,23) Do (
	Call loading 12 16 50 87 # 1 Fill %%A
	batbox /w 100
	)
copy Button.bat %edoinstall% >nul
copy Check_MenuBar_Click.bat %edoinstall% >nul
copy calc.bat %edoinstall% >nul
copy cygz.dll %edoinstall% >nul
copy Login.bat %edoinstall% >nul
For /l %%A in (23,1,46) Do (
	Call loading 12 16 50 87 # 1 Fill %%A
	batbox /w 100
	)
copy magic8.bat %edoinstall% >nul
copy GetDim.bat %edoinstall% >nul
copy GetInput.exe %edoinstall% >nul
copy cygwin1.dll %edoinstall% >nul
For /l %%A in (46,1,55) Do (
	Call loading 12 16 50 87 # 1 Fill %%A
	batbox /w 100
	)
echo call FCP.bat > RUN.bat
copy RUN.bat %edoinstall% >nul
copy notepad.bat %edoinstall% >nul
copy Getlen.bat %edoinstall% >nul
copy getlen.exe %edoinstall% >nul
copy cygssl-1.0.0.dll %edoinstall% >nul
For /l %%A in (55,1,62) Do (
	Call loading 12 16 50 87 # 1 Fill %%A
	batbox /w 100
	)
copy List.bat %edoinstall% >nul
copy Loading.bat %edoinstall% >nul
copy paint.bat %edoinstall% >nul
copy colous.exe %edoinstall% >nul
copy cyglzma-5.dll %edoinstall% >nul
For /l %%A in (62,1,78) Do (
	Call loading 12 16 50 87 # 1 Fill %%A
	batbox /w 100
	)
copy MenuBar.bat %edoinstall% >nul
copy wget.exe %edoinstall% >nul
copy FCP.bat %edoinstall% >nul
copy explorer.bat %edoinstall% >nul
copy cyggcc_s-1.dll %edoinstall% >nul
For /l %%A in (78,1,98) Do (
	Call loading 12 16 50 87 # 1 Fill %%A
	batbox /w 100
	)
copy FileMain.txt %edoinstall% >nul
copy board.bat %edoinstall% >nul
copy ttt.bat %edoinstall% >nul
copy guess.bat %edoinstall% >nul
copy cygcrypto-1.0.0.dll %edoinstall% >nul
copy b-anti.bat %edoinstall% >nul
ping localhost -n 2 >nul
For /l %%A in (98,1,100) Do (
	Call loading 12 16 50 87 # 1 Fill %%A
	batbox /w 100
	)
copy cw.bat %edoinstall% >nul
copy so-ode.bat %edoinstall% >nul
copy Fn.dll %edoinstall% >nul
copy droll.bat %edoinstall% >nul
copy cygbz2-1.dll %edoinstall% >nul
call Box.bat 1 1 20 90 - - 87 1
Batbox /g 2 2 /d "Edo OS Installer"
Batbox /g 18 6 /d "Setup Finished."
ping localhost -n 3 >nul
%edoinstall%
mode 140,60
call FCP.bat
exit