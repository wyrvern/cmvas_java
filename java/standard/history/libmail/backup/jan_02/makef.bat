@echo off
del encoder.class
del attach.class
del header.class
del smtplib.class
jvc.exe /nowarn /nomessage -x- -d . smtplib.java strlib.java encoder.java
jexegen /out:smtplib.exe /main:smtplib /base:. *.class
