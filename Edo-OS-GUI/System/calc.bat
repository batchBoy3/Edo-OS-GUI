@echo off
setlocal enabledelayedexpansion

:: Define the main calculator GUI loop
:main_loop
cls
echo =====================
echo Edo OS GUI Calculator
echo =====================

:: Display buttons
Call Button 8 8 "1" 12 8 "2" 16 8 "3" 20 8 "+" 8 12 "4" 12 12 "5" 16 12 "6" 20 12 "-" 8 16 "7" 12 16 "8" 16 16 "9" 20 16 "*" 8 20 "0" 12 20 "C" 16 20 "=" 20 20 "/" # Press



:: Get the button pressed by the user
Getinput /m %Press% /h 70

:: Check for the pressed button
if %errorlevel%==1 set "input=!input!1" & goto main_loop
if %errorlevel%==2 set "input=!input!2" & goto main_loop
if %errorlevel%==3 set "input=!input!3" & goto main_loop
if %errorlevel%==4 set "input=!input!+" & goto main_loop
if %errorlevel%==5 set "input=!input!4" & goto main_loop
if %errorlevel%==6 set "input=!input!5" & goto main_loop
if %errorlevel%==7 set "input=!input!6" & goto main_loop
if %errorlevel%==8 set "input=!input!-" & goto main_loop
if %errorlevel%==9 set "input=!input!7" & goto main_loop
if %errorlevel%==10 set "input=!input!8" & goto main_loop
if %errorlevel%==11 set "input=!input!9" & goto main_loop
if %errorlevel%==12 set "input=!input!*" & goto main_loop
if %errorlevel%==13 set "input=!input!0" & goto main_loop
if %errorlevel%==14 set "input=" & goto main_loop
if %errorlevel%==15 goto evaluate
if %errorlevel%==16 set "input=!input!/" & goto main_loop

:evaluate
:: Evaluate the expression
set "expression=%input%"
set /a result=%expression%
batbox /g 1 4 /d "Answer is %result%" 

batbox /g 1 5
pause 
cls
