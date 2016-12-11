    @echo off

rem @del *.class
    @jvc.exe    /nowarn /nomessage -x- -d . gfxFactory.java

    @jexegen    /out:gfx.exe /main:lib.libgfx.gfxFactory /base:. lib\libgfx\*.class
    rem jexegen /D /out:libstr.dll /main:lib.libstr.strFactory /base:. lib\libstr\*.class