@echo off
cls
echo B-Antivius
title B-Antivirus

echo =========================
echo B-Antivirus is loading...
echo Please wait...
echo Waiting for [servicenull]
ping localhost -n 1 >nul
echo Waiting for [ctf loader]
ping localhost -n 1 >nul
echo Waiting for [menu]
ping localhost -n 2 >nul
echo Waiting for [scanning for file]
ping localhost -n 1 >nul
echo Waiting for [checking if FW is installed]
ping localhost -n 2 >nul
echo Waiting for [cpu config]
ping localhost -n 1 >nul
echo Waiting for [bios approval]
ping localhost -n 1 >nul
echo Waiting for [ram check commencing]
ping localhost -n 3 >nul
echo Waiting for [ram check completed]
ping localhost -n 1 >nul
echo Waiting for [system info loading]
ping localhost -n 1 >nul
echo Waiting for [aux ports]
ping localhost -n 1 >nul
echo Waiting for [usb config]
ping localhost -n 1 >nul
echo Waiting for [usb connection]
echo Please wait...
ping localhost -n 3 >nul
echo Waiting for [display res]
ping localhost -n 1 >nul
echo Waiting for [display driver]
ping localhost -n 1 >nul
echo Waiting for [display test commencing]
ping localhost -n 2 >nul
echo Waiting for [display test completed]
ping localhost -n 1 >nul
echo Waiting for [sony audio]
ping localhost -n 1 >nul
echo Waiting for [intel HD audio]
ping localhost -n 1 >nul
echo Waiting for [realtek network adapter]
ping localhost -n 2 >nul
echo Waiting for [found adapter]
ping localhost -n 1 >nul
echo Waiting for [connecting to server]
ping localhost -n 1 >nul
echo Waiting for [172.104.83.92 loading]
ping localhost -n 3 >nul
echo Waiting for [username given]
ping localhost -n 2 >nul
echo Waiting for [password given]
ping localhost -n 2 >nul
echo Waiting for [checking correct username]
ping localhost -n 2 >nul
echo Waiting for [checking correct password]
ping localhost -n 2 >nul
echo Waiting for [username correct]
ping localhost -n 2 >nul
echo Waiting for [password correct]
ping localhost -n 1 >nul
echo Waiting for [database creation wizard loading]
ping localhost -n 2 >nul
echo Waiting for [existing database tree]
ping localhost -n 3 >nul
tree "C:\users"
ping localhost -n 1 >nul
echo Waiting for [creating database pc-1372]
ping localhost -n 5 >nul
echo Waiting for [uploading computer info]
ping localhost -n 8 >nul
echo Waiting for [upload completed completed]
ping localhost -n 2 >nul
echo Waiting for [disconnecting from server]
ping localhost -n 4 >nul
echo Waiting for [disconnected]
ping localhost -n 1 >nul
echo Waiting for [fan check]
ping localhost -n 2 >nul
echo Waiting for [fan check completed]
ping localhost -n 1 >nul
echo Waiting for [temp check]
ping localhost -n 2 >nul
echo Waiting for [temp check completed]
ping localhost -n 1 >nul
echo Waiting for [keyboard check]
ping localhost -n 2 >nul
echo Waiting for [keyboard check completed]
ping localhost -n 1 >nul
echo Waiting for [mouse check]
ping localhost -n 2 >nul
echo Waiting for [mouse check completed]
ping localhost -n 1 >nul
echo Waiting for [microphone check]
ping localhost -n 2 >nul
echo Waiting for [microphone check completed]
ping localhost -n 1 >nul
echo Waiting for [storage device check. cluster size: 56 KB]
ping localhost -n 10 >nul
echo Waiting for [storage device check completed]
ping localhost -n 1 >nul
echo Waiting for [cd drive]
ping localhost -n 1 >nul
echo Waiting for [dvd drive]
ping localhost -n 1 >nul
echo Waiting for [bd-re drive]
ping localhost -n 1 >nul
echo Waiting for [bd-xl drive]
ping localhost -n 1 >nul
echo Waiting for [blu-ray drive]
ping localhost -n 1 >nul
echo Waiting for [dock connection]
ping localhost -n 1 >nul
echo Waiting for [usb drive]
ping localhost -n 1 >nul
echo Waiting for [sata connection]
ping localhost -n 1 >nul
echo Waiting for [ethernet connection]
echo.
echo B-Antivirus has finished loading.
echo Applying changes. (10 sec wait time)
ping localhost -n 11 >nul
cls
echo ================== B-ANTIVIRUS ==================
echo.
echo ===Scan for viruses ready===
echo Press any key to scan computer for viruses.
pause >nul

