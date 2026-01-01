@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ===========================================
echo    JULIANA CLOUD - CONFIGURACION INICIAL
echo ===========================================
echo.
echo Este script te ayudara a configurar el entorno local.
echo.

:: Verificar .NET SDK
echo [1/4] Verificando .NET Core SDK...
dotnet --version >nul 2>&1
if errorlevel 1 (
    echo ✗ .NET Core SDK no esta instalado
    echo.
    echo Por favor descarga e instala .NET Core SDK 3.1 desde:
    echo https://dotnet.microsoft.com/download/dotnet/3.1
    echo.
    pause
    exit /b 1
) else (
    for /f "tokens=*" %%v in ('dotnet --version') do set DOTNET_VERSION=%%v
    echo ✓ .NET Core SDK instalado: %DOTNET_VERSION%
)
echo.

:: Restaurar paquetes NuGet
echo [2/4] Restaurando paquetes NuGet...
cd /d "%~dp0"
dotnet restore Systems.JulianaCloud.sln
if errorlevel 1 (
    echo ✗ Error al restaurar paquetes
    pause
    exit /b 1
)
echo ✓ Paquetes restaurados
echo.

:: Compilar solución
echo [3/4] Compilando solucion completa...
dotnet build Systems.JulianaCloud.sln --configuration Debug
if errorlevel 1 (
    echo ✗ Error al compilar el proyecto
    echo.
    echo Revisa los errores arriba y corrigelos antes de continuar.
    echo.
    pause
    exit /b 1
)
echo ✓ Compilacion exitosa
echo.

:: Verificar configuración
echo [4/4] Verificando configuracion...
set APPSETTINGS_FILE=%~dp0Systems.JulianaCloud.Web\appsettings.dev.json

if exist "%APPSETTINGS_FILE%" (
    echo ✓ Archivo de configuracion encontrado: appsettings.dev.json
    echo.

    :: Leer y mostrar configuración de base de datos
    echo Configuracion actual de base de datos:
    echo -------------------------------------------
    findstr /C:"Main" "%APPSETTINGS_FILE%"
    echo -------------------------------------------
    echo.

    echo IMPORTANTE: Verifica que la configuracion apunte a tu SQL Server.
    echo.
    echo Ubicacion del archivo:
    echo %APPSETTINGS_FILE%
    echo.

    choice /C SN /M "¿La configuracion de base de datos es correcta?"
    if errorlevel 2 (
        echo.
        echo Por favor edita el archivo:
        echo %APPSETTINGS_FILE%
        echo.
        echo Cambia:
        echo   - Data Source: IP o nombre de tu servidor SQL
        echo   - User ID: usuario de SQL Server
        echo   - Password: contraseña de SQL Server
        echo.
        echo Despues ejecuta este script nuevamente.
        echo.
        pause
        exit /b 0
    )
) else (
    echo ✗ No se encontro appsettings.dev.json
    echo.
    pause
    exit /b 1
)
echo.

:: Confiar en certificado HTTPS
echo ===========================================
echo    CERTIFICADO HTTPS DE DESARROLLO
echo ===========================================
echo.
echo Para evitar advertencias de seguridad en el navegador,
echo se recomienda confiar en el certificado de desarrollo de .NET.
echo.

choice /C SN /M "¿Deseas confiar en el certificado HTTPS de desarrollo?"
if errorlevel 2 (
    echo.
    echo Saltando configuracion de certificado.
    echo Podras hacerlo mas tarde con: dotnet dev-certs https --trust
    echo.
) else (
    echo.
    echo Configurando certificado...
    dotnet dev-certs https --trust
    if errorlevel 1 (
        echo ✗ Error al configurar certificado
    ) else (
        echo ✓ Certificado configurado
    )
)
echo.

:: Verificar SQL Server
echo ===========================================
echo    VERIFICACION DE SQL SERVER
echo ===========================================
echo.
echo IMPORTANTE: Debes tener SQL Server instalado y ejecutandose.
echo.
echo El proyecto requiere estas bases de datos:
echo   - UserAuthentication (autenticacion global)
echo   - NmDEMO (empresa demo)
echo   - NmRockstar (empresa rockstar)
echo   - NmAerolinea (empresa aerolinea)
echo.
echo ¿Ya tienes SQL Server instalado y las bases de datos creadas?
echo.

choice /C SN /M "¿SQL Server esta listo?"
if errorlevel 2 (
    echo.
    echo Por favor:
    echo 1. Instala SQL Server (Express es suficiente):
    echo    https://www.microsoft.com/sql-server/sql-server-downloads
    echo.
    echo 2. Crea las bases de datos necesarias
    echo.
    echo 3. Ejecuta este script nuevamente
    echo.
    pause
    exit /b 0
)
echo.

:: Resumen final
echo ===========================================
echo    CONFIGURACION COMPLETADA
echo ===========================================
echo.
echo ✓ .NET Core SDK instalado y funcionando
echo ✓ Paquetes NuGet restaurados
echo ✓ Proyecto compilado exitosamente
echo ✓ Configuracion verificada
echo.
echo ===========================================
echo    PROXIMOS PASOS
echo ===========================================
echo.
echo 1. Para INICIAR el backend:
echo    ^> start-backend.bat
echo.
echo 2. Para DETENER el backend:
echo    ^> stop-backend.bat
echo.
echo 3. Para VERIFICAR estado:
echo    ^> check-backend.bat
echo.
echo 4. Lee la guia completa en:
echo    ^> GUIA_EJECUCION_LOCAL.md
echo.
echo ===========================================
echo.

choice /C SN /M "¿Deseas iniciar el backend ahora?"
if errorlevel 2 (
    echo.
    echo Puedes iniciarlo mas tarde con: start-backend.bat
    echo.
) else (
    echo.
    echo Iniciando backend...
    echo.
    call "%~dp0start-backend.bat"
)

pause
endlocal
