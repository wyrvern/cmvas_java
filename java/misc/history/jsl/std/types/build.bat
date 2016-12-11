@echo off
echo "|----------------------|"
echo "|compile :             |"
echo "|----------------------|"
echo "|1. types   [jsl]      |"
echo "|2. clean build        |"
echo "|3. exit               |"
echo "|----------------------|"
choice
if errorlevel 3 goto EXIT
if errorlevel 2 goto CLEAN
if errorlevel 1 goto TYPES

:TYPES
echo.
echo Compiling...
echo.
jc /r:../../bin/strlib.dll /out:types.exe /target:exe types.jsl
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT


:CLEAN
echo.
echo Cleaning...
echo.
@echo off
del types.exe
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
echo Done.
echo.