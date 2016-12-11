@echo off
echo "|----------------------|"
echo "|compile file :        |"
echo "|----------------------|"
echo "|1. libmail [java]     |"
echo "|2. exit               |"
echo "|----------------------|"
choice
if errorlevel 2 goto EXIT
if errorlevel 1 goto MAIL

:MAIL
del smtplib.exe
del *.class
jvc.exe /nowarn /nomessage -x- -d . libmail.java headers.java attach.java encoder.java
jexegen /out:libmail.exe /main:libmail /base:. *.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:ERROR
echo.
echo There was an error compiling.
echo Exiting...

:EXIT
echo.
echo Done.
