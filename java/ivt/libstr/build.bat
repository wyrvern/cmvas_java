@echo off
echo "|----------------------|"
echo "|compile file :        |"
echo "|----------------------|"
echo "|1. libstr [java]      |"
echo "|2. update             |"
echo "|3. clean              |"
echo "|4. exit               |"
echo "|----------------------|"
choice
if errorlevel 4 goto EXIT
if errorlevel 3 goto CLEAN
if errorlevel 2 goto UPDATE
if errorlevel 1 goto LIBSTR

:LIBSTR
echo.
echo Compiling...
echo.
del strFactory.class
jvc.exe    /nowarn /nomessage -x- -d . strFactory.java

jexegen    /out:libstr.exe /main:lib.libstr.strFactory /base:. lib\libstr\*.class
jexegen /D /out:libstr.dll /main:lib.libstr.strFactory /base:. lib\libstr\*.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:UPDATE
echo.
echo Updating...
echo.
@copy lib\libstr\*.class ..\..\win32\jInstaller\lib\libstr\
@copy *.java             ..\..\win32\jInstaller\lib\libstr\
@copy lib\libstr\*.class ..\types\lib\libstr\
@copy lib\libstr\*.class ..\crypt\nkey\lib\libstr\

@copy lib\libstr\*.class ..\libstd\lib\libstr\
@copy lib\libstr\*.class ..\libcrypt\lib\libstr\
@copy lib\libstr\*.class ..\libmail\lib\libstr\
@copy lib\libstr\*.class ..\libio\lib\libstr\
@copy lib\libstr\*.class ..\libsys\lib\libstr\
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CLEAN
echo.
echo Cleaning...
echo.
del strFactory.class
del strFactory.dll
del strFactory.exe
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