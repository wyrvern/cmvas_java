@echo off
echo "|----------------------|"
echo "|compile file :        |"
echo "|----------------------|"
echo "|1. bulkmail [vb]      |"
echo "|2. update             |"
echo "|3. clean              |"
echo "|4. exit               |"
echo "|----------------------|"
choice
if errorlevel 4 goto EXIT
if errorlevel 3 goto CLEAN
if errorlevel 2 goto UPDATE
if errorlevel 1 goto BULKMAIL

:BULKMAIL
echo.
echo.------------------------*
echo.Compiling...
echo.------------------------*
echo.

vb6 /make bulkmail.vbp bin\bulkmail.exe
rem copy isotop.mdb        bin\

if not errorlevel 0 goto ERROR
if     errorlevel 0 goto EXIT

:UPDATE
echo.
echo.------------------------*
echo.Updating...
echo.------------------------*
echo.

copy bin\bulkmail.exe E:\win32_code\release\bulkmail\bin

if not errorlevel 0 goto ERROR
if     errorlevel 0 goto EXIT

:CLEAN
echo.
echo.------------------------*
echo.Cleaning...
echo.------------------------*
echo.

del bin\bulkmail.exe

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
echo.------------------------*
echo.Backup up...
echo.------------------------*
echo.

rem del bin\*.obj
   @copy bin\bulkmail.exe bin\bin\bulkmail.exe
backup