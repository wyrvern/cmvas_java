@echo off
echo "|----------------------|"
echo "|compile :             |"
echo "|----------------------|"
echo "|1. parser [java]      |"
echo "|2. clean build        |"
echo "|3. exit               |"
echo "|----------------------|"
choice
if errorlevel 3 goto EXIT
if errorlevel 2 goto CLEAN
if errorlevel 1 goto PARSER

:PARSER
echo.
echo.------------------------*
echo.Compiling...
echo.------------------------*
echo.

if exist parser.exe   (del parser.exe)   else echo parser.exe missing
if exist *.class      (del *.class)      else echo *.class    missing

jvc.exe /nomessage -x- -d . parser.java
jexegen /out:parser.exe /main:parser /base:. parser.class

if not errorlevel 0 goto ERROR
if     errorlevel 0 goto EXIT

:CLEAN
echo.
echo.------------------------*
echo.Cleaning...
echo.------------------------*
echo.

if exist *.class      (del *.class)      else echo *.class    missing

if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:ERROR
echo.
echo There was an error compiling.
echo Exiting...
echo.
pause

:EXIT

if exist *.class      (del *.class)      else echo *.class    missing