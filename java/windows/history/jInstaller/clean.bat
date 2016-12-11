:CLEAN
echo.
echo Cleaning...
echo.
@echo off
del *.class
del *.dat
del *.ant
del jInstaller.exe
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
