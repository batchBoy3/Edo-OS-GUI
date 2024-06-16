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
IF %~1 GEQ 6 If %~1 LSS 22 If %~2 EQU 0 (
	Set __Main_Menu=2
	Call List.bat 6 1 f0 "Date and time." 
	Set __Sub_Menu=!Errorlevel!
)
IF %~1 GEQ 22 If %~1 LSS 30 If %~2 EQU 0 (
	Set __Main_Menu=3
	Call List.bat 22 1 f0 "Tic Tac Toe." "Country War" 
	Set __Sub_Menu=!Errorlevel!
)
IF %~1 GEQ 30 If %~1 LSS 37 If %~2 EQU 0 (
	Set __Main_Menu=4
	Call List.bat 30 1 f0 "Manual" 
	Set __Sub_Menu=!Errorlevel!
)

REM Preparing for Returning The User-Input...
REM Using Tunneling here...
ENDLOCAL && Set "%~3=%__Main_Menu%" && Set "%~4=%__Sub_Menu%"
Goto :EOF
REM Don't Even Think of Doing SOmething - Nasty ;)
www.thebateam.org
