# JulianaCloud - Sistema de Gestión de Nómina y RRHH

Sistema de gestión de nómina y recursos humanos para empresas colombianas, desarrollado en .NET Core 3.1 con arquitectura en capas.

## Inicio Rápido

### Primera vez (Configuración inicial)
```bash
# Ejecutar script de configuración
setup-local.bat
```

### Iniciar Backend
```bash
# Opción 1: Con script (recomendado)
start-backend.bat

# Opción 2: Manual
cd Systems.JulianaCloud.Web
dotnet run
```

### Detener Backend
```bash
# Con script
stop-backend.bat

# Manual: Presiona Ctrl+C en la terminal
```

### Verificar Estado
```bash
check-backend.bat
```

## URLs del Servicio

Una vez iniciado el backend:

- **API HTTPS**: https://localhost:5001
- **API HTTP**: http://localhost:5000
- **Swagger** (si está habilitado): https://localhost:5001/swagger

## Documentación

| Documento | Descripción |
|-----------|-------------|
| [GUIA_EJECUCION_LOCAL.md](GUIA_EJECUCION_LOCAL.md) | Guía completa de ejecución y troubleshooting |
| [claude.md](claude.md) | Documentación técnica de arquitectura |

## Scripts Disponibles

| Script | Función |
|--------|---------|
| `setup-local.bat` | Configuración inicial del entorno |
| `start-backend.bat` | Iniciar el backend |
| `stop-backend.bat` | Detener el backend |
| `check-backend.bat` | Verificar estado del backend |

## Requisitos

- **.NET Core SDK 3.1** o superior
- **SQL Server** (LocalDB, Express o Full)
- **(Opcional) Node.js** - Para frontend Angular

## Arquitectura

```
Systems.JulianaCloud.Web (ASP.NET Core + Angular)
    ↓
Systems.JulianaCloud.Api (26 Controllers REST)
    ↓
Systems.JulianaCloud.Business (22 Services)
    ↓
Systems.JulianaCloud.Data (Repository + UnitOfWork)
    ↓
Systems.JulianaCloud.Domain (83 Entities)
```

## Proyectos

- **Web** - Frontend Angular + Hosting ASP.NET Core
- **Api** - Controladores REST
- **Business** - Lógica de negocio
- **Data** - Acceso a datos (EF Core)
- **Domain** - Entidades del dominio
- **Interfaces** - Contratos
- **TransferObjects** - DTOs
- **IoC/Bootstraper** - Dependency Injection
- **Commons** - Utilidades
- **Resources** - Recursos y mensajes
- **Tests** - Tests unitarios

## Endpoints Principales

### Autenticación
```http
POST /api/auth/login           # Login primario
POST /api/security/login       # Login por empresa
```

### CRUD Genéricos (requieren JWT)
```http
GET    /api/employee-positions/     # Listar cargos
GET    /api/employee-positions/{id} # Obtener cargo
POST   /api/employee-positions/     # Crear cargo
PUT    /api/employee-positions/{id} # Actualizar cargo
DELETE /api/employee-positions/{id} # Eliminar cargo
```

Otros endpoints disponibles:
- `/api/companies/` - Empresas
- `/api/departments/` - Departamentos
- `/api/users/` - Usuarios
- `/api/eps/` - EPS
- `/api/arl/` - ARL
- Y 20+ más...

## Configuración

### Base de Datos

Edita `Systems.JulianaCloud.Web/appsettings.dev.json`:

```json
{
  "ConnectionStrings": {
    "Main": "Data Source=localhost;Initial Catalog={0};User ID=sa;Password=tupassword"
  }
}
```

### Bases de Datos Requeridas
- `UserAuthentication` - Autenticación global
- `NmDEMO` - Empresa demo
- `NmRockstar` - Empresa rockstar
- `NmAerolinea` - Empresa aerolinea

## Tecnologías

- .NET Core 3.1
- Entity Framework Core 3.1.9
- AutoMapper 10.1.1
- JWT Bearer Authentication
- Angular (frontend)
- SQL Server

## Comandos Útiles

```bash
# Compilar
dotnet build

# Ejecutar tests
dotnet test

# Limpiar
dotnet clean

# Restaurar paquetes
dotnet restore

# Ver versión .NET
dotnet --version
```

## Troubleshooting

### Puerto en uso
```bash
netstat -ano | findstr :5001
taskkill /PID [PID] /F
```

### Problemas de compilación
```bash
dotnet clean
dotnet restore
dotnet build
```

### Error de base de datos
- Verifica que SQL Server esté ejecutándose
- Verifica la cadena de conexión en `appsettings.dev.json`
- Verifica que las bases de datos existan

## Estructura del Proyecto

```
AppBase/
├── Systems.JulianaCloud.Web/          # Aplicación principal
├── Systems.JulianaCloud.Api/          # REST API
├── Systems.JulianaCloud.Business/     # Lógica de negocio
├── Systems.JulianaCloud.Data/         # Acceso a datos
├── Systems.JulianaCloud.Domain/       # Entidades
├── Systems.JulianaCloud.Interfaces/   # Contratos
├── Systems.JulianaCloud.TransferObjects/ # DTOs
├── Systems.JulianaCloud.IoC/          # DI Container
├── Systems.JulianaCloud.Commons/      # Utilidades
├── Systems.JulianaCloud.Resources/    # Recursos
├── Systems.JulianaCloud.Tests/        # Tests
├── start-backend.bat                  # Script iniciar
├── stop-backend.bat                   # Script detener
├── check-backend.bat                  # Script verificar
├── setup-local.bat                    # Script setup
├── GUIA_EJECUCION_LOCAL.md           # Guía completa
└── claude.md                          # Documentación técnica
```

## Próximos Pasos

1. Lee la [GUIA_EJECUCION_LOCAL.md](GUIA_EJECUCION_LOCAL.md) para más detalles
2. Revisa [claude.md](claude.md) para entender la arquitectura
3. Ejecuta `setup-local.bat` para configuración inicial
4. Ejecuta `start-backend.bat` para iniciar el servicio
5. Prueba los endpoints con Postman o tu cliente HTTP favorito

## Licencia

Propietario

---

**Última actualización**: 2025-12-29
