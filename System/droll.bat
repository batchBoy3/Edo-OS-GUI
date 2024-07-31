@echo off
cls
:Loop6
call MenuBar FileMain.txt f0
Call Box 18 5 12 43 - - 87 2
Batbox /g 20 7 /d "Range: 0-100"
Call Button  20 12 "Roll" 50 12 "Quit" # Press
Getinput /m %Press% /h 70

:: Check for the pressed button 
if %errorlevel%==1 goto Roll
if %errorlevel%==2 goto quit
goto Loop6
:Roll

set /a rand=%random%%%100+1
Batbox /g 20 10 /d "The random number is %rand%"
ping localhost -n 3 >nul
goto Loop6
:quit
cls
color 07