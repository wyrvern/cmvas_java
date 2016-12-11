@echo off
echo "|----------------------|"
echo "|compile file :        |"
echo "|----------------------|"
echo "|1. libstd [java]      |"
echo "|2. update             |"
echo "|3. clean              |"
echo "|4. exit               |"
echo "|----------------------|"
choice
if errorlevel 4 goto EXIT
if errorlevel 3 goto CLEAN
if errorlevel 2 goto UPDATE
if errorlevel 1 goto LIBSTD

:LIBSTD
echo.
echo Compiling...
echo.
del stdFactory.class
jvc.exe    /nowarn /nomessage -x- -d . stdFactory.java

jexegen    /out:stdFactory.exe /main:lib.libstd.stdFactory /base:. lib\libstd\*.class
jexegen /D /out:stdFactory.dll /main:lib.libstd.stdFactory /base:. lib\libstd\*.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:UPDATE
echo.
echo Updating...
echo.
@copy lib\libstd\*.class ..\..\win32\jInstaller\lib\libstd\
@copy *.java             ..\..\win32\jInstaller\lib\libstd\
@copy lib\libstd\*.class ..\types\lib\libstd\
@copy lib\libstd\*.class ..\crypt\nkey\lib\libstd\

@copy lib\libstd\*.class ..\libstr\lib\libstd\
@copy lib\libstd\*.class ..\libcrypt\lib\libstd\
@copy lib\libstd\*.class ..\libmail\lib\libstd\
@copy lib\libstd\*.class ..\libio\lib\libstd\
@copy lib\libstd\*.class ..\libsys\lib\libstd\
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CLEAN
echo.
echo Cleaning...
echo.
del stdFactory.class
del stdFactory.dll
del stdFactory.exe
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