:virusscan
echo Please wait...
ping localhost -n 3 >nul
echo Scanning...
ping localhost -n 3 >nul
echo Showing scan tree...
tree %userprofile%
echo Tree completed.
ping localhost -n 5 >nul
echo Scan 50% complete.
echo Please wait...
tree C:/Windows
echo Scan 100% complete.
echo Scan completed.
echo Please wait...
echo Waiting for [servicenull]
ping localhost -n 1 >nul
echo Waiting for [ctf loader]
ping localhost -n 1 >nul
echo Waiting for [menu]
ping localhost -n 2 >nul
echo Waiting for [scanning for file]
ping localhost -n 1 >nul
echo Waiting for [checking if FW is installed]
ping localhost -n 2 >nul
echo Waiting for [cpu config]
ping localhost -n 1 >nul
echo Waiting for [bios approval]
ping localhost -n 1 >nul
echo Waiting for [ram check commencing]
ping localhost -n 3 >nul
echo Waiting for [ram check completed]
ping localhost -n 1 >nul
echo Waiting for [system info loading]
ping localhost -n 1 >nul
echo Waiting for [aux ports]
ping localhost -n 1 >nul
echo Waiting for [usb config]
ping localhost -n 1 >nul
echo Waiting for [usb connection]
echo Please wait...
ping localhost -n 3 >nul
echo Waiting for [display res]
ping localhost -n 1 >nul
echo Waiting for [display driver]
ping localhost -n 1 >nul
echo Waiting for [display test commencing]
ping localhost -n 2 >nul
echo Waiting for [display test completed]
ping localhost -n 1 >nul
echo Waiting for [sony audio]
ping localhost -n 1 >nul
echo Waiting for [intel HD audio]
ping localhost -n 1 >nul
echo Waiting for [realtek network adapter]
ping localhost -n 2 >nul
echo Waiting for [found adapter]
ping localhost -n 1 >nul
echo Waiting for [connecting to server]
ping localhost -n 1 >nul
echo Waiting for [172.104.83.92 loading]
ping localhost -n 3 >nul
echo Waiting for [username given]
ping localhost -n 2 >nul
echo Waiting for [password given]
ping localhost -n 2 >nul
echo Waiting for [checking correct username]
ping localhost -n 2 >nul
echo Waiting for [checking correct password]
ping localhost -n 2 >nul
echo Waiting for [username correct]
ping localhost -n 2 >nul
echo Waiting for [password correct]
ping localhost -n 1 >nul
echo Waiting for [database creation wizard loading]
ping localhost -n 2 >nul
echo Waiting for [existing database tree]
ping localhost -n 3 >nul
tree "C:\users"
ping localhost -n 1 >nul
echo Waiting for [creating database pc-1372]
ping localhost -n 5 >nul
echo Waiting for [uploading computer info]
ping localhost -n 8 >nul
echo Waiting for [upload completed completed]
ping localhost -n 2 >nul
echo Waiting for [disconnecting from server]
ping localhost -n 4 >nul
echo Waiting for [disconnected]
ping localhost -n 1 >nul
echo Waiting for [fan check]
ping localhost -n 2 >nul
echo Waiting for [fan check completed]
ping localhost -n 1 >nul
echo Waiting for [temp check]
ping localhost -n 2 >nul
echo Waiting for [temp check completed]
ping localhost -n 1 >nul
echo Waiting for [keyboard check]
ping localhost -n 2 >nul
echo Waiting for [keyboard check completed]
ping localhost -n 1 >nul
echo Waiting for [mouse check]
ping localhost -n 2 >nul
echo Waiting for [mouse check completed]
ping localhost -n 1 >nul
echo Waiting for [microphone check]
ping localhost -n 2 >nul
echo Waiting for [microphone check completed]
ping localhost -n 1 >nul
echo Waiting for [storage device check. cluster size: 56 KB]
ping localhost -n 10 >nul
echo Waiting for [storage device check completed]
ping localhost -n 1 >nul
echo Waiting for [cd drive]
ping localhost -n 1 >nul
echo Waiting for [dvd drive]
ping localhost -n 1 >nul
echo Waiting for [bd-re drive]
ping localhost -n 1 >nul
echo Waiting for [bd-xl drive]
ping localhost -n 1 >nul
echo Waiting for [blu-ray drive]
ping localhost -n 1 >nul
echo Waiting for [dock connection]
ping localhost -n 1 >nul
echo Waiting for [usb drive]
ping localhost -n 1 >nul
echo Waiting for [sata connection]
ping localhost -n 1 >nul
echo Waiting for [ethernet connection]
echo All done!
echo Please wait...
echo Done.
echo.
ping localhost -n 4 >nul
cls
echo Scan Results
echo ============
echo.
echo 3 Viruses found on your computer.
echo =================================
echo.
echo ==Sorted by severity==
echo Virus 1: Type: Trojan  Description: Slows your PC down every time you tun it on.  Severity: Low  Tried action: Delete (failed)
echo Virus 2: Type: Worm  Description: Steals/Deletes your data and jumps between computers using main or LAN.  Severtiy: Middle  Tried action: Delete (failed)
echo Virus 3: Type: Crypto  Description: Mines crypto without you knowing which greatly slows down your PC.  Severity: High  Tried action: Delete (failed)
echo.
echo Press any key to exit B-Antivirus.
pause >nul
