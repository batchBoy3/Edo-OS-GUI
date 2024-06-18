@echo off
setlocal EnableDelayedExpansion
set color=0E
color %color%
:menu
:::::::::::::::::::::MENU:::::::::::::::::::::::::::::
cls
echo ษออออออออออออออป
echo บ1. Help       บ
echo บ2. Start      บ
echo บ3. Load       บ
echo บ4. Options    บ
echo บ5. Exit       บ
echo ศออออออออออออออผ
choice /c 12345
if %ERRORLEVEL%==1 (Call :Instructions) Else if %ERRORLEVEL%==2 (Call :11a1Creator) Else if %ERRORLEVEL%==3 (Call :view) Else if %ERRORLEVEL%==4 (Call :Options) Else if %ERRORLEVEL%==5 (goto return-to-os)

goto menu
:11a1Creator
cls
if not defined cs (set cs=30)
if not defined ls (set ls=15)
set "ch=ฑ"
set "wl=Û"
echo Type the character to paint with.
echo Type 'D' without the quotes for default.
echo (case sensitive)
set /p "cc=Û is default: "

if %cc%==D (set cc=Û)
set "con=%cc%"

:: _CS and _LS need to be changed during the game
set /a "_CS=cs/2+1, cls=cs+10, _LS=ls/2+1, lns=ls+10"

:: rb and tb need to stay constant
set /a "rb=cs+1, bb=ls+1"

mode con cols=%cls% lines=%lns%
CALL :spinner 15

set /p sts=Game or Draw?

:game

cls
echo %_CS%@%_LS%>Board%cls%%lns%.txt

CALL board.bat %cs% %ls% %wl% %ch% %_CS%@%_LS% 14@7 7@14 %cc% %sts%>>Board%cls%%lns%.txt
type Board%cls%%lns%.txt

choice /c dawsrxcp>nul
set mov=%ERRORLEVEL%

if %mov% == 1 (call :right) else if %mov% == 2 (call :left) else if %mov% == 3 (call :up) else if %mov% == 4 (call :down) else if %mov%==5 (goto :11a1Creator) else if %mov%==6 (CALL :exit&Goto:eof) else if %mov%==7 (set cc=%ch%) else if %mov%==8 (set cc=%con%)
goto :game

:right
   set /a _CS=%_CS%+1
   if %_CS%==%rb% (set _CS=1)
goto:eof

:left
   set /a _CS=%_CS%-1
   if %_CS%==0 (set _CS=%rb%)
goto:eof

:up
   set /a _LS=%_LS%-1
   if %_LS%==0 (set _LS=%bb%)
goto:eof

:down
   set /a _LS=%_LS%+1
   if %_LS%==%bb% (set _LS=1)
goto:eof





:spinner

set len=%1

for /f %%g in ('"prompt $H &for %%b in (1) do rem"') do set "BS=%%g"

<nul set /p "=Processing Request  "

for /l %%i in (1 1 %len%) do for %%j in (^| / - \) do (
 <nul set /p "=%BS%%%j"
 >nul ping -n 1 localhost
)
echo.
goto:eof

:Instructions
cls
echo Board Painting v1.5
echo.
echo Use WASD keys to move.
echo Use C and P to toggle between erase and draw (respectively).
echo Use R to place your player at the starting position.
echo Use the X key to exit
<nul set /p "=Press any key to Play..."
pause>nul
goto:eof

	


:view
	cls
	set /p "save=Type the filename: "
	cls
	if !save!==dir (dir /R&pause&exit /b)
	set row=0
	for /f "tokens=* delims= " %%f in (!save!.batmp.txt) do (
		set /a row+=1
		if !row! == 1 (color %%f) ELSE (echo %%f)
	)
	pause
	color %color%
goto:eof

:options
	cls
	echo C - Color
	echo S - Size

	choice /c CS
	if %ERRORLEVEL%==1 (
		set /p "color=New Color: "
		color !color!
	) else if %ERRORLEVEL%==2 (
		echo Type the number of columns, lines is equal to half that.
		set /p cs=
		set /a ls=!cs!/2
	)
	
:exit
	endlocal
	choice /m "Do you want to save the picture you made?"
	if %ERRORLEVEL%==1 (
		set /p "save=Type the filename: "
		echo %color%>!save!.batmp.txt
		echo.>>!save!.batmp.txt
		type Board%cls%%lns%.txt>>!save!.batmp.txt
		attrib +R !save!.batmp.txt
	)
	del Board%cls%%lns%.txt

:return-to-os
call so-ode.bat
