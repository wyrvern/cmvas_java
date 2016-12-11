@echo off
del types.class
jvc.exe /nomessage -x- -d . types.java
rem jvc.exe /nologo /nomessage -x- -d . types.java
rem jexegen /out:types.exe /main:types /base:. *.class	
rem jexegen /bindto:debug\stub.exe /main:Test.Hello /base:. Test\*.class	
rem jexegen /bindto:release\stub.exe /main:Test.Hello /base:. Test\*.class	
