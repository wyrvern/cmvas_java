@echo off
echo "|----------------------|"
echo "|compile :             |"
echo "|----------------------|"
echo "|1. shellx     [java]  |"
echo "|2. update             |"
echo "|3. clean build        |"
echo "|4. exit               |"
echo "|----------------------|"
choice
if errorlevel 4 goto EXIT
if errorlevel 3 goto CLEAN
if errorlevel 2 goto UPDATE
if errorlevel 1 goto SHELLX

:SHELLX
echo.
echo Compiling...
echo.
jvc.exe /nowarn /nomessage -x- -d . *.java
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:UPDATE
echo.
echo Updating...
echo.

@copy lib\libshellx\*.class ..\..\..\win32\jInstaller\lib\libshellx\
@copy lib\libshellx\*.class    ..\..\libsys\lib\libshellx\
@copy *.java                ..\..\..\win32\jInstaller\lib\libshellx\
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CLEAN
echo.
echo Cleaning...
echo.
@echo off
del lib\libshellx\*.class
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