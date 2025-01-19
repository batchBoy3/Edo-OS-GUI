@echo off
for /f "tokens=1,2 delims==" %%u in (user1name.usr) do (
set %%u==usercheck
)
echo %usercheck%
pause