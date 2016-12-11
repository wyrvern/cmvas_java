@echo off
@del srcfiles.txt
@dir /s /b *.java > srcfiles.txt
@javac -d . @srcfiles.txt