@echo off
mode 120,70
:desklog
cls
:loop
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d "Login"
Call Button  12 22 "Create Account" 32 22 "Login" 44 22 "Shutdown" # Press
Getinput /m %Press% /h 70
if %errorlevel%==1 goto Createacc
if %errorlevel%==2 goto Login
if %errorlevel%==3 goto Shutdown
goto loop
:Shutdown
cls
call FCP.bat
exit
:Createacc
cls
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d "Create account"
Batbox /g 12 22 /d ""
set /p username="Enter username: "
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d "Login"
Batbox /g 12 22 /d ""
set /p password="Enter password: "
 
if exist users.txt (
    findstr /i /c "%username%" users.txt >nul
    if not errorlevel 1 (
        Batbox /g 12 22 /d "Username already exists!"
        pause
        goto desklog
    )
)


Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d "Create Account"
echo %username% >> users.txt 
echo %password% >> pass.txt
Batbox /g 12 22 /d "User registered successfully!"
pause
goto desklog
 

 
 
:login
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 19 /d "Login"
Batbox /g 12 20 /d ""
set /p username="Enter username: "
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 20 /d ""
set /p password="Enter password: "
 
findstr /i /c "%username%" users.txt >nul
findstr /i /c "%password%" pass.txt >nul
if errorlevel 1 (
    Batbox /g 12 18 /d "Invalid username or password!"
    pause
    goto desklog
)
cls
Call Box 10 18 12 70 - - 87 2
Batbox /g 12 18 /d "Login"

Batbox /g 12 20 /d "Login completed."
goto end

:end
call so-ode.bat