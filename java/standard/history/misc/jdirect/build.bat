@echo off
echo "|----------------------|"
echo "|compile :             |"
echo "|----------------------|"
echo "|1. jDirect  [java]    |"
echo "|2. type-lib [java]    |"
echo "|3. stub     [c/java]  |"
echo "|4. com      [c/java]  |"
echo "|4. cab      [java]    |"
echo "|5. clean build        |"
echo "|6. exit               |"
echo "|----------------------|"
choice
if errorlevel 7 goto EXIT
if errorlevel 6 goto CLEAN
if errorlevel 5 goto CAB
if errorlevel 4 goto COM
if errorlevel 3 goto STUB
if errorlevel 2 goto MIDL
if errorlevel 1 goto JDIRECT

:JDIRECT
del *.class
del jDirect.exe
jvc.exe /nowarn /nomessage -x- -d . jDirect.java
jexegen /out:jDirect.exe /main:jDirect /base:. *.class
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:MIDL
midl.exe /Oicf /nologo idl/jwork.idl
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:STUB
nmake -f jdirect.mak
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:COM
rem jactivex /javatlb /X:m- -d . shelllnk.tlb
rem jactivex /X:m- -d . shell32.lib
jactivex /X:m- -d . user32.dll
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CAB
echo.
echo Building...
echo.
cabarc -r -p -P javacode\ n jClass.cab com\*.*
cabarc n jShell.cab jClass.cab jShell.inf
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:CLEAN
@echo off
del *.c
del *.h
del *.obj
del *.class
del jDirect.exe
if not errorlevel 0 goto ERROR
if errorlevel 0 goto EXIT

:ERROR
echo.
echo There was an error compiling.
echo Exiting...

:EXIT
echo.
echo Done.