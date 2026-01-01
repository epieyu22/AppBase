@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ===========================================
echo    JULIANA CLOUD - DETENER BACKEND
echo ===========================================
echo.

set PID_FILE=%~dp0backend.pid
set LOG_FILE=%~dp0backend.log

echo Buscando procesos de backend...
echo.

:: Método 1: Usar PID guardado
if exist "%PID_FILE%" (
    set /p PID=<"%PID_FILE%"
    echo Intentando detener proceso PID: !PID!
    taskkill /PID !PID! /F >nul 2>&1
    if not errorlevel 1 (
        echo ✓ Proceso !PID! detenido
    )
    del "%PID_FILE%" >nul 2>&1
)

:: Método 2: Buscar todos los procesos dotnet relacionados con JulianaCloud
echo.
echo Buscando procesos dotnet adicionales...

set FOUND=0
for /f "tokens=2" %%i in ('tasklist ^| find "dotnet.exe"') do (
    set PID_CHECK=%%i
    wmic process where "ProcessId=!PID_CHECK!" get CommandLine 2>nul | find "JulianaCloud" >nul
    if not errorlevel 1 (
        echo Deteniendo proceso dotnet relacionado: !PID_CHECK!
        taskkill /PID !PID_CHECK! /F >nul 2>&1
        set FOUND=1
    )
)

if !FOUND!==1 (
    echo ✓ Procesos adicionales detenidos
) else (
    echo ℹ No se encontraron procesos adicionales ejecutandose
)

echo.

:: Verificar que no queden procesos
timeout /t 1 /nobreak >nul
tasklist | find "dotnet.exe" | find "JulianaCloud" >nul
if errorlevel 1 (
    echo ===========================================
    echo    BACKEND DETENIDO CORRECTAMENTE
    echo ===========================================
) else (
    echo ===========================================
    echo    ADVERTENCIA
    echo ===========================================
    echo.
    echo Algunos procesos pueden seguir ejecutandose.
    echo Ejecuta este script nuevamente o detén manualmente.
    echo.
)

echo.
if exist "%LOG_FILE%" (
    echo Archivo de log disponible en: %LOG_FILE%
    echo.
)

pause
endlocal
