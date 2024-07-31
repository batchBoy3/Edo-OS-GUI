@echo off
:start
cls
call MenuBar FileMain.txt f0
Call Box 18 5 12 43 - - 87 2
Batbox /g 20 7 /d "MAGIC 8 BALL FOR EDO OS GUI"
Call Button  20 12 "Shake" 50 12 "Quit" # Press
:Loop4

Getinput /m %Press% /h 70

:: Check for the pressed button 
if %errorlevel%==1 goto Shake
if %errorlevel%==2 goto quit
goto Loop4
:Shake
Batbox /g 20 10 /d "Shaking the magic 8 ball..."
ping localhost -n 4 >nul

call MenuBar FileMain.txt f0
Call Box 18 5 12 43 - - 87 2
set /a rand=%random%%%10+1
if %rand%==1 goto yes1
if %rand%==2 goto yes2
if %rand%==3 goto yes3
if %rand%==4 goto yes4
if %rand%==5 goto no1
if %rand%==6 goto no2
if %rand%==7 goto no3
if %rand%==8 goto no4
if %rand%==9 goto cannot1
if %rand%==10 goto cannot2

:yes1
Batbox /g 20 10 /d "Yes."
ping localhost -n 4 >nul
goto start
:yes2
Batbox /g 20 10 /d "Positive."
ping localhost -n 4 >nul
goto start
:yes3
Batbox /g 20 10 /d "I am sure."
ping localhost -n 4 >nul
goto start
:yes4
Batbox /g 20 10 /d "The sky says yes."
ping localhost -n 4 >nul
goto start
:no
Batbox /g 20 10 /d "No."
ping localhost -n 4 >nul
goto start
:no2
Batbox /g 20 10 /d "Negative."
ping localhost -n 4 >nul
goto start
:no3
Batbox /g 20 10 /d "The stars say no."
ping localhost -n 4 >nul
goto start
:no4
Batbox /g 20 10 /d "Why would you? (No)"
ping localhost -n 4 >nul
goto start
:cannot1
Batbox /g 20 10 /d "Cannot Fortell Now"
ping localhost -n 4 >nul
goto start
:cannot2
Batbox /g 20 10 /d "Ask me later."
ping localhost -n 4 >nul
goto start
:quit
Batbox /g 20 10 /d "Please wait..."
ping localhost -n 4 >nul
cls
color 07