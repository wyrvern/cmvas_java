@echo off
echo "|----------------------|"
echo "|compile file :        |"
echo "|----------------------|"
echo "|1. libio [java]       |"
echo "|2. update             |"
echo "|3. clean              |"
echo "|4. exit               |"
echo "|----------------------|"
choice
if errorlevel 4 goto EXIT
if errorlevel 3 goto CLEAN
if errorlevel 2 goto UPDATE
if errorlevel 1 goto LIBIO

:LIBIO
echo.
echo Compiling...
echo.
del ioFactory.class
jvc.exe    /nowarn /nomessage -x- -d . ioFactory.java

jexegen    /out:ioFactory.exe /main:lib.libio.ioFactory /base:. lib\libio\*.class
jexegen /D /out:ioFactory.dll /main:lib.libio.ioFactory /base:. lib\libio\*.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:UPDATE
echo.
echo Updating...
echo.
@copy lib\libio\*.class ..\..\win32\jInstaller\lib\libio\
@copy *.java            ..\..\win32\jInstaller\lib\libio\
@copy lib\libio\*.class ..\types\lib\libio\
@copy lib\libio\*.class ..\crypt\nkey\lib\libio\

@copy lib\libio\*.class ..\libstd\lib\libio\
@copy lib\libio\*.class ..\libcrypt\lib\libio\
@copy lib\libio\*.class ..\libmail\lib\libio\
@copy lib\libio\*.class ..\libstr\lib\libio\
@copy lib\libio\*.class ..\libsys\lib\libio\
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CLEAN
echo.
echo Cleaning...
echo.
del ioFactory.class
del ioFactory.dll
del ioFactory.exe
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