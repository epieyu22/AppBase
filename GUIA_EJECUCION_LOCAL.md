# Guía de Ejecución Local - JulianaCloud Backend

## Requisitos Previos

### Software Necesario
1. **.NET Core SDK 3.1** o superior
   - Verificar instalación: `dotnet --version`
   - Descargar de: https://dotnet.microsoft.com/download/dotnet/3.1

2. **SQL Server** (LocalDB, Express o Full)
   - El proyecto está configurado para conectarse a: `192.168.0.101`
   - Usuario: `sa`
   - Password: `123`

3. **(Opcional) Node.js y npm** - Solo si vas a trabajar con el frontend Angular
   - Versión recomendada: Node.js 14.x o superior

### Configuración de Base de Datos

El proyecto utiliza **multi-tenancy** con bases de datos separadas por empresa:
- `UserAuthentication` - Base de datos global de autenticación
- `NmDEMO` - Base de datos de empresa demo
- `NmRockstar` - Base de datos de empresa Rockstar
- `NmAerolinea` - Base de datos de empresa Aerolinea

**IMPORTANTE**: Debes tener estas bases de datos creadas en tu SQL Server antes de iniciar.

## Configuración del Proyecto

### 1. Configurar Entorno (appsettings)

El proyecto usa el archivo `appsettings.dev.json` por defecto (configurado en `appsettings.json` con `"Environment": "dev"`).

**Ubicación**: `c:\ProyectosWork\AppBase\Systems.JulianaCloud.Web\appsettings.dev.json`

```json
{
  "ConnectionStrings": {
    "Main": "Data Source=192.168.0.101;Initial Catalog={0};Persist Security Info=True;User ID={1};Password={2}"
  },
  "Credentials": {
    "UserAuthentication": {
      "user": "sa",
      "pass": "123"
    },
    "NmDEMO": {
      "user": "sa",
      "pass": "123"
    }
  }
}
```

**Ajustes necesarios**:
- Cambiar `192.168.0.101` por tu servidor SQL Server:
  - Para LocalDB: `(localdb)\\MSSQLLocalDB`
  - Para SQL Server local: `localhost` o `.`
  - Para SQL Server Express: `.\\SQLEXPRESS`
- Ajustar credenciales si es necesario

### 2. Verificar Compilación

Antes de ejecutar, verifica que el proyecto compile correctamente:

```bash
cd c:\ProyectosWork\AppBase
dotnet build Systems.JulianaCloud.sln
```

**Resultado esperado**: `Build succeeded. 0 Warning(s). 0 Error(s)`.

## Métodos de Ejecución

### Opción 1: Ejecutar Manualmente (Recomendado para desarrollo)

#### Paso 1: Abrir terminal en la carpeta del proyecto Web
```bash
cd c:\ProyectosWork\AppBase\Systems.JulianaCloud.Web
```

#### Paso 2: Ejecutar el proyecto
```bash
dotnet run
```

**Resultado esperado**:
```
info: Microsoft.Hosting.Lifetime[0]
      Now listening on: https://localhost:5001
info: Microsoft.Hosting.Lifetime[0]
      Now listening on: http://localhost:5000
info: Microsoft.Hosting.Lifetime[0]
      Application started. Press Ctrl+C to shut down.
```

#### Paso 3: Probar el servicio
Abre tu navegador en:
- **HTTPS**: https://localhost:5001
- **HTTP**: http://localhost:5000

#### Paso 4: Detener el servicio
Presiona `Ctrl + C` en la terminal.

---

### Opción 2: Ejecutar con Watch (Auto-reload en cambios de código)

Para desarrollo activo, usa el modo watch que reinicia automáticamente cuando cambias código:

```bash
cd c:\ProyectosWork\AppBase\Systems.JulianaCloud.Web
dotnet watch run
```

**Ventaja**: No necesitas reiniciar manualmente al hacer cambios en el código.

---

### Opción 3: Ejecutar con Scripts de Automatización (Ver sección siguiente)

Usa los scripts `start-backend.bat` y `stop-backend.bat` que se incluyen.

---

## Scripts de Automatización

Se han creado 3 scripts para automatizar el inicio/detención:

### 1. `start-backend.bat` - Iniciar Backend

**Ubicación**: `c:\ProyectosWork\AppBase\start-backend.bat`

**Uso**:
```bash
# Opción 1: Doble clic en el archivo desde el explorador de Windows

# Opción 2: Desde terminal
cd c:\ProyectosWork\AppBase
start-backend.bat
```

