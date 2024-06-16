@Echo off
SetLocal EnableDelayedExpansion

REM Loading Function v.1.0 By Kvc - Because, we Don't want to code alot for a Simple GUI output.
REM This function is created by Kvc - at 15.9.2017 - 12:19 PM

REM Get More Extensions Like this @ www.thebateam.org - The BatchProgramming Blog

REM Setting-up version of the program
Set ver=1.0

REM Checking for various inputs to the function...
IF /i "%~1" == "/h" (Goto :Help)
IF /i "%~1" == "/?" (Goto :Help)
IF /i "%~1" == "-h" (Goto :Help)
IF /i "%~1" == "Help" (Goto :Help)
IF /i "%~1" == "ver" (Echo.%ver% && Goto :EOF)

IF /i "%~1" == "" (Goto :Help)
IF /i "%~2" == "" (Goto :Help)
IF /i "%~3" == "" (Goto :Help)
IF /i "%~4" == "" (Goto :Help)
IF /i "%~5" == "" (Goto :Help)
IF /i "%~6" == "" (Goto :Help)
IF /i "%~7" == "" (Goto :Help)
IF /i "%~8" == "" (Goto :Help)

:Main
REM Starting the Main Function here...
REM Giving Names to variables...

Set _X=%~1
Set _Y=%~2
Set _Len=%~3
Set _Color=%~4
Set _Char=%~5
Set _Border=%~6
Set _Type=%~7
Set _Value=%~8

REM Adjusting for Given value... Special Case...
Set /A "_Value=%_Value%/1"
Set "_Value=%_Value:-=%"
IF %_Value% GTR 100 (Set /A "_Value=%_Value%%%100")

REM Calculating relative length of the progress-bar, w.r.t. the Given length of progress-bar.
REM Finding 'Scaling Factor' for progress-bar...
REM Handiling 'divide by 0' error...
IF /I "%_Len%" == "0" (Set _Len=1)
Set /A _Factor= 100 / %_Len% 

IF /I "%_Factor%" == "0" (Set _Factor=1)
Set /A _Actual_len= %_Value% / %_Factor% 

REM Resetting 'Len' variable as per the required size...
Set /A _Len= 100 / %_Factor%

REM Getting Current CMD Situation / size...
Call GetDim _Rows _Columns

REM Dealing with some logical errors... those can ruin the function's output...
Set /A _Net_Length=%_X%+%_Len%

If %_Net_Length% GEQ %_Columns% (Echo. Progress Bar is Longer than the console itself... & Pause & Goto :End)
If %_Y% GEQ %_Rows% (Echo. Progress Bar is out of the Console's View ^(reduce 'Y'^)... & Pause & Goto :End)

IF /I "%_Type%" NEQ "Fill" (IF "%_Type%" NEQ "NoFill" (Set _Type=Fill))

REM Setting-up 'text' location...
Set /A "_Text_X=%_X% + (%_Len% / 2)"
Set /A _Text_Y=%_Y% + 1

REM Synchronizing the text and progress-bar coloring...
Set /A _Collision_pt_Text=%_Text_X%
Set /A _Collision_pt_bar=%_Actual_len% + 4

IF %_Collision_pt_bar% LEQ %_Collision_pt_Text% (Set _Text_color=0%_Color:~1,1%) ELSE (Set _Text_color=%_Color:~1,1%0)

REM Displaying GUI on Console...
REM Setting-up Layout of the Loading Bar in Console screen...
Set /A _Box_Len=%_Len% + 3
Set "_Value=%_Value%%%"

REM Calculating progress-bar type
Set /A _Progress_bar_X=%_X%+1
Set /A _Progress_bar_Y=%_Y%+1

IF /I "%_Type%" == "NoFill" (
	Set /A _Progress_bar_X=%_X% + %_Actual_len% + 1
	Set /A _Progress_bar_Y= %_Y% + 1
	
	Set _Progress_bar=%_Char%
	Set _Value=
	) ELSE (
	Set _Progress_bar=
	For /L %%A in (1,1,%_Actual_len%) Do (Set "_Progress_bar=!_Progress_bar!!_Char!")
	)


Call Box %_X% %_Y% 3 %_Box_Len% - - 0%_Color:~1,1% %_Border% _Var_Box
Batbox %_Var_Box% /g %_Progress_bar_X% %_Progress_bar_Y% /c 0x%_Color% /d "%_Progress_bar%" /g %_Text_X% %_Text_Y% /c 0x%_Text_color% /d "%_Value%" /g 0 0 /c 0x07
Goto :End

:Help
Echo.
Echo. This function helps in Adding a little GUI effect into your batch program...
echo. It Prints simple Loading-bar on cmd console at specified Co-ordinates :]
Echo. You need to provide a numerical value - which the Loading fucntion will display
Echo. Of printing table on CMD console. [See Example @ Bottom]
Echo.
echo.
echo. Syntax: call Loading [X] [Y] [Len] [Color] [Char] [Border] [Type] [value]
echo. Syntax: call Loading [help ^| /^? ^| -h ^| -help]
echo. Syntax: call Loading ver
echo.
echo. Where:-
Echo. X 		= X Co-ordinate of Top-Left corner of the Loading-bar
Echo. Y 		= Y Ordinate of Top-Left corner of the Loading-bar
Echo. Len 		= Length of the Loading-bar on Cmd Console [in Chars]
Echo. Color		= Color of the Bar's Character [Hex Code: 0F,08,07 etc.]
Echo. Char 		= Character to show as a loading increment element.
Echo. Border	= The Border type to select for the Loading's display. [0 to 4]
Echo. Type		= Which type of Loading-bar you need? ['Fill' or 'NoFill']
Echo. Value		= The value in numbers - which Loading-bar will display in GUI
echo. ver		= Version of Loading function
Echo.
Echo.
Echo. Example:-
Echo. Call Loading 3 23 50 aa x 1 Fill 95
Echo.
echo. This version %_Ver% of Loading function contains much more GUI Capabilities.
echo. As it uses batbox.exe and calls it only once at the end of calculation...
Echo. For the most efficient output.
Echo.
echo. Created By "Karanveer Chouhan" aka 'Kvc'
echo. Visit www.thebateam.org for more...
echo. #TheBATeam
Goto :End

:End
Goto :EOF