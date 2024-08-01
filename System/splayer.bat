@echo off
mode 160,60
:sounddiff
taskkill /F /IM wscript.exe >nul
cls
call MenuBar FileMain.txt f0
Call Box 10 16 18 50 - - 87 2

Batbox /g 11 17 /d "Edo Music Player"
Batbox /g 11 20 /d "Input path of audio file."
Batbox /g 11 21 /d "Supported Audio Files: .wav and .mp3"
Batbox /g 11 22 /d "Type X to exit"
Batbox /g 11 24 /d ">"
set /p file='>'
if %file%==x goto quit
if %file%==X goto quit
:soundagain
Taskkill /F /IM wscript.exe >nul

call MenuBar FileMain.txt f0
Call Box 10 16 18 50 - - 87 2
Batbox /g 16 26 /d "Note: If music does not play instantly, wait for it."
Batbox /g 11 17 /d "Edo Music Player"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
cls
Call Box 10 16 18 50 - - 87 2
Batbox /g 11 17 /d "Edo Music Player"
ping localhost -n 2 >nul
start /min sound.vbs

call MenuBar FileMain.txt f0
Call Box 10 16 18 50 - - 87 2

Batbox /g 11 17 /d "Edo Music Player"
Batbox /g 12 22 /d "Song Path: %file%"

Batbox /g 12 24 /d "Playing..."
Batbox /g 16 26 /d "Click below when finished playing."
:Loopsound

Call Button 14 30 "Quit" 36 30 "Play again" 14 27 "Play another song" 36 27 "Play in backround" # Press
Getinput /m %Press% /h 70

:: Check for the pressed button 
if %errorlevel%==1 goto quit
if %errorlevel%==2 goto soundagain
if %errorlevel%==3 goto sounddiff
if %errorlevel%==4 goto soundback
goto Loopsound
:quit
Taskkill /F /IM wscript.exe >nul
:soundback
cls

