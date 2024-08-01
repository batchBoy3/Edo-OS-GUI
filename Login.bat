@echo off
cls
if not exist "user1name.usr" goto usersetup
if not exist "user1pass.usr" goto usersetup

goto login
:usersetup
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d "It seems like you do not have a user account. Make one here."
ping localhost -n 4 >nul
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d "Enter the first name of your user account. Cannot contain spaces."
Batbox /g 12 21 /d ">"
set /p nameusr=
echo %nameusr% > user1name.usr
:pass
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d "Enter the password for your user account. Cannot contain spaces."
Batbox /g 12 21 /d ">"
set /p passusr=

echo %passusr% > user1pass.usr
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d "Account creation completed!"
ping localhost -n 3 >nul
:login
Call Box 10 18 12 70 - - 87 2

)
Batbox /g 12 20 /d "Login."
Batbox /g 12 21 /d "Input Username"
Batbox /g 12 23 /d ">"
set /p user=
setlocal EnableDelayedExpansion
for /f "tokens=* Delims=" %%x in (user1name.usr) do (
    set "variable=%%x"
set "usercheck=!usercheck!%%x"
)
setlocal DisableDelayedExpansion
if %usercheck%==%user% goto password

Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d "Username not found in database. Please try again."
ping localhost -n 3 >nul
goto login
:password
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d "Login."
Batbox /g 12 21 /d "Input Password."
Batbox /g 12 23 /d ">"
set /p pass=
setlocal EnableDelayedExpansion

for /f "tokens=* Delims=" %%x in (user1pass.usr) do (
    set "variable1=%%x"
set "passcheck=!passcheck!%%x"
)

setlocal DisableDelayedExpansion

if %pass%==%passcheck% goto logincompleted
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d "Password not found in database. Please try again."
ping localhost -n 3 >nul
goto password
:logincompleted
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d "Login Completed."
Batbox /g 12 21 /d "Please wait..."
ping localhost -n 3 >nul
cls
call so-ode.bat