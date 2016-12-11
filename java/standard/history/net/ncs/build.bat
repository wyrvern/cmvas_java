@echo off
echo "|----------------------|"
echo "|compile file :        |"
echo "|----------------------|"
echo "|1. nc [java]          |"
echo "|2. ns [java]          |"
echo "|3. clean              |"
echo "|4. exit               |"
echo "|----------------------|"
choice
if errorlevel 4 goto EXIT
if errorlevel 3 goto CLEAN
if errorlevel 2 goto NS
if errorlevel 1 goto NC

:NC
echo.
echo Compiling...
echo.
jvc.exe /nowarn /nomessage -x- -d . nc.java
jexegen /out:nc.exe /main:nc /base:. nc.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:NS
echo.
echo Compiling...
echo.
jvc.exe /nowarn /nomessage -x- -d . ns.java
jexegen /out:ns.exe /main:ns /base:. ns.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CLEAN
echo.
echo Cleaning...
echo.
del nc.exe
del ns.exe
del *.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:ERROR
echo.
echo There was an error compiling.
echo Exiting...
echo.
pause

:EXIT
echo.
del *.class
echo Deleting classes...
echo Done.
echo.