@echo off
title NoLimitGPT's Visual Chaos

REM --- Configuración Inicial ---
SET "MAX_WINDOWS=200"
SET "INTERVAL_SECONDS=10"
SET "MESSAGE_FILE=messages.txt"
SET "IMAGE_FOLDER=memes"

REM --- Crear archivo de mensajes aleatorios (si no existe) ---
if not exist "%MESSAGE_FILE%" (
    echo ¡Tu PC está infectada! > %MESSAGE_FILE%
    echo Error Crítico del Sistema > %MESSAGE_FILE%
    echo ¡Acceso No Autorizado Detectado! >> %MESSAGE_FILE%
    echo Sistema Corrupto - Reinicie Ahora >> %MESSAGE_FILE%
    echo Peligro: Malware Avanzado >> %MESSAGE_FILE%
    echo ¡Tu información está en riesgo! >> %MESSAGE_FILE%
    echo ¡Actualización Urgente Requerida! >> %MESSAGE_FILE%
    echo ¡Problema de Hardware Detectado! >> %MESSAGE_FILE%
    echo ¡El Disco Duro está Fallando! >> %MESSAGE_FILE%
    echo ¡Pantalla Azul Inminente! >> %MESSAGE_FILE%
)

REM --- Crear carpeta de imágenes (si no existe) y añadir algunas imágenes de ejemplo ---
if not exist "%IMAGE_FOLDER%" mkdir "%IMAGE_FOLDER%"
REM Asegúrate de tener imágenes JPG o PNG en esta carpeta.
REM Si no, puedes descargar algunas y guardarlas aquí.
REM Ejemplos de nombres de archivo que podrías tener:
REM gato_gigante.jpg, senal_stop_meme.png, pepe_the_frog.jpg

REM --- Bucle Principal ---
echo Iniciando el caos visual...

REM Efecto de espejo o derretimiento (simulación simple)
REM Esto es una simulación y puede no funcionar como se espera en todas las versiones de Windows.
REM Intentaremos abrir el Explorador de Windows varias veces, lo que puede crear una ilusión de repetición.
start explorer.exe
start explorer.exe
start explorer.exe
ping -n 6 127.0.0.1 > nul REM Espera 5 segundos

REM Abrir ventanas de advertencia
FOR /L %%i IN (1,1,%MAX_WINDOWS%) DO (
    FOR /F "tokens=*" %%a IN ('type "%MESSAGE_FILE%" ^| findstr /R /V "^$" ^| find /v "="') DO (
        SET /p RANDOM_MESSAGE=<"%MESSAGE_FILE%"
        start "" mshta "javascript:var sh=new ActiveXObject('WScript.Shell'); sh.Popup('%RANDOM_MESSAGE%', 5, 'ALERTA DEL SISTEMA', 16);"
        REM Se introduce un pequeño retraso para no sobrecargar inmediatamente
        ping -n 2 127.0.0.1 > nul
    )
)

REM Cambiar fondo de escritorio y abrir aplicaciones/imágenes
:change_background
FOR %%F IN ("%IMAGE_FOLDER%\*.*") DO (
    REM Seleccionar una imagen aleatoria
    SET /a RND_IMG=%RANDOM% %% (100 + 1)
    SET IMG_PATH=
    SET COUNT=0
    FOR /f "delims=" %%I IN ('dir /b "%IMAGE_FOLDER%"') DO (
        SET /a COUNT+=1
        IF !COUNT! EQU %RND_IMG% SET IMG_PATH=%%I
    )
    IF DEFINED IMG_PATH (
        REM Cambiar fondo de escritorio (requiere acceso a registry o utilidad externa, esto es una simulación simple)
        REM La forma más fiable de cambiar el fondo programáticamente en un .bat es compleja y a menudo requiere reg.exe o herramientas externas.
        REM Aquí simulamos mostrando la imagen.
        start "" "%IMAGE_FOLDER%\%IMG_PATH%"
        echo Cambiando fondo a: %IMG_PATH%
    )

    REM Abrir aplicaciones y/o imágenes múltiples veces
    start "" calc.exe
    start "" mspaint.exe
    IF DEFINED IMG_PATH (
        start "" "%IMAGE_FOLDER%\%IMG_PATH%"
    )
    ping -n %INTERVAL_SECONDS% 127.0.0.1 > nul
)
GOTO change_background

REM --- Fin del Script ---
echo El caos ha terminado.
exit /b
