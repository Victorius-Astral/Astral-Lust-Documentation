@ECHO OFF
:loop
start hide_build.vbs
echo Building..
ping 127.0.0.1 -n 3 > nul
start refresh_tab.vbs
echo Built
ping 127.0.0.1 -n 2 > nul
cls
goto loop