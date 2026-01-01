@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ===========================================
echo    JULIANA CLOUD - INICIAR BACKEND
echo ===========================================
echo.

:: Variables
set PROJECT_PATH=%~dp0Systems.JulianaCloud.Web
set PROJECT_FILE=Systems.JulianaCloud.Web.csproj
set PID_FILE=%~dp0backend.pid
set LOG_FILE=%~dp0backend.log

:: [1/5] Verificar .NET Core SDK
echo [1/5] Verificando .NET Core SDK...
dotnet --version >nul 2>&1
if errorlevel 1 (
    echo ✗ ERROR: .NET Core SDK no esta instalado.
    echo.
    echo Descarga e instala .NET Core SDK desde:
    echo https://dotnet.microsoft.com/download/dotnet/3.1
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%v in ('dotnet --version') do set DOTNET_VERSION=%%v
echo ✓ .NET Core SDK instalado: %DOTNET_VERSION%
echo.

:: [2/5] Restaurar paquetes NuGet
echo [2/5] Restaurando paquetes NuGet...
cd /d "%PROJECT_PATH%"
dotnet restore >nul 2>&1
if errorlevel 1 (
    echo ✗ ERROR: Fallo al restaurar paquetes NuGet
    echo.
    pause
    exit /b 1
)
echo ✓ Paquetes restaurados correctamente
echo.

:: [3/5] Compilar proyecto
echo [3/5] Compilando proyecto...
dotnet build --configuration Release >nul 2>&1
if errorlevel 1 (
    echo ✗ ERROR: Fallo al compilar el proyecto
    echo.
    echo Ejecuta 'dotnet build' manualmente para ver los errores
    echo.
    pause
    exit /b 1
)
echo ✓ Compilacion exitosa
echo.

:: [4/5] Iniciar backend
echo [4/5] Iniciando backend en segundo plano...

:: Limpiar PID anterior si existe
if exist "%PID_FILE%" del "%PID_FILE%"

:: Iniciar dotnet run en segundo plano y capturar PID
start /b "" dotnet run --no-build --configuration Release > "%LOG_FILE%" 2>&1

:: Esperar 3 segundos para que se inicie
timeout /t 3 /nobreak >nul

:: Verificar si se inició correctamente
tasklist | find "dotnet.exe" >nul
if errorlevel 1 (
    echo ✗ ERROR: El backend no se pudo iniciar
    echo.
    echo Revisa el archivo de log: %LOG_FILE%
    echo.
    pause
    exit /b 1
)

:: Buscar el PID del proceso dotnet y guardarlo
for /f "tokens=2" %%i in ('tasklist ^| find "dotnet.exe"') do (
    echo %%i > "%PID_FILE%"
    set PID=%%i
    goto :found_pid
)

:found_pid
echo ✓ Backend iniciado (PID: %PID%)
echo ✓ Backend corriendo en: https://localhost:5001
echo.

:: [5/5] Abrir navegador
echo [5/5] Abriendo navegador...
timeout /t 2 /nobreak >nul
start https://localhost:5001
echo ✓ Navegador abierto
echo.

echo ===========================================
echo    BACKEND EJECUTANDOSE
echo ===========================================
echo.
echo URL API: https://localhost:5001
echo URL HTTP: http://localhost:5000
echo.
echo Archivo de log: %LOG_FILE%
echo PID guardado en: %PID_FILE%
echo.
echo Para detener: ejecuta stop-backend.bat
echo Para ver logs en vivo: type %LOG_FILE%
echo.
echo ===========================================
echo.

:: Mantener la ventana abierta para mostrar mensajes
pause

endlocal
