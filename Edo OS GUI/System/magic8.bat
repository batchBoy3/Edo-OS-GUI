@echo off
:start
cls
echo.
echo MAGIC 8 BALL FOR EDO OS GUI
Call Button  5 18 "Shake" 48 2 "Quit" # Press
:Loop4

Getinput /m %Press% /h 70

:: Check for the pressed button 
if %errorlevel%==1 goto Shake
if %errorlevel%==2 goto quit
goto Loop4
:Shake
echo Shaking...
ping localhost -n 2 >nul
cls
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
goto start
:yes1
echo.
echo Yes.
ping localhost -n 2 >nul
goto start
:yes2
echo.
echo Positive.
ping localhost -n 2 >nul
goto start
:yes3
echo.
echo I am sure.
ping localhost -n 2 >nul
goto start
:yes4
echo.
echo The sky says yes.
ping localhost -n 2 >nul
goto start
:no1
echo.
echo No.
ping localhost -n 2 >nul
goto start
:no2
echo.
echo Negative.
ping localhost -n 2 >nul
goto start
:no3
echo.
echo The stars say no.
ping localhost -n 2 >nul
goto start
:no4
echo.
echo Why would you? (No)
ping localhost -n 2 >nul
goto start
:cannot1
echo.
echo Cannot Fortell Now
ping localhost -n 2 >nul
goto start
:cannot2
echo.
echo Ask me later.
ping localhost -n 2 >nul
goto start
:quit
echo Please wait...
ping localhost -n 2 >nul
call FCP.bat