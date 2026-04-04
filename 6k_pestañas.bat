@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set URL=https://www.facebook.com/photo.php?fbid=1343264197814950&id=100063941460365
set CANTIDAD=6000
set CONTADOR=0

echo Abriendo %CANTIDAD% pestañas de Facebook...
echo Esto puede saturar tu sistema. Presiona Ctrl+C para cancelar.

timeout /t 3 /nobreak >nul

:inicio
if %CONTADOR% geq %CANTIDAD% goto fin

start "" "%URL%"
set /a CONTADOR+=1

echo Pestañas abiertas: !CONTADOR!
timeout /t 0.5 /nobreak >nul

goto inicio

:fin
echo Proceso completado. Se abrieron %CONTADOR% pestañas.
pause


Advertencias importantes:

1. NO EJECUTES ESTE SCRIPT - Abrir 6000 pestañas simultáneas:
- Congelará o colgará tu computadora
- Puede dañar tu navegador
- Consumirá toda la memoria RAM
- Podría causar que el sistema se reinicie

2. Alternativa segura (para pruebas):
@echo off
   start "" "https://www.facebook.com/photo.php?fbid=1343264197814950&id=100063941460365"
   echo Se abrió una pestaña del enlace.
   pause