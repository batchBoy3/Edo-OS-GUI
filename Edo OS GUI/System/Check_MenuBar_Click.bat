@Echo off
SetLocal ENableDelayedExpansion
REM Auto Generated MenuBar Click File...
REM Program is Created by Kvc
Set __Main_Menu=0 
Set __Sub_Menu=0 

IF %~1 GEQ 0 If %~1 LSS 6 If %~2 EQU 0 (
	Set __Main_Menu=1
	Call List.bat 0 1 f0 "Apps" "Settings" "Shutdown" "Restart" "Exit to Edo-P" 
	Set __Sub_Menu=!Errorlevel!
)
IF %~1 GEQ 6 If %~1 LSS 14 If %~2 EQU 0 (
	Set __Main_Menu=2
	Call List.bat 6 1 f0 "Tic Tac Toe." "Country War" "Guess" "Dice Roller" "Name Generator" "Magic 8 Ball" "Maze" 
	Set __Sub_Menu=!Errorlevel!
)
IF %~1 GEQ 14 If %~1 LSS 21 If %~2 EQU 0 (
	Set __Main_Menu=3
	Call List.bat 14 1 f0 "Manual" 
	Set __Sub_Menu=!Errorlevel!
)

REM Preparing for Returning The User-Input...
REM Using Tunneling here...
ENDLOCAL && Set "%~3=%__Main_Menu%" && Set "%~4=%__Sub_Menu%"
Goto :EOF
REM Don't Even Think of Doing SOmething - Nasty ;)
www.thebateam.org
