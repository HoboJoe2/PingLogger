@echo off
setlocal enabledelayedexpansion

echo Command is running. Press CTRL+C to quit.

FOR /L %%i IN () DO (

   set pingreturn=
   FOR /F "delims=" %%p IN ('ping -n 1 www.google.com.au') DO SET pingreturn=%%p

   set curtime=
   FOR /F "delims=" %%t IN ('powershell -NoLogo -NonInteractive -OutputFormat Text -Command "[DateTime]::Now.ToString(\"yyyy-MM-dd HH:mm:ss\")"') DO SET curtime=%%t

   echo !curtime!: >> ping.log
   echo !pingreturn! >> ping.log

   timeout 10 /NOBREAK > NUL

)
