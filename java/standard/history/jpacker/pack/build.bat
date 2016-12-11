@echo off
echo "|----------------------|"
echo "|compile :             |"
echo "|----------------------|"
echo "|1. jPack [java]       |"
echo "|3. update             |"
echo "|4. clean build        |"
echo "|5. exit               |"
echo "|----------------------|"
choice
if errorlevel 4 goto EXIT
if errorlevel 3 goto CLEAN
if errorlevel 2 goto UPDATE
if errorlevel 1 goto JUNPACK

:JUNPACK
echo.
echo Compiling...
echo.
jvc.exe /nowarn /nomessage -x- -d . *.java
rem jexegen /out:junPacker.exe /main:jUnpack /base:. *.class
jexegen /out:jPacker.exe /main:java.za.jPacker.jPack /base:. java\za\jPacker\*.class
                            
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:UPDATE
echo.
echo Updating...
echo.
@copy *.class ..\..\ide\installer\java\za\jPacker\
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CLEAN
echo.
echo Cleaning...
echo.
@echo off
del java\za\jPacker\*.class
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