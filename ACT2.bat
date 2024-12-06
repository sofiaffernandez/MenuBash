@echo off
cls
REM Menu
:menu
cls
echo MENU PRINCIPAL
echo 1. Crear estructura
echo 2. Anadir informacion
echo 3. Salir
echo.
choice /c 123 /m "Elige una opcion del menu:"

REM Evaluar las opciones en orden descendente
if errorlevel 3 goto salir
if errorlevel 2 goto añadir_informacion
if errorlevel 1 goto crear_estructura

:crear_estructura
cls
set /p dir_raiz="Introduce el nombre del directorio raiz: "
md "%dir_raiz%"
md "%dir_raiz%\RED"
md "%dir_raiz%\SISTEMA"
md "%dir_raiz%\ONLINE"
echo Estructura creada en %cd%\%dir_raiz%.
pause
goto menu

:añadir_informacion
cls

if not exist "%dir_raiz%" (
    echo ERROR: Por favor crea la estructura primero.
    pause
    goto menu
)

ipconfig > "%dir_raiz%\RED\CONFIGRED.txt"
echo CONFIGRED.txt creado en %dir_raiz%\RED.

set /p unidad="Introduce la letra de la unidad para CHKDSK: "
chkdsk %unidad% > "%dir_raiz%\SISTEMA\CHEQUEO.txt"
echo CHEQUEO.txt creado en %dir_raiz%\SISTEMA.

set /p ip="Introduce la direccion IP para hacer PING: "
ping %ip% > "%dir_raiz%\ONLINE\PINGONLINE.txt"
echo PINGONLINE.txt creado en %dir_raiz%\ONLINE.

pause
goto menu

:salir
cls
echo Cerrando y saliendo del programa.
pause

