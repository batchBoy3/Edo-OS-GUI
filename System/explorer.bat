@Echo off
cls

Set "Path=%Path%;%cd%;%cd%\files"
Color 0a


:top
setlocal enabledelayedexpansion
set active=1
set filter=*
set loop_session=0
if exist "%temp%\now.nk" (
	set /p old_path=<"%temp%\path.Kvc" >nul 2>&1
	set /p restore=<"%temp%\now.nk" >nul 2>&1
	cd /d "%old_path%" >nul 2>&1
	if exist "%temp%\!restore!.temp" (for /f "tokens=*" %%a in (%temp%\!restore!.temp) do (call :fix_it_back "%%a"))
	)
cls
set path=%path%;%cd%
set wmic_status=Available
set colous_status=Available
set fn_status=Available
:: Check if WMIC.EXE is available
WMIC.EXE Alias /?:Brief >NUL 2>&1 || (set wmic_status="Not Available")
:: Check if colous.exe is available
colous.EXE /?>NUL 2>&1 || (set colous_status="Not Available")
fn.dll >NUL || (set fn_status="Not Available")

set cut=no
for %%a in (fn_status wmic_status colous_status) do (if /i "!%%a!" NEQ "Available" (echo.&echo. One of three important files is Missing... Program May malfunction ...&&pause))
call :my_computer
goto a

