@echo off
:filecheck
cls
if not exist batbox.exe goto fatalerror
if not exist Box.bat goto fatalerror
if not exist Button.bat goto fatalerror
if not exist Check_MenuBar_Click.bat goto fatalerror
if not exist GetDim.Bat goto fatalerror
if not exist GetInput.exe goto fatalerror
if not exist Getlen.bat goto fatalerror
if not exist getlen.exe goto fatalerror
if not exist List.bat goto fatalerror
if not exist Loading.bat goto fatalerror
if not exist MenuBar.Bat goto fatalerror
if not exist wget.exe goto fatalerror
Batbox /g 24 2 /d "Edo OS GUI"
For /l %%A in (0,1,100) Do (
Call loading 3 3 50 87 # 2 Fill %%A
	batbox /w 100
	)
cls
:mouse
Batbox /g 0 8 /d "                                                                    "
ping localhost -n 1 >nul
Batbox /g 0 7 /d "                                                                    "
ping localhost -n 1 >nul
Batbox /g 0 6 /d "                                                                    "
ping localhost -n 1 >nul
Batbox /g 0 5 /d "                                                                    "
ping localhost -n 1 >nul
Batbox /g 0 4 /d "                                                                    "
ping localhost -n 1 >nul
Batbox /g 0 3 /d "                                                                    "
ping localhost -n 1 >nul
Batbox /g 0 2 /d "                                                                    "
ping localhost -n 1 >nul
Batbox /g 0 1 /d "                                                                    "
ping localhost -n 1 >nul

call MenuBar FileMain f0

For /F "Delims=: Tokens=1,2,3" %%A in ('Batbox.exe /m') Do (
	set Button=%%C
	set X=%%A
	set Y=%%B
	)

Call Check_MenuBar_Click.bat !X! !Y! Menu_Option Submenu_option
if %Menu_Option%==0 goto mouse
if %Menu_Option%==1 goto menu1
if %Menu_Option%==2 goto menu2
if %Menu_Option%==3 goto menu3
if %Menu_Option%==4 goto menu4
goto mouse
:menu1
if %Submenu_option%==1 goto apps
if %Submenu_option%==2 goto settings
if %Submenu_option%==3 goto shutdown
if %Submenu_option%==4 goto restart
if %Submenu_option%==5 goto edo-p

goto mouse
:menu2
if %Submenu_option%==1 goto dateandtime

goto mouse
:menu3
if %Submenu_option%==1 call ttt.bat
if %Submenu_option%==2 call cw.bat
goto mouse
:menu4
if %Submenu_option%==1 goto help

goto mouse
:apps
cls
call MenuBar FileMain f0
Call Box 6 6 20 40 - - 87 2

:Loop1

Call Button  8 8 "Notepad" 8 12 "Explorer" 32 21 "Quit" # Press
Getinput /m %Press% /h 70

:: Check for the pressed button 
if %errorlevel%==1 goto notepad
if %errorlevel%==2 goto explorer
if %errorlevel%==3 goto quitapps
goto Loop1
:notepad
echo Not Ready
ping localhost -n 2 >nul 
cls
goto mouse
:Explorer
call explorer.bat
goto mouse
:quitapps
cls
goto mouse
:settings
cls
call MenuBar FileMain f0
Call Box 6 6 20 60 - - 87 2
:Loop2
Batbox /g 20 7 /d "]["
Batbox /g 20 8 /d "]["
Batbox /g 20 9 /d "]["
Batbox /g 20 10 /d "]["
Batbox /g 20 11 /d "]["
Batbox /g 20 12 /d "]["
Batbox /g 20 13 /d "]["
Batbox /g 20 14 /d "]["
Batbox /g 20 15 /d "]["
Batbox /g 20 16 /d "]["
Batbox /g 20 17 /d "]["
Batbox /g 20 18 /d "]["
Batbox /g 20 19 /d "]["
Batbox /g 20 20 /d "]["
Batbox /g 20 21 /d "]["
Batbox /g 20 22 /d "]["
Batbox /g 20 23 /d "]["
Batbox /g 20 24 /d "]["
:choosetab
Batbox /g 36 20 /d "Choose a tab."
Call Button  8 8 "Users" 8 12 "D and T" 8 16 "System" 8 21 "Quit" # Press
Getinput /m %Press% /h 70


:: Check for the pressed button 
if %errorlevel%==1 goto users
if %errorlevel%==2 goto dateandtime
if %errorlevel%==3 goto system
if %errorlevel%==4 goto quitsettings
goto Loop2
:users
call MenuBar FileMain f0
Call Box 6 6 20 60 - - 87 2

Batbox /g 20 7 /d "]["
Batbox /g 20 8 /d "]["
Batbox /g 20 9 /d "]["
Batbox /g 20 10 /d "]["
Batbox /g 20 11 /d "]["
Batbox /g 20 12 /d "]["
Batbox /g 20 13 /d "]["
Batbox /g 20 14 /d "]["
Batbox /g 20 15 /d "]["
Batbox /g 20 16 /d "]["
Batbox /g 20 17 /d "]["
Batbox /g 20 18 /d "]["
Batbox /g 20 19 /d "]["
Batbox /g 20 20 /d "]["
Batbox /g 20 21 /d "]["
Batbox /g 20 22 /d "]["
Batbox /g 20 23 /d "]["
Batbox /g 20 24 /d "]["
Batbox /g 22 9 /d "<=="
Batbox /g 26 8 /d "1 user found:"
Batbox /g 26 10 /d "%username%"
Batbox /g 26 12 /d "User path:"
Batbox /g 26 14 /d "%userprofile%"
goto choosetab
:dateandtime



