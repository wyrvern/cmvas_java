@echo off
echo "|----------------------|"
echo "|compile file :        |"
echo "|----------------------|"
echo "|1. intFace [java]     |"
echo "|2. clean              |"
echo "|3. exit               |"
echo "|----------------------|"
choice
if errorlevel 3 goto EXIT
if errorlevel 2 goto CLEAN
if errorlevel 1 goto INT

:INT
del intFace.exe
del intFace.class
del com\za\jshell\*.class
rem jvc.exe /nowarn /nomessage -x- -d . com\za\jshell\IShellLinkA.java
jvc.exe /nowarn /nomessage -x- -d . intFace.java
jexegen /out:intFace.exe /main:intFace /base:. *.class
del intFace.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CLEAN
del intFace.exe
del intFace.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:ERROR
echo.
echo There was an error compiling.
echo Exiting...

:EXIT
echo.
echo Done.
