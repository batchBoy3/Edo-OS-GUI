@echo off

:Loop4
cls
echo Range: 0-100
Call Button  5 18 "Roll" 48 2 "Quit" # Press
Getinput /m %Press% /h 70

:: Check for the pressed button 
if %errorlevel%==1 goto Roll
if %errorlevel%==2 goto quit
goto Loop4
:Roll
echo.
set /a rand=%random%%%100+1
echo The random number is %rand%
pause
goto Loop4
:quit
call so-ode.bat