**Qué hace**:
- Verifica que .NET esté instalado
- Restaura paquetes NuGet si es necesario
- Compila el proyecto
- Inicia el backend en segundo plano
- Abre automáticamente el navegador en https://localhost:5001
- Muestra la URL para probar la API

**Salida esperada**:
```
===========================================
   JULIANA CLOUD - INICIAR BACKEND
===========================================

[1/5] Verificando .NET Core SDK...
✓ .NET Core SDK instalado: 3.1.XXX

[2/5] Restaurando paquetes NuGet...
✓ Paquetes restaurados correctamente

[3/5] Compilando proyecto...
✓ Compilacion exitosa

[4/5] Iniciando backend en segundo plano...
✓ Backend iniciado en: https://localhost:5001

[5/5] Abriendo navegador...
✓ Navegador abierto

===========================================
   BACKEND EJECUTANDOSE
===========================================
URL API: https://localhost:5001
PID guardado en: backend.pid

Para detener: ejecuta stop-backend.bat o cierra esta ventana
Presiona cualquier tecla para mantener la ventana abierta...
```

---

### 2. `stop-backend.bat` - Detener Backend

**Ubicación**: `c:\ProyectosWork\AppBase\stop-backend.bat`

**Uso**:
```bash
# Opción 1: Doble clic en el archivo desde el explorador de Windows

# Opción 2: Desde terminal
cd c:\ProyectosWork\AppBase
stop-backend.bat
```

**Qué hace**:
- Busca procesos de dotnet ejecutando el backend
- Detiene todos los procesos relacionados
- Limpia el archivo de PID

**Salida esperada**:
```
===========================================
   JULIANA CLOUD - DETENER BACKEND
===========================================

Buscando procesos de backend...
✓ Procesos detenidos correctamente

===========================================
   BACKEND DETENIDO
===========================================
```

---

### 3. `check-backend.bat` - Verificar Estado

**Ubicación**: `c:\ProyectosWork\AppBase\check-backend.bat`

**Uso**:
```bash
cd c:\ProyectosWork\AppBase
check-backend.bat
```

**Qué hace**:
- Verifica si el backend está ejecutándose
- Muestra los puertos en uso
- Lista los procesos activos de dotnet

---

## Endpoints Principales del API

### Base URL
- **HTTPS**: `https://localhost:5001/api/`
- **HTTP**: `http://localhost:5000/api/`

### Endpoints de Autenticación

#### 1. Login Primario (AppUser)
```http
POST https://localhost:5001/api/auth/login
Content-Type: application/json

{
  "username": "usuario",
  "password": "password"
}
```

#### 2. Login Secundario (User por empresa)
```http
POST https://localhost:5001/api/security/login
Content-Type: application/json

{
  "companyCode": "NmDEMO",
  "username": "usuario",
  "password": "password"
}
```

**Respuesta**:
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "expiration": "2025-12-30T08:00:00Z"
}
```

### Endpoints CRUD Genéricos

Ejemplo con `Positions` (Cargos):

```http
# Obtener todos
GET https://localhost:5001/api/employee-positions/

# Obtener por ID
GET https://localhost:5001/api/employee-positions/1

# Crear
POST https://localhost:5001/api/employee-positions/
Content-Type: application/json
Authorization: Bearer {token}

{
  "name": "Gerente",
  "active": "S"
}

# Actualizar
PUT https://localhost:5001/api/employee-positions/1
Content-Type: application/json
Authorization: Bearer {token}

{
  "key": 1,
  "name": "Gerente General",
  "active": "S"
}

