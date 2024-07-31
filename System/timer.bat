@echo off
cls
Batbox /g 20 7 /d "TIMER FOR EDO OS GUI"

:start

Call Box 18 5 12 43 - - 87 2
call MenuBar FileMain.txt f0
Batbox /g 20 7 /d "Enter seconds to count down from."
Batbox /g 20 8 /d ">"
set /p time=

Call Box 18 5 12 43 - - 87 2
call MenuBar FileMain.txt f0
:looptimer


set /a time=%time%-1
if %time%==0 goto timesup
Batbox /g 20 7 /d "Countdown - [%time%]"
timeout /t 1 >nul
goto looptimer

:timesup
Call Box 18 5 12 43 - - 87 2
call MenuBar FileMain.txt f0
Batbox /g 20 7 /d "Time is up! Playing tone..."
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "timerb.mp3"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >timersound.vbs
start /min timersound.vbs

Batbox /g 20 8 /d "Press any key to stop."
pause >nul
Taskkill /F /IM wscript.exe >nul
cls
color 07