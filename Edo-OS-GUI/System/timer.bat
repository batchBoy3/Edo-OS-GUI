@echo off
echo TIMER FOR EDO OS GUI

:start

cls
echo Enter time to countdown from.

set /p "time=>
set time=%time%

:loop
cls

set /a time=%time%-1
if %time%==0 goto timesup

echo.
echo.

echo.
echo Countdown - [%time%]

ping localhost -n 2 > nul
goto loop

:timesup
echo Time is up. Returning to Edo OS GUI...
ping localhost -n 3 >nul

cls
color 07