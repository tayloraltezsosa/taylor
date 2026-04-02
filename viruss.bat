@echo off
setlocal enabledelayedexpansion
title Iniciando services.exe...
mode con: cols=110 lines=35
color 07

:: FASE 1: EL "GLITCH" (Inestabilidad visual rápida)
:: El parpadeo rápido de colores y textos rotos simula que el sistema está perdiendo el control
for /l %%i in (1,1,15) do (
    color 0c
    title SYSTEM_ERROR_0x!random!
    echo %random% %random% CORRUPTED_SECTOR_%random% %random% %random%
    >nul ping -n 1 127.0.0.1
    color 0a
    echo %random% MEMORY_LEAK_DETECTED %random% %random% %random%
    >nul ping -n 1 127.0.0.1
    color 07
    >nul ping -n 1 127.0.0.1
)

:: Sonido de error crítico
start "" /min powershell -windowstyle hidden -command "(New-Object Media.SoundPlayer 'C:\Windows\Media\Windows Critical Stop.wav').PlaySync()"

:: FASE 2: LA PANTALLA DE RESCATE (Ransomware Visual)
:: Esto abre una ventana gráfica SIN BORDES (no hay 'X' para cerrar) a pantalla completa
start "" /min powershell -windowstyle hidden -command "& {
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing
    
    # Configuración de la ventana de terror
    $form = New-Object System.Windows.Forms.Form
    $form.Text = ''
    $form.WindowState = 'Maximized'
    $form.FormBorderStyle = 'None' # Esto quita la barra de título y los botones de cerrar/minimizar
    $form.BackColor = [System.Drawing.Color]::Black
    $form.TopMost = $true
    
    # Texto principal (Tipografía de consola, color rojo sangre)
    $label = New-Object System.Windows.Forms.Label
    $label.Text = 'TU COMPUTADORA HA SIDO INFECTADA`n`nTodos tus archivos, fotos y bases de datos han sido cifrados con AES-256.`nNo intentes recuperarlos por tu cuenta o serán eliminados permanentemente.`n`nPara recuperar tu acceso, envia 0.5 BTC a la direccion:`n1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa`n`nTienes 23:59:59 antes de que se borre el cifrado.'
    $label.Font = New-Object System.Drawing.Font('Consolas', 22, [System.Drawing.FontStyle]::Bold)
    $label.ForeColor = [System.Drawing.Color]::FromArgb(200, 0, 0) # Rojo oscuro intenso
    $label.Size = New-Object System.Drawing.Size(1200, 700)
    $label.Location = New-Object System.Drawing.Point(50, 80)
    $form.Controls.Add($label)
    
    # Contador regresivo falso (Da la sensación de que pasa algo en tiempo real)
    $time = 60
    $timer = New-Object System.Windows.Forms.Timer
    $timer.Interval = 1000
    $timer.Add_Tick({
        $time--
        if ($time -le 0) {
            $timer.Stop()
            $form.Close() # Se cierra sola tras 60 segundos
        }
    })
    
    $timer.Start()
    $form.Add_Shown({ $form.Activate() })
    $form.ShowDialog()
}"

:: FASE 3: FALSO CRASH (Mientras la ventana roja está abierta, la consola parpadea de fondo)
:fake_crash
cls
color 17
echo.
echo   A problem has been detected and Windows has been shut down to prevent damage...
ping -n 2 127.0.0.1 >nul
cls
color 0c
echo   FATAL SYSTEM ERROR
ping -n 1 127.0.0.1 >nul
goto fake_crash