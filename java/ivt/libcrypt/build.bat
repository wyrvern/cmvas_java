@echo off
echo "|----------------------|"
echo "|compile file :        |"
echo "|----------------------|"
echo "|1. libcrypt [java]    |"
echo "|2. update             |"
echo "|3. clean              |"
echo "|4. exit               |"
echo "|----------------------|"
choice
if errorlevel 4 goto EXIT
if errorlevel 3 goto CLEAN
if errorlevel 2 goto UPDATE
if errorlevel 1 goto LIBCRYPT

:LIBCRYPT
echo.
echo Compiling...
echo.
del cryptFactory.class
jvc.exe    /nowarn /nomessage -x- -d . cryptFactory.java

jexegen    /out:cryptFactory.exe /main:lib.libcrypt.cryptFactory /base:. lib\libcrypt\*.class
jexegen /D /out:cryptFactory.dll /main:lib.libcrypt.cryptFactory /base:. lib\libcrypt\*.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:UPDATE
echo.
echo Updating...
echo.
@copy lib\libcrypt\*.class ..\..\win32\jInstaller\lib\libcrypt\
@copy *.java               ..\..\win32\jInstaller\lib\libcrypt\
@copy lib\libcrypt\*.class ..\types\lib\libcrypt\
@copy lib\libcrypt\*.class ..\crypt\nkey\lib\libcrypt\

@copy lib\libcrypt\*.class ..\libstd\lib\libcrypt\
@copy lib\libcrypt\*.class ..\libio\lib\libcrypt\
@copy lib\libcrypt\*.class ..\libmail\lib\libcrypt\
@copy lib\libcrypt\*.class ..\libstr\lib\libcrypt\
@copy lib\libcrypt\*.class ..\libsys\lib\libcrypt\
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CLEAN
echo.
echo Cleaning...
echo.
del cryptFactory.class
del cryptFactory.dll
del cryptFactory.exe
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