call MenuBar FileMain f0
Call Box 6 6 20 60 - - 87 2
Batbox /g 22 13 /d "<=="
Batbox /g 20 7 /d "]["
Batbox /g 20 8 /d "]["
Batbox /g 20 9 /d "]["
Batbox /g 20 10 /d "]["
Batbox /g 20 11 /d "]["
Batbox /g 20 12 /d "]["
Batbox /g 20 13 /d "]["
Batbox /g 20 14 /d "]["
Batbox /g 20 15 /d "]["
Batbox /g 20 16 /d "]["
Batbox /g 20 17 /d "]["
Batbox /g 20 18 /d "]["
Batbox /g 20 19 /d "]["
Batbox /g 20 20 /d "]["
Batbox /g 20 21 /d "]["
Batbox /g 20 22 /d "]["
Batbox /g 20 23 /d "]["
Batbox /g 20 24 /d "]["

Batbox /g 26 8 /d "Date: %date%"
Batbox /g 26 9 /d "Time: %time%"
Batbox /g 23 10 /d "(updates every time you select this tab)"
Batbox /g 0 3 /d "                            "
Batbox /g 0 2 /d "                            "
Batbox /g 0 1 /d "                            "
goto choosetab
:system
call MenuBar FileMain f0
Call Box 6 6 20 60 - - 87 2
Batbox /g 22 17 /d "<=="
Batbox /g 20 7 /d "]["
Batbox /g 20 8 /d "]["
Batbox /g 20 9 /d "]["
Batbox /g 20 10 /d "]["
Batbox /g 20 11 /d "]["
Batbox /g 20 12 /d "]["
Batbox /g 20 13 /d "]["
Batbox /g 20 14 /d "]["
Batbox /g 20 15 /d "]["
Batbox /g 20 16 /d "]["
Batbox /g 20 17 /d "]["
Batbox /g 20 18 /d "]["
Batbox /g 20 19 /d "]["
Batbox /g 20 20 /d "]["
Batbox /g 20 21 /d "]["
Batbox /g 20 22 /d "]["
Batbox /g 20 23 /d "]["
Batbox /g 20 24 /d "]["
Batbox /g 26 9 /d "About:"
Batbox /g 26 11 /d "16 Rom Banks"
Batbox /g 26 12 /d "16 Ram User Banks."
Batbox /g 26 13 /d "Edo OS GUI registered to %username%"
goto choosetab
:quitsettings
cls
goto mouse
:shutdown
Call Box 20 7 6 18 - - 87 2
Batbox /g 22 9 /d "Please wait..."
ping localhost -n 2 >nul
cls
Call Box 20 7 6 48 - - 87 2
Batbox /g 22 9 /d "It is safe for you to turn off your computer"
pause >nul
exit
:restart
Call Box 20 7 6 18 - - 87 2
Batbox /g 22 9 /d "Please wait..."
ping localhost -n 4 >nul
goto filecheck
:edo-p
cls
Call Box 20 7 6 32 - - 87 2
Batbox /g 22 9 /d "Input the edo-p file path."
Batbox /g 22 10 /d "=>"
set /p edopfile='>'
cd %edopfile%
set /a p1=0
if exist Edo-P1.bat set /a p1+=1
if exist Edo-P1.21.bat set /a p1+=1
if exist Edo-P2.bat set /a p1+=1
cls
if %p1%==0 goto edo-pnotfound
echo %p1% Edo-P files were found. Type 1 for version 1 (if present) and so on. Type X to exit.
set /p edo-plist=">"
if %edo-plist%==1 call Edo-P1.bat
if %edo-plist%==2 call Edo-P1.21.bat
if %edo-plist%==3 call Edo-P2.bat
if %edo-plist%==x goto filecheck
if %edo-plist%==X goto filecheck
goto edo-p
:edo-pnotfound
echo If you are seeing this message, you have not installed Edo-P or you have not specified the correct directory.
ping localhost -n 6 >nul
goto filecheck
:help
cls
call MenuBar FileMain f0
Call Box 6 6 20 88 - - 87 2

Batbox /g 44 9 /d "Help"
Batbox /g 8 10 /d "How to use:"

Batbox /g 8 11 /d "To navigate the menubar, click on the text and the specified menu will show up."
Batbox /g 8 12 /d "Click the X to deselect the tab."
Batbox /g 8 13 /d "In the submenus, click the text and the result will appear."
Batbox /g 8 14 /d "All the apps are user friendly and do not require any hard work to navigate around."
Batbox /g 8 15 /d "Will dissapear in 15 sec."
ping localhost -n 15 >nul
cls
goto mouse
:fatalerror
color 4F
echo FATAL ERROR
echo ===========
echo.
echo 1 or more files has not been found and Edo OS GUI cannot start.
echo Please reinstall EDO OS GUI or start Edo-P.
echo Press any key to restart.
pause >nul
color 07
cls
goto filecheck

