@echo off
echo "|----------------------|"
echo "|compile :             |"
echo "|----------------------|"
echo "|1. libnet [java]      |"
echo "|2. clean build        |"
echo "|3. exit               |"
echo "|----------------------|"
choice
if errorlevel 3 goto EXIT
if errorlevel 2 goto CLEAN
if errorlevel 1 goto LIBNET

:LIBNET
echo.
echo.------------------------*
echo.Compiling...
echo.------------------------*
echo.

del *.class
jvc.exe /nomessage -x- -d . libnet.java
jexegen /out:libnet.exe /main:libnet /base:. libnet.class

if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CLEAN
echo.
echo.------------------------*
echo.Cleaning...
echo.------------------------*
echo.

del *.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:ERROR
echo.
echo There was an error compiling.
echo Exiting...

:EXIT
echo.
echo.------------------------*
echo.Backup up...
echo.------------------------*
echo.
backup