# Eliminar
DELETE https://localhost:5001/api/employee-positions/1
Authorization: Bearer {token}
```

### Lista de Controladores Disponibles

| Endpoint | Entidad |
|----------|---------|
| `/api/employee-positions/` | Cargos |
| `/api/companies/` | Empresas |
| `/api/branches/` | Sucursales |
| `/api/departments/` | Departamentos |
| `/api/cities/` | Ciudades |
| `/api/countries/` | Países |
| `/api/zones/` | Zonas |
| `/api/users/` | Usuarios |
| `/api/eps/` | EPS |
| `/api/arl/` | ARL |
| `/api/afp/` | AFP |
| `/api/cajas/` | Cajas |

## Troubleshooting (Solución de Problemas)

### Error: "Unable to connect to database"

**Causa**: No se puede conectar a SQL Server.

**Solución**:
1. Verifica que SQL Server esté ejecutándose:
   ```bash
   # Para SQL Server Express
   net start MSSQL$SQLEXPRESS

   # Para SQL Server completo
   net start MSSQLSERVER
   ```

2. Verifica la cadena de conexión en `appsettings.dev.json`

3. Prueba la conexión con SQL Server Management Studio (SSMS)

---

### Error: "Port 5001 already in use"

**Causa**: Otro proceso está usando el puerto 5001.

**Solución**:
1. Detén el proceso que está usando el puerto:
   ```bash
   netstat -ano | findstr :5001
   taskkill /PID [PID] /F
   ```

2. O cambia el puerto en `Properties/launchSettings.json`

---

### Error: "Database does not exist"

**Causa**: Las bases de datos multi-tenant no están creadas.

**Solución**:
1. Conéctate a SQL Server
2. Crea las bases de datos requeridas:
   ```sql
   CREATE DATABASE UserAuthentication;
   CREATE DATABASE NmDEMO;
   CREATE DATABASE NmRockstar;
   CREATE DATABASE NmAerolinea;
   ```

---

### Error: "Build failed"

**Causa**: Errores de compilación o paquetes NuGet faltantes.

**Solución**:
1. Limpia la solución:
   ```bash
   dotnet clean
   ```

2. Restaura paquetes:
   ```bash
   dotnet restore
   ```

3. Compila nuevamente:
   ```bash
   dotnet build
   ```

---

### El navegador muestra "Unable to connect"

**Causa**: El backend no está ejecutándose o está en un puerto diferente.

**Solución**:
1. Verifica que el backend esté corriendo:
   ```bash
   check-backend.bat
   ```

2. Revisa los logs en la terminal donde ejecutaste `dotnet run`

3. Verifica que no haya firewall bloqueando el puerto

---

## Logs y Debugging

### Ver logs en tiempo real

Si ejecutaste con `dotnet run`, los logs aparecen directamente en la terminal.

**Niveles de log configurados** (en `appsettings.json`):
- `Default`: Information
- `Microsoft`: Warning
- `Microsoft.Hosting.Lifetime`: Information

### Habilitar logs más detallados

Edita `appsettings.dev.json` y cambia el nivel de log:

```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Debug",
      "Microsoft": "Debug"
    }
  }
}
```

---

## Próximos Pasos

### 1. Configurar Frontend Angular (Opcional)

Si quieres ejecutar el frontend Angular en modo desarrollo:

```bash
cd c:\ProyectosWork\AppBase\Systems.JulianaCloud.Web\app
npm install
npm start
```

El frontend estará disponible en: `http://localhost:4200`

### 2. Configurar HTTPS Certificate

Para desarrollo local, acepta el certificado de desarrollo de .NET:

```bash
dotnet dev-certs https --trust
```

### 3. Instalar Herramientas de Desarrollo

**Postman** - Para probar APIs:
- Descargar de: https://www.postman.com/downloads/

**SQL Server Management Studio (SSMS)** - Para gestionar bases de datos:
- Descargar de: https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms

**Visual Studio Code** - Editor recomendado:
- Descargar de: https://code.visualstudio.com/
- Extensiones recomendadas:
  - C# (Microsoft)
  - REST Client
  - SQL Server (mssql)

---

## Comandos Útiles Rápidos

```bash
# Iniciar backend
cd c:\ProyectosWork\AppBase\Systems.JulianaCloud.Web
dotnet run

# Iniciar con auto-reload
dotnet watch run

# Compilar todo el proyecto
cd c:\ProyectosWork\AppBase
dotnet build

# Limpiar compilación
dotnet clean

# Restaurar paquetes
dotnet restore

# Ejecutar tests
cd c:\ProyectosWork\AppBase
dotnet test

# Ver versión de .NET
dotnet --version

# Listar SDKs instalados
dotnet --list-sdks
```

---

## Resumen de Archivos Creados

| Archivo | Propósito |
|---------|-----------|
| `GUIA_EJECUCION_LOCAL.md` | Esta guía completa |
| `start-backend.bat` | Script para iniciar el backend |
| `stop-backend.bat` | Script para detener el backend |
| `check-backend.bat` | Script para verificar estado del backend |

---

## Contacto y Soporte

Si tienes problemas adicionales:
1. Revisa los logs en la terminal
2. Consulta la documentación en `claude.md`
3. Verifica la configuración de `appsettings.dev.json`

---

**Última actualización**: 2025-12-29
