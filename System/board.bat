@echo off

set /a "_CLS=%1, _COLS=_CLS+1, _LNS=%2, _LINS=_LNS+1"
set "wall=%3"
set "chr=%4"
set "charsp=%5"
set "portal=%6"
set "popen=%7"
set "char=%8"
set "stats=%9"
 

:begin
REM Initialize "top" variable just once, before the main FOR loop
set "top="
for /l %%w in (1 1 %_COLS%) do (
   set "top=%wall%!top!"
)

if %stats%==Draw (
	for /l %%h in (1 1 %_LINS%) do (
	   for /l %%w in (1 1 %_COLS%) do (
	      If NOT defined %%w@%%h (set "%%w@%%h=%chr%")
	   )
	)
) Else (
	for /l %%h in (1 1 %_LINS%) do (
	   for /l %%w in (1 1 %_COLS%) do (
	      set "%%w@%%h=%chr%"
	   )
	)
)

for /l %%h in (1 1 %_LINS%) do (

   if %%h == 1 echo %wall%%top%%wall%

   set "row="
   for /l %%w in (1 1 %_COLS%) do (
      set "row=!row!!%%w@%%h!"
   )
   set "%charsp%=%char%"
   echo %wall%!row!%wall%
   If %charsp%==%portal% (set "%popen%=%char%")

   IF %%h EQU %_LINS% ECHO %wall%%top%%wall%
)
goto:eof