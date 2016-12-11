@echo off
echo "|----------------------|"
echo "|compile :             |"
echo "|----------------------|"
echo "|1. shell    [java]    |"
echo "|2. type-lib [idl]     |"
echo "|3. update             |"
echo "|4. clean build        |"
echo "|5. exit               |"
echo "|----------------------|"
choice
if errorlevel 5 goto EXIT
if errorlevel 4 goto CLEAN
if errorlevel 3 goto UPDATE
if errorlevel 2 goto IDL
if errorlevel 1 goto SHELL

:SHELL
echo.
echo Compiling...
echo.
jvc.exe /nowarn /nomessage -x- -d . *.java
rem jexegen /D /out:jshell.dll /main:jShell /base:. java\za\jshell\*.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:IDL
echo.
echo Compiling...
echo.
midl.exe /Oicf /nologo jshell.idl
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:UPDATE
echo.
echo Updating...
echo.
@copy lib\libshell\*.class ..\..\..\win32\jInstaller\lib\libshell\
@copy lib\libshell\*.class    ..\..\libsys\lib\libshell\
@copy *.java               ..\..\..\win32\jInstaller\lib\libshell\
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CLEAN
echo.
echo Cleaning...
echo.
@echo off
del lib\shell\*.class
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