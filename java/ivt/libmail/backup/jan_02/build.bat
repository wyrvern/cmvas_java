@echo off
echo "|----------------------|"
echo "|compile file :        |"
echo "|----------------------|"
echo "|1. smtpMail [java]    |"
echo "|2. exit               |"
echo "|----------------------|"
choice
if errorlevel 2 goto EXIT
if errorlevel 1 goto SMTP

:SMTP
del smtplib.exe
del *.class
jvc.exe /nowarn /nomessage -x- -d . smtpMail.java strlib.java headers.java attach.java encoder.java
jexegen /out:smtpMail.exe /main:smtpMail /base:. *.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:ERROR
echo.
echo There was an error compiling.
echo Exiting...

:EXIT
echo.
echo Done.
