@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Simple Notepad in Batch
echo.
echo 1. Create New File
echo 2. Read File
echo 3. Edit File
echo 4. Exit
echo.
set /p choice="Choose an option (1-4): "

if %choice%==1 goto create
if %choice%==2 goto read
if %choice%==3 goto append
if %choice%==4 goto end

:create
cls
set /p filename="Enter the filename to create: "
if exist %filename% (
    echo File already exists!
    pause
    goto menu
)
echo Type your text below. Press Ctrl+Z and Enter to save.
echo. > %filename%
more >> %filename%
goto menu

:read
cls
set /p filename="Enter the filename to read: "
if not exist %filename% (
    echo File does not exist!
    pause
    goto menu
)
type %filename%
pause
goto menu

:append
cls
set /p filename="Enter the filename to edit: "
if not exist %filename% (
    echo File does not exist!
    pause
    goto menu
)
echo Type your text below. Press Ctrl+Z and Enter to save.
more >> %filename%
goto menu

:end
endlocal
cls
color 07