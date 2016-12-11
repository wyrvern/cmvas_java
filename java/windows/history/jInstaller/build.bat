@echo off
echo "|----------------------|"
echo "|compile :             |"
echo "|----------------------|"
echo "|1. jInstaller [java]  |"
echo "|2. clean build        |"
echo "|3. exit               |"
echo "|----------------------|"
choice
if errorlevel 3 goto EXIT
if errorlevel 2 goto CLEAN
if errorlevel 1 goto RC

:RC
echo.
echo.------------------------*
echo.Compiling resources...
echo.------------------------*
echo.

       rc /fo"jInstaller.res" jInstaller.rc

if not errorlevel 0 goto ERROR
if     errorlevel 0 goto JINSTALLER

:JINSTALLER
echo.
echo.------------------------*
echo.Compiling...
echo.------------------------*
echo.

if exist     *.class    (del        *.class) else echo *.class        missing
if exist     libreg.exe (del jinstaller.exe) else echo jinstaller.exe missing

        jvc.exe /nowarn /cp:p lib\libcrypt\ /nomessage -x- -d . jInstaller.java jRemove.java jSetup.java cMain.java
	jexegen /w /out:jInstaller.exe /main:jInstaller /base:. cMain.class jSetup.class jRemove.class jInstaller.class jInstaller.resources jSetup.resources jRemove.resources jInstaller.res lib\libcrypt\*.class lib\libio\*.class lib\libshell\*.class lib\libshellx\*.class lib\libstd\*.class lib\libstr\*.class lib\libsys\*.class

if not errorlevel 0 goto ERROR
if     errorlevel 0 goto EXIT

:CLEAN
echo.
echo.------------------------*
echo.Cleaning...
echo.------------------------*
echo.

if exist     *.class    (del        *.class) else echo *.class        missing
if exist     *.dat      (del          *.dat) else echo *.dat          missing
if exist     libreg.exe (del jinstaller.exe) else echo jinstaller.exe missing

if not errorlevel 0 goto ERROR
if     errorlevel 0 goto EXIT

:ERROR
echo.
echo There was an error compiling.
echo Exiting...
echo.
pause

:EXIT

if exist     *.class    (del        *.class) else echo *.class        missing

echo.
echo Done.
echo.