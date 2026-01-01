@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ===========================================
echo    JULIANA CLOUD - VERIFICAR ESTADO
echo ===========================================
echo.

set PID_FILE=%~dp0backend.pid
set LOG_FILE=%~dp0backend.log

:: Verificar si existe archivo PID
echo [1] Verificando archivo PID...
if exist "%PID_FILE%" (
    set /p PID=<"%PID_FILE%"
    echo ✓ Archivo PID encontrado: !PID!

    :: Verificar si el proceso sigue corriendo
    tasklist /FI "PID eq !PID!" 2>nul | find "!PID!" >nul
    if errorlevel 1 (
        echo ✗ El proceso !PID! ya no esta ejecutandose
        echo   (Archivo PID obsoleto)
    ) else (
        echo ✓ El proceso !PID! esta ejecutandose
    )
) else (
    echo ℹ No hay archivo PID guardado
)
echo.

:: Buscar todos los procesos dotnet
echo [2] Buscando procesos dotnet...
set FOUND=0
for /f "tokens=1,2" %%a in ('tasklist ^| find "dotnet.exe"') do (
    set PROC_NAME=%%a
    set PROC_PID=%%b

    :: Verificar si es de JulianaCloud
    wmic process where "ProcessId=!PROC_PID!" get CommandLine 2>nul | find "JulianaCloud" >nul
    if not errorlevel 1 (
        echo ✓ Proceso encontrado: !PROC_NAME! (PID: !PROC_PID!)
        set FOUND=1
    )
)

if !FOUND!==0 (
    echo ℹ No se encontraron procesos de JulianaCloud ejecutandose
)
echo.

:: Verificar puertos en uso
echo [3] Verificando puertos...
netstat -ano | find ":5001" >nul
if errorlevel 1 (
    echo ℹ Puerto 5001 (HTTPS) - No esta en uso
) else (
    echo ✓ Puerto 5001 (HTTPS) - EN USO
    for /f "tokens=5" %%p in ('netstat -ano ^| find ":5001" ^| find "LISTENING"') do (
        echo   PID: %%p
    )
)

netstat -ano | find ":5000" >nul
if errorlevel 1 (
    echo ℹ Puerto 5000 (HTTP) - No esta en uso
) else (
    echo ✓ Puerto 5000 (HTTP) - EN USO
    for /f "tokens=5" %%p in ('netstat -ano ^| find ":5000" ^| find "LISTENING"') do (
        echo   PID: %%p
    )
)
echo.

:: Verificar logs
echo [4] Verificando logs...
if exist "%LOG_FILE%" (
    echo ✓ Archivo de log encontrado: %LOG_FILE%

    :: Mostrar últimas 10 líneas del log
    echo.
    echo Ultimas 10 lineas del log:
    echo -------------------------------------------
    for /f "skip=0 delims=" %%l in (%LOG_FILE%) do (
        set "line=%%l"
        set /a count+=1
    )

    if defined count (
        set /a start=!count!-10
        if !start! lss 0 set start=0

        set /a current=0
        for /f "skip=0 delims=" %%l in (%LOG_FILE%) do (
            if !current! geq !start! echo %%l
            set /a current+=1
        )
    )
    echo -------------------------------------------
) else (
    echo ℹ No hay archivo de log disponible
)
echo.

:: Resumen
echo ===========================================
echo    RESUMEN
echo ===========================================

if !FOUND!==1 (
    echo ESTADO: ✓ BACKEND EJECUTANDOSE
    echo.
    echo Puedes acceder al backend en:
    echo   - https://localhost:5001
    echo   - http://localhost:5000
) else (
    echo ESTADO: ✗ BACKEND NO ESTA EJECUTANDOSE
    echo.
    echo Para iniciar el backend, ejecuta: start-backend.bat
)

echo ===========================================
echo.

pause
endlocal
