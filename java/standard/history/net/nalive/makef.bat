@echo off
del nAlive.class
jvc.exe /nowarn /nomessage -x- -d . nAlive.java smtplib.java
jexegen /out:nAlive.exe /main:nAlive /base:. *.class