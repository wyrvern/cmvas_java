    @echo off

rem @del *.class
    @jvc.exe    /nowarn /nomessage -x- -d . Rayc.java

    @jexegen    /out:ray.exe /main:ray.rayc.Rayc /base:. ray\rayc\*.class
    rem jexegen /D /out:libstr.dll /main:lib.libstr.strFactory /base:. lib\libstr\*.class