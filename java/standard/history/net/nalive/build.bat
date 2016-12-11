@echo off
echo "|----------------------|"
echo "|compile :             |"
echo "|----------------------|"
echo "|1. nalive [java]      |"
echo "|2. clean build        |"
echo "|3. exit               |"
echo "|----------------------|"
choice
if errorlevel 3 goto EXIT
if errorlevel 2 goto CLEAN
if errorlevel 1 goto NALIVE

:NALIVE
del nalive.exe
del nalive.class
jvc.exe /nowarn /nomessage -x- -d . nalive.java smtplib.java
jexegen /out:nalive.exe /main:nalive /base:. *.class
del *.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CLEAN
@echo off
del *.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:ERROR
echo.
echo There was an error compiling.
echo Exiting...

:EXIT
echo.
echo Done.