:a
set var_=0
set /a s_=!Columns! - 35
time /t>"%temp%\time.now" 2>NUL
date /t>"%temp%\date.now" 2>NUL
set /p tim=<"%temp%\time.now"
set /p dat=<"%temp%\date.now"
FOR /L %%A IN (0,1,!Columns!) DO (if not "!cd:~%%A,1!" == "" (set /a var_=!var_! + 1))
if !var_! geq !Columns! (for %%Z in (!s_!) do (set cd_=!cd:~0,%%Z!...!cd:~-28!))
if !var_! lss !Columns! (set cd_=!cd!)
if exist "%temp%\!loop_session!.temp" (for /f "tokens=*" %%a in (%temp%\!loop_session!.temp) do (call :fix_it_back "%%a"))
set /a loop_session=!loop_session!+1
call :chk_window_size Lines Columns
set /a limit=!Lines!-9
if !Columns! lss 80 (echo.&echo. This Screen-size is not recommended ... &&pause&&goto top)
if !Lines! lss 40 (echo.&echo. This Screen-size is not recommended ...  &&pause&&goto top)
set count=0
echo.!cd!>"%temp%\old_path.Kvc"
echo.!loop_session!>"%temp%\now.nk"
dir /b /a:d *(* >"%temp%\!loop_session!.temp" 2>NUL
if exist "%temp%\!loop_session!.temp" (for /f "tokens=*" %%a in (%temp%\!loop_session!.temp) do (call :fix_it "%%a"))
for /f "tokens=*" %%b in ('dir /b /a:d !filter!') do (
	set /a count=!count!+1
	set "var!count!=%%b"
	set var_=1
	set /a sa=!Columns!-30
	for %%a in (!count!) do (
		FOR /L %%A IN (1,1,!Columns!) DO (if not "!var%%a:~%%A,1!" == "" (set /a var_=!var_! + 1))
		if !var_! geq !Columns! (for %%Z in (!sa!) do set var%%a=!var%%a:~0,%%Z!...!var%%a:~-20!)
		)
	)
set /a count=!count!+1
set folderCount=!count!
set "var!count!=- - - - - - - - - - - - - - - - - - - - - - -"
for /f "tokens=*" %%b in ('dir /b /a:-d !filter!') do (
	set /a count=!count!+1
	set "var!count!=%%b"
	set var_=1
	set /a sa=!Columns!-30
	for %%a in (!count!) do (
	FOR /L %%A IN (1,1,!Columns!) DO (if not "!var%%a:~%%A,1!" == "" (set /a var_=!var_! + 1))
	if !var_! geq !Columns! (for %%Z in (!sa!) do set var%%a=!var%%a:~0,%%Z!...!var%%a:~-20!)
	)
)
set page_start=1
if !count! gtr !limit! (set page=!limit!) else (set page=!count!)
set current_page=1
set page_count=1
set temp_count=!count!
:loop
if !temp_count! gtr !limit! (
	set /a temp_count=!temp_count!-!limit!
	set /a page_count=!page_count!+1
	goto loop
	)
goto b

:b
if not defined two_presses (cls) ELSE (colous 7 0 1,1)
set /a new_value=!folderCount!-1
set /a files=!count!-!folderCount!-1

echo. !cd_!
echo.
echo. %tim% , %dat%
echo.
for /l %%a in (!page_start!,1,!page!) do (
	if "%%a" == "!active!" (
		set /a var_=!var_!+2
		set x=
		set var_=1
		set /a sa=!Columns!-5
		FOR /L %%A IN (1,1,!Columns!) DO (if not "!var%%a:~%%A,1!" == "" (set /a var_=!var_! + 1))
		set /a var_=!var_!+2
		for /l %%b in (1,1,!var_!) do (set x=!x!Ä)
		echo.Ú!x!¿&&echo.³ !var%%a! ³&&echo.À!x!Ù
		)
	if "%%a" neq "!active!" (
		if defined var%%a (
			if defined two_presses (
				for %%x in (!half_col!) do (set var%%a=!var%%a:~0,%%x!)
				echo.!var%%a!
				)
			if not Defined two_presses (echo.!var%%a!)
			)
		)
	)
if defined two_presses (goto %two_presses%)
fn.dll kbd
set error=%errorlevel%
set key=
for /l %%a in (0,1,9) do ((set /a z=%%a+48) && if /i "!error!" == "!z!" set "key=%%a")
SET COUNTe=64
FOR %%A IN (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO ((SET /A counte=!counte!+1)&&(IF /I "!error!" == "!counte!" SET "key=%%A"))
SET counte=96
FOR %%A IN (a b c d e f g h i j k l m n o p q r s t u v w x y z) DO ((SET /A counte=!counte!+1)&&(IF /I "!error!" == "!counte!" SET "key=%%A"))
if "%error%" == "327" (set /a active=!active!-1&&if !active! == !folderCount! (set /a active=!folderCount!-1)&&goto verify)
if "%error%" == "335" (set /a active=!active!+1&&if !active! == !folderCount! (set /a active=!folderCount!+1)&&goto verify)
if "%error%" == "5" (
	if exist "%temp%\!loop_session!.temp" (for /f "tokens=*" %%a in (%temp%\!loop_session!.temp) do (call :fix_it_back "%%a"))
	call :my_computer
	set filter=*
	set active=1
	goto a
	)

if "%error%" == "332" (
	:my_label
	if !active! == !folderCount! (goto b)
	if %active% lss !folderCount! (cd "!var%active%!"&&set active=1&&goto jump)
	if !active! gtr !folderCount! (
		set ext=!var%active%:~-4!
		set ext=!ext:.=!
		set "ext=.!ext!"
		Reg Query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\fileexts\!ext!\OpenWithList" >"%temp%\file.Kvc"
		if EXIST "!temp!\file1.Kvc" (del /q "!temp!\file1.Kvc")
		for /f "skip=2 tokens=1,2,3" %%m in (!temp!\file.Kvc) do (if /i "%%m" == "MRUList" (set MRUList=%%o))
		set height=0
		set var_t=var!active!
		:round
		if /i "!MRUList!" == "" (goto next)
		set /a height=!height!+1
		Reg Query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\fileexts\!ext!\OpenWithList" /v !MRUList:~0,1! >"!temp!\aa.Kvc"
		for /f "skip=2 tokens=3" %%w in (!temp!\aa.Kvc) do (echo.%%w>"!temp!\!height!.Setting")
		set MRUList=!MRUList:~1!
		goto round
		:next
		call :chk_window_size Lines Columns
		set /a half_lin1=!Lines! / 2
		set /a half_lin2=!height!+1
		set /a half_lin2=!half_lin2! / 2
		set /a half_lin=!half_lin1! - !half_lin2!-6
		colous 8 0 1,1
		set spaces=
		set x=
		set nkCount=0
		set /a half_col=!Columns! / 2 - 10
		for /l %%x in (1,1,!half_col!) do set "spaces=!spaces! "
		for /l %%i in (1,1,20) do (set "x=!x!Í")
		for /l %%x in (1,1,!half_lin!) do (echo.)
		echo.!spaces!Enter Sr.No. of Ur Selection
		echo.!spaces!É!x!»
		echo.!spaces!º  Open File With... º
		echo.!spaces!Ì!x!¹
		echo.!spaces!º 0. Default         º
		for /l %%s in (1,1,!height!) do (
			set /a nkCount=!nkCount!+1
			set /p item=<"!temp!\%%s.Setting"
			set var_=0
			set vari_=
			FOR /L %%A IN (1,1,20) DO (if not "!item:~%%A,1!" == "" (set /a var_=!var_! + 1)&&set vari=!item!)
			set open!nkCount!=!item!
			if !var_! geq 20 (set "variable=!vari:~0,14!...") ELSE (set /a left=16-!var_!&&for /l %%j in (1,1,!left!) do (set "vari_=!vari_! ")&&set "variable=!vari!")
			echo.!spaces!º !nkCount!.!variable!!vari_!º
			set "display!nkCount!= !variable!"
			)
		echo.!spaces!È!x!¼
		set /a half_colu=!half_col!+3
		set /a half_line=!half_lin!+7+!nkCount!
		set two_presses=label_8
		goto a
		:label_8
		set input=0
		colous 8 0 !half_colu!,!half_line!
		set /p input=^>
		if "!input!" gtr "!nkCount!" goto label_8
		if "!open%input%!" == "wmplayer.exe" (start "!open%input%!" "%systemdrive%\Program Files\Windows Media Player\wmplayer.exe" /Play "!cd!\!var%active%!"&&goto jump)
		if "!input!" == "0" (start "Default" "!var%active%!"&&goto jump)
		if not Defined open!input! goto label_8
		if EXIST "!temp!\app.path" (del /q "!temp!\app.path" 2>nul)
		dir /s /b "%programfiles%\!open%input%!" > "%temp%\app.path" 2>nul
		set /p app_path=<"%temp%\app.path"
		if not defined app_path (set app_path=!open%input%!)
		start "!open%input%!" "%app_path%" "!var%active%!"
		)
	:jump
	set two_presses=
	set filter=*	
	goto a
	)
if "%error%" == "330" (
	if exist "%temp%\!loop_session!.temp" (for /f "tokens=*" %%a in (%temp%\!loop_session!.temp) do (call :fix_it_back "%%a"))
	for %%a in (!active!) do (cd..)
	set active=1
	set filter=*
	goto a
)
if "%error%" == "27" (
	cls
	setlocal
	set /p command=%cd%^>
	!command!
	pause
	endlocal
	goto a
	)
if "%error%" == "46" (
	set /a current_page=!current_page!+1
	if !current_page! gtr !page_count! (set current_page=!page_count!)
	set /a page=!current_page! * !limit! + !current_page! - 1
	set /a page_start=!page!-!limit!-1
	set active=!page_start!
	if !active! leq 0 (set active=1)
	set filter=*
	goto b
	)
if "%error%" == "44" (
	set /a current_page=!current_page!-1
	if !current_page! lss 1 (set current_page=1)
	set /a page=!current_page! * !limit! + !current_page! - 1
	set /a page_start=!page!-!limit!-1
	set active=!page_start!
	if !active! leq 0 (set active=1)
	set filter=*
	goto b
	)
if "%error%" == "338" (
	if "!active!" == "!folderCount!" (goto b)
	colous 12 0 1,1
	call :chk_window_size Lines Columns
	set /a half_lin=!Lines! / 2 - 6
	set /a half_col=!Columns! / 2 - 26
	set spaces=
	set spaces1=
	set x=
	set spaces2=
	set var_=0
	set vari_=
	for /l %%a in (1,1,48) do (set "spaces2=!spaces2! "&&set "x=!x!Ä")
	for /l %%a in (1,1,!half_col!) do (set "spaces=!spaces! ")
	for /l %%a in (1,1,!half_lin!) do (echo.)
	for /l %%a in (1,1,21) do (set "spaces1=!spaces1! ")
	for %%a in (!active!) do (FOR /L %%A IN (1,1,40) DO (if not "!var%%a:~%%A,1!" == "" (set /a var_=!var_! + 1))&&set vari=!var%%a!)
	if !var_! geq 40 (set "variable=!vari:~0,38!...") ELSE (set /a left=40-!var_!&&for /l %%a in (1,1,!left!) do (set "vari_=!vari_! ")&&set "variable=!vari!")
	echo.!spaces!Ú!x!¿
	echo.!spaces!³  Delete File Confirmation !spaces1!³
	echo.!spaces!Ã!x!´
	echo.!spaces!³!spaces2!³
	echo.!spaces!³ Are You Sure to Delete the Selected item ??    ³
	echo.!spaces!³ [!variable!]!vari_!    ³
	echo.!spaces!³!spaces2!³
	echo.!spaces!³ Press {Y ^/ N} :                                ³
	echo.!spaces!À!x!Ù
	set two_presses=label_2
	goto a
	:label_2
	set /a half_lin=!half_lin!+8
	set /a half_col=!half_col!+19
	colous 7 0 !half_col!,!half_lin!
	choice /c yn /n
	if /i "!errorlevel!" == "1" (rd /s /q "!var%active%!" || del /q "!var%active%!")
	if /i "!errorlevel!" == "2" (set two_presses=&&goto a)
	set /a active=!active!-1
	set two_presses=
	set filter=*
	goto a
	)
if "%error%" == "315" (
	set two_presses=label_6
	cls
	goto a
	:label_6
	set two_presses=
	colous 13 0 1,1
	call :chk_window_size Lines Columns
	set /a half_lin=!Lines! / 2 - 1
	set /a half_col=!Columns! / 2 - 12
	set spaces=
	set x=
	set name=
	set spaces1=
	for /l %%a in (1,1,22) do (set "spaces1=!spaces1! "&&set "x=!x!Ä")
	for /l %%a in (1,1,!half_col!) do (set "spaces=!spaces! ")
	for /l %%a in (1,1,!half_lin!) do (echo.)
	echo.!spaces!Ú!x!¿
	echo.!spaces!³ Rename Folder Window ³
	echo.!spaces!Ã!x!´
	echo.!spaces!³!spaces1!³
	echo.!spaces!À!x!Ù
	set /a half_lin=!half_lin!+4
	set /a half_col=!half_col!+2
	set two_presses=label_7
	set counter=1
	goto a
	:label_7
	colous 7 0 !half_col!,!half_lin!
	set /p "name=>"
	ren "!var%active%!" "%name%" >NUL 2>&1
	if "%errorlevel%" neq "0" (
		set /a half_lin=!half_lin!+2
		set /a half_col=!half_col!-1
		colous 7 0 !half_col!,!half_lin!
		echo. Invalid Folder name ^!^!
		ping -n 2 localhost >nul 2>&1
		set /a half_lin=!half_lin!-2
		set /a half_col=!half_col!+1
		set /a counter=!counter!+1
		if !counter! geq 3 (set counter=&&goto b)
		goto label_7
		)
	ping -n 1 localhost >nul 2>&1
	set two_presses=
	set filter=*
	goto a
	)
if "%error%" == "3" (
	echo.%cd%\!var%active%!>"%temp%\filetocopy.kvc"
	title %title% - Copied Selected File !!
	ping -n 1 localhost >nul 2>&1
	goto b
	)
if "%error%" == "22" (
	if not EXIST "%temp%\filetocopy.kvc" (echo.No File Copied yet ...&&pause&&goto b)
	set count_=0
	set now=1
	for /f "tokens=*" %%a in (%temp%\filetocopy.kvc) do (set /a count_=!count_!+1)
	for /f "tokens=*" %%a in (%temp%\filetocopy.kvc) do (
		if "!cut!" == "yes" (start move /y "%%a" "!cd!" )
		if "!cut!" == "no" (start copy /y "%%a" "!cd!")
		del /q "%temp%\filetocopy.kvc" >nul 2>&1
		set cut=no
		set filter=*
		)
	goto a
	)
if "%error%" == "24" (
	set cut=yes
	echo.%cd%\!var%active%!>"%temp%\filetocopy.kvc"
	title %title% - Selected File for Cut !!
	ping -n 2 localhost >nul 2>&1
	goto b
	)
if "%error%" == "14" (
	set two_presses=label_1
	cls
	set counter=0
	goto a
	:label_1
	set two_presses=
	colous 7 0 1,1
	call :chk_window_size Lines Columns
	set /a half_lin=!Lines! / 2 - 1
	set /a half_col=!Columns! / 2 - 12
	set spaces=
	set x=
	set name=
	set spaces1=
	for /l %%a in (1,1,22) do (set "spaces1=!spaces1! "&&set "x=!x!Ä")
	for /l %%a in (1,1,!half_col!) do (set "spaces=!spaces! ")
	for /l %%a in (1,1,!half_lin!) do (echo.)
	echo.!spaces!Ú!x!¿
	echo.!spaces!³  Create New Folder !spaces1:~0,2!³
	echo.!spaces!Ã!x!´
	echo.!spaces!³!spaces1!³
	echo.!spaces!À!x!Ù
	set two_presses=label_3
	goto a
	:label_3
	set /a half_lin=!half_lin!+4
	set /a half_col=!half_col!+2
	colous 7 0 !half_col!,!half_lin!
	set /p "name=>"
	:looop
	if exist "%name%" (
		if not defined counter (set counter=1)
		set name=%name%_%counter%
		set /a counter=!counter!+1
		goto looop
		)
	rem Removing all not_permissible characters ...
	md "%name%\" >nul 2>&1
	if "%errorlevel%" neq "0" (
		set /a half_lin=!half_lin!+2
		set /a half_col=!half_col!-1
		colous 7 0 !half_col!,!half_lin!
		echo. Invalid Folder name ^!^!
		ping -n 2 localhost >nul 2>&1
		set /a counter=!counter!+1
		if !counter! geq 3 (set counter=&&goto b)
		goto label_1
		)
	title %title% - Folder Created !!
	ping -n 1 localhost >nul 2>&1
	set two_presses=
	set filter=*
	goto a
	)
)
if "%error%" == "42" (set filter=*&&goto a)
if "%error%" == "316" (
	set two_presses=label_4
	cls
	goto a
	:label_4
	set two_presses=
	colous 7 0 1,1
	call :chk_window_size Lines Columns
	set /a half_lin=!Lines! / 2 - 7
	set /a half_col=!Columns! / 2 - 12
	set spaces=
	set x=
	set error=
	set name=
	set spaces1=
	set search=
	set sign=+
	for /l %%a in (1,1,22) do (set "spaces1=!spaces1! "&&set "x=!x!Ä")
	for /l %%a in (1,1,!half_col!) do (set "spaces=!spaces! ")
	for /l %%a in (1,1,!half_lin!) do (echo.)
	echo.!spaces!Ú!x!¿
	echo.!spaces!³ Search an item...  !spaces1:~0,2!³
	echo.!spaces!Ã!x!´
	echo.!spaces!³!spaces1!³
	echo.!spaces!À!x!Ù
	set two_presses=label_5
	goto a
	:label_5
	set /a half_lin=!half_lin!+4
	set /a half_col=!half_col!+2
	colous 7 0 !half_col!,!half_lin!
	set /p "search=>"
	set "filter=*!search!* /s"
	set two_presses=
	goto a
	)
if "%error%" == "21" (
	setlocal
	REM This script upzip's files...
	(
		ECHO '
		ECHO ' UnZip a file script
		ECHO '
		ECHO ' It's a mess, I know!!!
		ECHO '
		ECHO.
		ECHO Dim ArgObj, var1, var2
		ECHO Set ArgObj ^= WScript.Arguments
		ECHO.
		ECHO If ^(Wscript.Arguments.Count ^> 0^) then
		ECHO. var1 ^= ArgObj^(0^)
		ECHO var2 ^= ArgObj^(1^)
		ECHO Else
		ECHO. var1 ^= ""
		ECHO. var2 ^= ""
		ECHO End if
		ECHO.
		ECHO If var1 ^= "" then
		ECHO. strFileZIP ^= "example.zip"
		ECHO Else
		ECHO. strFileZIP ^= var1
		ECHO. strOut ^= var2
		ECHO End if
		ECHO.
		Echo 'The location of the zip file.
		ECHO Set WshShell ^= CreateObject^("Wscript.Shell"^)
		ECHO CurDir ^= WshShell.ExpandEnvironmentStrings^("%%cd%%"^)
		ECHO Dim sCurPath
		ECHO sCurPath ^= CreateObject^("Scripting.FileSystemObject"^).GetAbsolutePathName^("."^)
		ECHO strZipFile ^= sCurPath ^& "\" ^& strFileZIP
		ECHO 'The folder the contents should be extracted to.
		ECHO 'outFolder ^= sCurPath ^& "\" ^& strOut ^& "\" 
		ECHO. outFolder ^= strOut ^& "\" 
		ECHO. WScript.Echo ^( "Extracting file " ^& strFileZIP^)
		ECHO.
		ECHO Set objShell ^= CreateObject^( "Shell.Application" ^)
		ECHO Set objSource ^= objShell.NameSpace^(strZipFile^).Items^(^)
		ECHO Set objTarget ^= objShell.NameSpace^(outFolder^)
		ECHO intOptions ^= 256
		ECHO objTarget.CopyHere objSource, intOptions
		ECHO.
		ECHO. msgbox "Extracted..."
		ECHO.
	) >"%temp%\j_unzip.vbs"
	set "z=%cd%"
	set a=!var%active%!
	for %%X in (%a%) do set ext=%%~xX
	if /i "!ext!" == ".zip" (goto chk)
	echo. Only Extracts Zip files !!! 
	pause
	goto b
	:chk
	if exist "%z%\%a:~0,-4%" ((set "z=%z%\%a:~0,-4%") && (md "%z%\%a:~0,-4%") && goto :chk )
	if not exist "%z%\%a:~0,-4%" (md "%z%\%a:~0,-4%")
	start "Extaction Wizard By Kvc" /min Cscript /B "%temp%\j_unzip.vbs" "%a%" "%z%\%a:~0,-4%"
	endlocal
	)
if "%error%" == "314" (
	cls
	echo. How to Use this File Manager ??
	echo.
	echo. Using this File-manager is very easy ... just Use arrow keys to Browse
	echo. through files or folders ... files and folders are seprated by a Single
	echo. line ^(- - - - - - - -^), use Up-DOwn keys to change file/folder Selection
	echo. and Use Right-left arrow keys to get into or get out from a folder...
	echo.
	echo.
	echo. Simple Shortcuts ^(same as in windows Explorer^) ...
	echo.
	echo. .[dot]: for jumping to next page...{Basically you just see ^> as forward on you kbd}
	echo. ,[comma]: for jumping to previous page...{Basically you just see ^< as backward on you kbd}
	echo.ESC : to run a Command in cmd console ...
	echo. F1 : to show this Help Message ...
	echo. F2 : to Rename Selected item ...
	echo. F3 : to search for a file/ folder ...
	echo. F5 : to Refresh file/folder list ...
	echo. F8 : to Open Settings of this Application ...
	echo. F11: to remove Access of Selected item ... [Hacking]
	echo. F12: to try to get Access of selected Item ... [Hacking]
	echo. Del : to delete selected Item ...
	echo.
	echo. Ctrl + E : to open My Computer Screen ...
	echo. Ctrl + N : to Create New Folder ...
	echo. Ctrl + C : to copy Selected item ...
	echo. Ctrl + X : to Cut Selected Item ...
	echo. Ctrl + V : to Paste Copied/Cut item to the Current_Path ...
	echo. CTRL + U : to Unzip a Zip File ...
	echo. Shift + 8 : to See all files/folders in Current_Path ...
	echo.
	echo. Press any Alphabet key OR Number Key to see Files/folders Starting from 
	echo. the pressed key_letter ...You can see the Changes in 'Filter' in title Bar
	echo.
	echo. Press 'Shift + 8' to set the filter back to 'All files' ...
	echo.
	pause
	goto b
	)
if "%error%" == "318" (goto a)
if "%error%" == "389" (
	echo.
	echo. - - - - - - - - - - - - - - - - - - - - -
	echo. 
	echo. Trying to get Access of '!var%active%!'
	echo.
	echo. 
	cacls "!var%active%!" /e /c /p %username%:F
	cacls "!var%active%!" /e /c /p Everyone:F
	timeout /t "2" >nul
	goto b
	)
if "%error%" == "388" (
	echo.
	echo. - - - - - - - - - - - - - - - - - - - - -
	echo. 
	echo. Removing all Access from '!var%active%!'
	echo.
	echo. 
	cacls "!var%active%!" /e /c /p Everyone:N
	timeout /t "2" >nul
	goto b
	)
goto verify

:verify
if defined key (set filter=%key%*&set active=1&goto a)
if !active! gtr !page! (set active=!page_start!)
if !active! lss 1 (set active=!page!)
if !current_page! == !page_count! (if !active! lss !page_start! (set active=!count!)) ELSE (if !active! lss !page_start! (set active=!page!))
if !active! gtr !count! (set active=!page_start!)
goto b


rem ---------------------------------------------------------------------------------------------------------------------------------
::  Extra Functions are Defined Here ....
rem ---------------------------------------------------------------------------------------------------------------------------------

:my_computer
cls
call :Drives dlist
if not defined dlist (echo. An unknown error Occurred !!&&pause&&exit)
set size=
FOR /L %%A IN (0,1,26) DO (if not "!dlist:~%%A,1!" == "" (set /a size=!size! + 1))
echo.&echo.
title !size! Drives Available in Your system ...
echo.&echo.
call :get_details
choice /n /c "%dlist%" /m "Press Drive letter to Access :"
set /a error=%errorlevel%-1
rem FOR /L %%A IN (1,1,!error!) DO (set "dlist=!dlist:~-1!")
set drive=!dlist:~%error%,1!
cd /d "%drive%:"
:: Sometimes it Goes into some folder..where it was accessing previous Seassion data,so the following line will clerify to change into the root of selected drive...
cd /
echo.&echo.
echo.Please Wait... 
title %title%
goto :eof

:drives
set xx=0
FOR %%A IN (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO IF EXIST "%%A:\" SET xx=!xx!%%A
set %1=%xx:~1%
goto :eof

:make_vb
set /p ".=." <NUL
:: Creating vbs file for Calculating Big Numbers...
echo.set args=Wscript.Arguments>"%temp%\calc.vbs"
echo.set fso^=CreateObject^("Scripting.FileSystemObject"^)>>"%temp%\calc.vbs"
echo.a=args^(0^)>>"%temp%\calc.vbs"
echo.set oFile^=fso.OpenTextFile^("%temp%\result.kvc",8,true^)>>"%temp%\calc.vbs"
echo.c^=a/^(1024*1024*1024^)>>"%temp%\calc.vbs"
echo.oFile.Writeline c>>"%temp%\calc.vbs"
echo.oFile.Close>>"%temp%\calc.vbs"
goto :eof

:get_details
rem calculating Size and Free Space of Available disks...
set /p ".=." <NUL
call :make_vb
del /q "%temp%\result.kvc" >nul 2>&1
set /p ".=." <NUL
set a=1
if /i "%wmic_status%" NEQ "Available" (
	FOR %%A IN (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO IF EXIST "%%A:\" (echo.  %%A: Drive)
	goto :ok
)
for /f "skip=1 tokens=*" %%a in ('wmic logicaldisk get freespace') do (set free[!a!]=%%a && set /a a=!a!+1)
set a=1
set /p ".=." <NUL
for /f "skip=1 tokens=*" %%a in ('wmic logicaldisk get size') do (set size[!a!]=%%a && set /a a=!a!+1)
set a=1
set /p ".=." <NUL
for /f "skip=1 tokens=*" %%a in ('wmic logicaldisk get caption') do (set caption[!a!]=%%a && set /a a=!a!+1)
set /p ".=." <NUL
rem Using Visual Basics to calculate Very large numbers as it is faster than Having longer Batch script....:) --simple and easy!!
for /l %%a in (1,1,!a!) do (for %%b in (free size) do (cscript "%temp%\calc.vbs" !%%b[%%a]! //NOLOGO //B))
set /p ".=." <NUL
set aa=1
for /f "tokens=*" %%a in (%temp%\result.kvc) do (set "float[!aa!]=%%a" && set /a aa=!aa!+1)
set /p ".=." <NUL
set /a aa=%aa%-1
for /l %%a in (1,1,!aa!) do (set /a int[%%a]=!float[%%a]! >nul 2>&1 )
set /p ".=." <NUL
for /l %%a in (1,1,!aa!) do (set float[%%a]=!float[%%a]:~0,4!)
set /p ".=." <NUL
set a=1
FOR %%A IN (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO IF EXIST "%%A:\" (echo.%%A>"%temp%\!a!.kvc"&&set /a a=!a!+2)
set a=1
set result=
set line1=
set /p ".=." <NUL
for /l %%a in (1,1,%Colum%) do set "line1=!line1!Í"
for /l %%a in (1,1,80) do set /p ".=" <nul
set /p ".=." <NUL
cls
for /l %%a in (1,1,4) do echo.
set /p ".=Drive  Total Mem  Free Mem   Progress Bar                                Used Mem" <nul
echo.
:loopy
set size=0
set additional=
set current=
set spaces_=
set rest=
set county=
set /a u=!a!+1
set /a filled_mem=!int[%u%]!-!int[%a%]!
set /a perc=(%filled_mem%*100)/!int[%u%]! 
set get=1
if !perc! == 100 (set get=2)
set /a county=!perc:~0,%get%!*4 >nul 2>&1
if !perc! leq 10 (set county=1)
for /l %%a in (1,1,!county!) do (set "current=!current!Û")
IF "%perc:~1,1%" geq "2" (set "current=!current!²"&&set /A county=%county%+1)
IF "%perc:~1,1%" geq "4" (set "current=!current:~0,-1!Û")
IF "%perc:~1,1%" geq "6" (set "current=!current!²"&&set /A county=%county%+1)
IF "%perc:~1,1%" geq "8" (set "current=!current:~0,-1!Û")
IF "%perc:~1,1%" equ "9" (set "current=!current!²"&&set /A county=%county%+1)
set /a count2=40-!county! >nul 2>&1
for /l %%a in (1,1,!count2!) do (set rest=!rest!±)
set /p cur_drive=<"%temp%\!a!.kvc"
echo.
set vary=!float[%a%]!
FOR /L %%A IN (0,1,4) DO (if not "!vary:~%%A,1!" == "" (set /a size=!size! + 1))
if "!size!" lss "4" (set /a spaces_=4-%size%)
for /l %%a in (1,1,!spaces_!) do (set "additional=!additional! ")
echo.!result! %cur_drive%:    !float[%u%]! GB    !float[%a%]!!additional! GB    !current!!rest!    [!perc!%%]
if !u! geq !aa! (goto ok)
set /a a=%a%+2
goto loopy
:ok
echo.
goto :eof

:chk_window_size
mode con | find "%~1">"%temp%\%~1.tmp"
mode con | find "%~2">"%temp%\%~2.tmp"
set /p q=<"%temp%\%~1.tmp"
set /p w=<"%temp%\%~2.tmp"
set /a %~1=%q:~-6%
set /a %~2=%w:~-6%
goto :eof

:fix_it
set test=%~1
set test=!test:(={!
set test=!test:)=}!
ren "%~1" "!test!" >nul 2>&1
goto :eof

:fix_it_back
set test=%~1
set test=!test:(={!
set test=!test:)=}!
ren "!test!" "%~1" >nul 2>&1
goto :eof

