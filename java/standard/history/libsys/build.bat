@echo off
echo "|----------------------|"
echo "|compile file :        |"
echo "|----------------------|"
echo "|1. libsys [java]      |"
echo "|2. update             |"
echo "|3. clean              |"
echo "|4. exit               |"
echo "|----------------------|"
choice
if errorlevel 4 goto EXIT
if errorlevel 3 goto CLEAN
if errorlevel 2 goto UPDATE
if errorlevel 1 goto LIBSYS

:LIBSYS
echo.
echo.------------------------*
echo.Compiling...
echo.------------------------*
echo.

   @del sysFactory.class
   @jvc.exe /nowarn /nomessage -x- -d . sysFactory.java

rem   @jexegen /W /out:libsys.exe /main:lib.libsys.sysFactory /base:. lib\libsys\*.class
   @jexegen    /out:libsys.exe /main:lib.libsys.sysFactory /base:. lib\libsys\*.class
   @jexegen /D /out:sysFactory.dll /main:lib.libsys.sysFactory /base:. lib\libsys\*.class

if not errorlevel 0 goto ERROR
if     errorlevel 0 goto EXIT

:UPDATE
echo.
echo.------------------------*
echo.Updating...
echo.------------------------*
echo.

   @copy lib\libsys\*.class ..\..\win32\jInstaller\lib\libsys\
   @copy *.java             ..\..\win32\jInstaller\lib\libsys\
   @copy lib\libsys\*.class ..\types\lib\libsys\
   @copy lib\libsys\*.class ..\crypt\nkey\lib\libsys\

   @copy lib\libsys\*.class ..\libstd\lib\libsys\
   @copy lib\libsys\*.class ..\libcrypt\lib\libsys\
   @copy lib\libsys\*.class ..\libmail\lib\libsys\
   @copy lib\libsys\*.class ..\libio\lib\libsys\
   @copy lib\libsys\*.class ..\libstr\lib\libsys\

if not errorlevel 0 goto ERROR
if     errorlevel 0 goto EXIT

:CLEAN
echo.
echo.------------------------*
echo.Cleaning...
echo.------------------------*
echo.

   @del strFactory.class
   @del strFactory.dll
   @del strFactory.exe

if not errorlevel 0 goto ERROR
if     errorlevel 0 goto EXIT
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