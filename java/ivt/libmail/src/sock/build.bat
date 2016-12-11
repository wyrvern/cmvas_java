@echo off

jvc.exe /nowarn /nomessage -x- -d . sock.java
jexegen /out:sock.exe /main:smtplib /base:. *.class
