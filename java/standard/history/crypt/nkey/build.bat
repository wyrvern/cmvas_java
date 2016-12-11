@echo off
echo "|----------------------|"
echo "|compile file :        |"
echo "|----------------------|"
echo "|1. nkey [java]        |"
echo "|2. update proc        |"
echo "|3. clean              |"
echo "|4. exit               |"
echo "|----------------------|"
choice
if errorlevel 4 goto EXIT
if errorlevel 3 goto CLEAN
if errorlevel 2 goto UPDATE
if errorlevel 1 goto NKEY

:NKEY
echo.
echo Compiling...
echo.
del nkey.class
jvc.exe /nowarn /nomessage -x- -d . nkey.java
rem jexegen /D /out:nkey.dll /main:nkey /base:. *.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:UPDATE
echo.
echo Updating...
echo.
@copy strlib.class ..\smtplib\
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT
pause

:CLEAN
echo.
echo Cleaning...
echo.
del nkey.class
del nkey.dll
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT
pause

:ERROR
echo.
echo There was an error compiling.
echo Exiting...
echo.
pause

:EXIT
echo.
echo Done.
echo.