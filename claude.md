# JulianaCloud - Project Memory

## Información General del Proyecto

**Nombre**: JulianaCloud
**Tipo**: Sistema de gestión de nómina y recursos humanos (RRHH)
**Target Framework**: .NET Core 3.1 (netcoreapp3.1)
**Base de Datos**: SQL Server
**Frontend**: Angular (SPA integrada)
**País/Mercado**: Colombia (maneja legislación laboral colombiana)

## Documentación Disponible

| Archivo | Propósito |
|---------|-----------|
| [README.md](README.md) | Inicio rápido y resumen del proyecto |
| [GUIA_EJECUCION_LOCAL.md](GUIA_EJECUCION_LOCAL.md) | Guía completa de ejecución local, troubleshooting y configuración |
| [claude.md](claude.md) | Este archivo - Documentación técnica completa de arquitectura (memoria del proyecto) |

## Scripts de Ejecución

| Script | Función |
|--------|---------|
| [setup-local.bat](setup-local.bat) | Configuración inicial: verifica .NET SDK, restaura paquetes, compila, configura HTTPS |
| [start-backend.bat](start-backend.bat) | Inicia el backend en segundo plano y abre el navegador |
| [stop-backend.bat](stop-backend.bat) | Detiene todos los procesos del backend |
| [check-backend.bat](check-backend.bat) | Verifica estado del backend y muestra logs |

## Arquitectura del Sistema

### Patrón Arquitectónico Principal
**Layered Architecture (Arquitectura en Capas)** de 4 niveles:

```
┌─────────────────────────────────────────────────────┐
│ PRESENTATION LAYER                                  │
│ Systems.JulianaCloud.Web                            │
│ - ASP.NET Core 3.1                                  │
│ - Angular SPA                                       │
│ - Proxy dev server: http://localhost:4200          │
└──────────────────┬──────────────────────────────────┘
                   │
┌──────────────────▼──────────────────────────────────┐
│ API LAYER                                           │
│ Systems.JulianaCloud.Api                            │
│ - 26 Controladores REST                             │
│ - BaseCrudController<TEntityTO, TEntityDomain, TKey>│
│ - JWT Bearer Authentication                         │
└──────────────────┬──────────────────────────────────┘
                   │
┌──────────────────▼──────────────────────────────────┐
│ BUSINESS LOGIC LAYER                                │
│ Systems.JulianaCloud.Business                       │
│ - 22 Servicios de negocio                           │
│ - BasicCrudService<TEntityTO, TEntityDomain, TKey>  │
│ - EntityTransformationPipeline                      │
└──────────────────┬──────────────────────────────────┘
                   │
┌──────────────────▼──────────────────────────────────┐
│ DATA ACCESS LAYER                                   │
│ Systems.JulianaCloud.Data                           │
│ - Repository Pattern                                │
│ - Unit of Work Pattern                              │
│ - Entity Framework Core 3.1.9                       │
│ - Lazy Loading Proxies                              │
└──────────────────┬──────────────────────────────────┘
                   │
┌──────────────────▼──────────────────────────────────┐
│ DOMAIN LAYER                                        │
│ Systems.JulianaCloud.Domain                         │
│ - 83 Entidades de dominio                           │
│ - IKeyEntity<TKey> interface                        │
│ - Data Annotations para mapeo                       │
└─────────────────────────────────────────────────────┘
```

## Estructura de Proyectos

### Proyectos Core (11 proyectos principales)

| Proyecto | Responsabilidad | Archivos Clave |
|----------|-----------------|----------------|
| **Systems.JulianaCloud.Web** | Frontend Angular + ASP.NET Core hosting | `Startup.cs`, `Program.cs`, `app/` |
| **Systems.JulianaCloud.Api** | REST API Controllers (26 controladores) | `Controllers/`, `BaseCrudController.cs` |
| **Systems.JulianaCloud.Business** | Lógica de negocio (22 servicios) | `Services/`, `BasicCrudService.cs`, `Pipelines/` |
| **Systems.JulianaCloud.Data** | Acceso a datos, EF Core | `Repository.cs`, `UnitOfWork.cs`, `RepositoryCollection.cs` |
| **Systems.JulianaCloud.Domain** | Entidades de dominio (83 clases) | `Entities/`, `IKeyEntity.cs` |
| **Systems.JulianaCloud.Interfaces** | Contratos e interfaces | `IRepository.cs`, `IUnitOfWork.cs`, `IBasicCrudService.cs` |
| **Systems.JulianaCloud.TransferObjects** | DTOs para API | `*TO.cs`, `IChangeableProperties.cs` |
| **Systems.JulianaCloud.IoC (Bootstraper)** | Dependency Injection Config | `IocConfig.cs` |
| **Systems.JulianaCloud.Commons** | Utilidades compartidas | Helpers, Extensions |
| **Systems.JulianaCloud.Resources** | Recursos y mensajes | Strings, Messages |
| **Systems.JulianaCloud.Tests** | Tests unitarios | MSTest + Moq |

### Dependencias entre Proyectos

```
Web
 ├─ Api
 │   ├─ Business
 │   │   ├─ Commons
 │   │   ├─ Domain
 │   │   ├─ Interfaces
 │   │   ├─ Resources
 │   │   └─ TransferObjects
 │   ├─ Domain
 │   ├─ Interfaces
 │   ├─ Resources
 │   └─ TransferObjects
 └─ IoC/Bootstraper
     ├─ Business
     ├─ Commons
     ├─ Data
     │   ├─ Business
     │   ├─ Domain
     │   ├─ Interfaces
     │   └─ Resources
     └─ Interfaces
```

**Regla de oro**: Las capas superiores dependen de las inferiores, nunca al revés.

## Patrones de Diseño Implementados

### 1. Repository Pattern
**Ubicación**: `Systems.JulianaCloud.Data/Repository.cs`

```csharp
public interface IRepository<T> where T : class
{
    void Add(T entity);
    void Remove(T entity);
    T Find(Expression<Func<T, bool>> predicate);
    IEnumerable<T> GetAll();
    T FindSingle(Expression<Func<T, bool>> predicate);
    IQueryable<T> AsQuerable();
}
```

**Propósito**: Abstracción genérica del acceso a datos.

### 2. Unit of Work Pattern
**Ubicación**: `Systems.JulianaCloud.Data/UnitOfWork.cs`

```csharp
public interface IUnitOfWork : IDisposable
{
    IRepositoryCollection Repositories { get; }
    void CommitChanges();
    void Initialize();
    void InitializeAuth(string company);
}
```

**Propósito**: Coordinar transacciones y cambios en múltiples repositorios.

### 3. Generic CRUD Pattern
**Ubicación**:
- Controller: `Systems.JulianaCloud.Api/Controllers/BaseCrudController.cs`
- Service: `Systems.JulianaCloud.Business/Services/BasicCrudService.cs`

**Propósito**: Eliminar código repetitivo para operaciones CRUD estándar.

**Ejemplo de uso**:
```csharp
public class PositionController : BaseCrudController<PositionTO, Position, short>
{
    // Hereda automáticamente: GetAll, GetBy, Create, Update, Delete
}
```

### 4. Pipeline Pattern
**Ubicación**: `Systems.JulianaCloud.Business/Pipelines/`

**Componentes**:
- `IEntityTransformationPipeline` - Orquestador
- `IEntityTransformPipe` - Interface para cada transformación
- `BooleanPropertyMappingTransformPipe` - Convierte bool a "S"/"N"
- `DatePropertyMappingTransformPipe` - Convierte fechas a formato "ugly"

**Propósito**: Transformar entidades antes de guardar/después de leer sin contaminar la lógica de negocio.

### 5. Dependency Injection
**Ubicación**: `Systems.JulianaCloud.IoC/IocConfig.cs`

**Registro centralizado**:
- Servicios (Scoped)
- Repositorios (Scoped)
- Pipelines (Singleton)
- AutoMapper (Singleton)
- UnitOfWork/DbContext (Scoped)

### 6. Mapper Pattern (AutoMapper)
**Ubicación**: `Systems.JulianaCloud.IoC/MappingProfile.cs`

**Propósito**: Mapeo declarativo entre Domain Entities y TransferObjects (DTOs).

### 7. Strategy Pattern (Pipelines)
Las transformaciones son estrategias intercambiables registradas en el pipeline.

### 8. Factory Pattern (Repository Collection)
```csharp
var repository = unitOfWork.Repositories.Use<Position>();
```

## Flujo de Datos en el Sistema

### Flujo de Lectura (GET)
```
1. Cliente HTTP → GET /api/employee-positions/
2. PositionController.GetAll()
   └─ BaseCrudController<PositionTO, Position, short>
3. IBasicCrudService.GetAll()
   └─ BasicCrudService
4. unitOfWork.Repositories.Use<Position>().GetAll()
5. Entity Framework Core → SQL Server
6. List<Position> (Domain)
7. AutoMapper → List<PositionTO> (DTO)
8. Pipeline Transform (opcional)
9. JSON Response → Cliente
```

### Flujo de Escritura (POST/PUT)
```
1. Cliente HTTP → POST /api/employee-positions/
2. PositionController.Create(PositionTO dto)
3. BasicCrudService.Create(dto)
4. AutoMapper → Position (Domain Entity)
5. Calcular Key (autoincremento)
6. EntityTransformationPipeline.Run(entity)
   ├─ BooleanPropertyMappingTransformPipe
   └─ DatePropertyMappingTransformPipe
7. unitOfWork.Repositories.Use<Position>().Add(entity)
8. unitOfWork.CommitChanges()
9. Entity Framework Core → SQL Server
10. AutoMapper → PositionTO
11. JSON Response → Cliente
```

## Tecnologías y Frameworks

### Backend Stack
| Tecnología | Versión | Propósito |
|------------|---------|-----------|
| .NET Core | 3.1 | Framework principal |
| Entity Framework Core | 3.1.9 | ORM |
| EF Proxies | 3.1.9 | Lazy loading |
| AutoMapper | 10.1.1 | Object mapping |
| System.IdentityModel.Tokens.Jwt | 6.7.1 | JWT authentication |
| Microsoft.AspNetCore.Authentication.JwtBearer | 3.1.25 | JWT middleware |

### Frontend Stack
| Tecnología | Propósito |
|------------|-----------|
| Angular | SPA Framework |
| TypeScript | Lenguaje |
| angular.json | Configuración |

### Testing Stack
| Tecnología | Versión | Propósito |
|------------|---------|-----------|
| MSTest | 2.1.0 | Framework de testing |
| Moq | 4.18.1 | Mocking |
| coverlet | 1.2.0 | Code coverage |

### Base de Datos
- **Motor**: SQL Server
- **Estrategia de conexión**: Multi-tenancy con connection strings parametrizados
- **Migraciones**: No detectadas (posiblemente manual)

## Características Especiales del Sistema

### 1. Multi-Tenancy
**Implementación**: Base de datos por empresa

**Métodos clave**:
```csharp
// Inicialización por empresa
unitOfWork.InitializeAuth(string companyCode);
```

**JWT Claims incluyen**:
- `CompanyCode` - Código de empresa
- `Company` - Nombre de empresa
- `Code` - ID de usuario
- `Name` - Nombre de usuario

### 2. Autenticación en Dos Fases

**Fase 1 - Primary Login**:
- Contra tabla `AppUser` (base de datos global)
- Valida credenciales básicas

**Fase 2 - Secondary Login**:
- Contra tabla `User` (base de datos de empresa específica)
- Genera JWT token con claims de empresa

**Controladores**:
- `AuthController` - Login principal
- `SecurityController` - Login secundario

### 3. Dynamic Repository Registration
```csharp
// En UnitOfWork.Initialize()
RegisterRepository<Position>();
RegisterRepository<Zone>();
RegisterRepository<Company>();
RegisterRepository<Department>();
// ... 12+ más
```

**Ventaja**: Agregar nuevas entidades solo requiere agregar una línea.

### 4. IChangeableProperties Tracking
**Ubicación**: `Systems.JulianaCloud.TransferObjects/IChangeableProperties.cs`

**Propósito**: Los DTOs rastrean qué propiedades cambiaron para actualizaciones parciales.

### 5. Lambda Expression Builder
**Ubicación**: `Systems.JulianaCloud.Business/LambdaBuilder.cs`

**Propósito**: Construir predicados dinámicos para filtrado genérico.

**Ejemplo de endpoint**:
```
GET /api/positions/by/name/contains/manager
```

## Entidades del Dominio (83 clases)

### Categorías Principales

#### Employee Module
- `Employee` - Empleados
- `Position` - Cargos
- `Withdrawal` - Retiros
- `Candidate` - Candidatos
- `Approvals` - Aprobaciones
- `ApprovalPayments` - Pagos aprobados

#### General Configuration
- `Company` - Empresas
- `Branch` / `Subsidiary` - Sucursales
- `Department` - Departamentos
- `City` - Ciudades
- `Country` - Países
- `Zone` - Zonas

#### Colombian Labor System
- `EPS` - Entidades Promotoras de Salud
- `ARL` - Administradoras de Riesgos Laborales
- `AFP` - Administradoras de Fondos de Pensiones
- `Caja` - Cajas de compensación
- `CESANTIAS` - Cesantías

#### Administrative
- `User` - Usuarios del sistema
- `AppUser` - Usuarios de autenticación global
- `AccessControl` - Control de acceso
- `Audit` - Auditoría
- `Holidays` - Días festivos
- `Bank` - Bancos
- `SalaryClassification` - Clasificaciones salariales

#### Specialized
- `CostCenter` - Centros de costo
- `BiosecurityQuestions` - Preguntas de bioseguridad
- `Novelties` - Novedades
- `Reports` - Reportes

### Estructura de Entidad Estándar
```csharp
public class Position : IKeyEntity<short>
{
    [Key]
    [Column("position_key")]
    public short Key { get; set; }

    [Column("position_name")]
    [StringLength(50)]
    public string Name { get; set; }

    [Column("position_active")]
    public string Active { get; set; } // "S" o "N"

    // ... más propiedades
}
```

## Controladores API (26 Controllers)

### Controladores de Autenticación
- `AuthController` - Login primario
- `SecurityController` - Login secundario, tokens

### Controladores de Empleados
- `PositionController` - Cargos
- `WithdrawalController` - Retiros
- `CandidateController` - Candidatos
- `EmployeeMasterController` - Maestro de empleados

### Controladores Generales
- `CompanyController` - Empresas
- `BranchController` / `SubsidiaryController` - Sucursales
- `DepartmentController` - Departamentos
- `CityController` - Ciudades
- `CountryController` - Países
- `ZoneController` - Zonas

### Controladores de Nómina
- `EPSController` - EPS
- `ARLController` - ARL
- `AFPController` - AFP
- `CajaController` - Cajas
- `CESANTIASController` - Cesantías

### Controladores Administrativos
- `UserController` - Usuarios
- `AccessControlController` - Control de acceso
- `HolidaysController` - Festivos
- `BankController` - Bancos
- `CostCenterController` - Centros de costo

### Controladores Especializados
- `NoveltyMasterController` - Maestro de novedades
- `NoveltiesReportController` - Reportes de novedades
- `BiosecurityQuestionsController` - Bioseguridad

## Servicios de Negocio (22 Services)

### Servicios Core
- `BasicCrudService<TEntityTO, TEntityDomain, TKey>` - CRUD genérico base

### Servicios de Autenticación
- `AuthService` - Autenticación primaria
- `SecurityService` - Tokens y seguridad

### Servicios de Empleados
- `EmployeeMasterService` - Gestión de empleados
- `NoveltyMasterService` - Gestión de novedades
- `NoveltiesReportService` - Reportes de novedades

### Servicios Especializados (19 más)
Cada entidad principal tiene su servicio dedicado que hereda de `BasicCrudService`.

## Inicialización del Sistema (Bootstrap)

### Secuencia de Inicio
```
1. Program.cs
   └─ CreateWebHostBuilder()
      └─ UseStartup<Startup>()

2. Startup.cs → ConfigureServices()
   ├─ EnviromentConfig.SetEnviroment(configuration)
   ├─ IocConfig.RegisterAppConfig(services)
   ├─ IocConfig.RegisterServices(services)
   ├─ AddAuthentication(JwtBearer)
   └─ AddSpaStaticFiles()

3. Startup.cs → Configure()
   ├─ UseAuthentication()
   ├─ UseAuthorization()
   ├─ IocConfig.ConfigureEntityTransformationPipeline(app)
   └─ UseSpa(angular)

4. IocConfig.cs
   ├─ RegisterAppConfig() - Settings
   ├─ RegisterServices() - DI Container
   │   ├─ AutoMapper
   │   ├─ UnitOfWork (DbContext)
   │   ├─ RepositoryCollection
   │   ├─ BasicCrudService<>
   │   └─ Servicios específicos
   └─ ConfigureEntityTransformationPipeline()
       ├─ Register BooleanPropertyMappingTransformPipe
       └─ Register DatePropertyMappingTransformPipe
```

## Archivos Clave para Modificaciones

### Para agregar una nueva entidad:

1. **Domain Entity**: `Systems.JulianaCloud.Domain/[EntityName].cs`
   ```csharp
   public class MyEntity : IKeyEntity<int> { ... }
   ```

2. **Transfer Object**: `Systems.JulianaCloud.TransferObjects/[EntityName]TO.cs`
   ```csharp
   public class MyEntityTO { ... }
   ```

3. **AutoMapper Profile**: `Systems.JulianaCloud.IoC/MappingProfile.cs`
   ```csharp
   CreateMap<MyEntity, MyEntityTO>().ReverseMap();
   ```

4. **Register Repository**: `Systems.JulianaCloud.Data/UnitOfWork.cs`
   ```csharp
   RegisterRepository<MyEntity>();
   ```

5. **Controller**: `Systems.JulianaCloud.Api/Controllers/MyEntityController.cs`
   ```csharp
   public class MyEntityController : BaseCrudController<MyEntityTO, MyEntity, int> { }
   ```

6. **Interface** (opcional): `Systems.JulianaCloud.Interfaces/IMyEntityService.cs`

7. **Service** (opcional si requiere lógica custom): `Systems.JulianaCloud.Business/Services/MyEntityService.cs`

8. **Register Service**: `Systems.JulianaCloud.IoC/IocConfig.cs`
   ```csharp
   services.AddScoped<IMyEntityService, MyEntityService>();
   ```

### Para modificar la autenticación:
- `Systems.JulianaCloud.Api/Controllers/AuthController.cs`
- `Systems.JulianaCloud.Api/Controllers/SecurityController.cs`
- `Systems.JulianaCloud.Business/Services/AuthService.cs`
- `Systems.JulianaCloud.Business/Services/SecurityService.cs`
- `Systems.JulianaCloud.Web/Startup.cs` (sección AddAuthentication)

### Para modificar transformaciones de datos:
- `Systems.JulianaCloud.Business/Pipelines/EntityTransformationPipeline.cs`
- Agregar nuevos pipes en `Systems.JulianaCloud.Business/Pipelines/Pipes/`
- Registrar en `Systems.JulianaCloud.IoC/IocConfig.cs` → `ConfigureEntityTransformationPipeline()`

### Para modificar acceso a datos:
- `Systems.JulianaCloud.Data/Repository.cs` (lógica genérica)
- `Systems.JulianaCloud.Data/UnitOfWork.cs` (DbContext, transacciones)
- `Systems.JulianaCloud.Data/RepositoryCollection.cs` (registro dinámico)

### Para modificar configuración:
- `Systems.JulianaCloud.Web/appsettings.json` (configuración base)
- `Systems.JulianaCloud.Web/appsettings.Development.json` (desarrollo)
- `Systems.JulianaCloud.Commons/EnviromentConfig.cs` (carga de config)

## Interfaces Estratégicas

### IKeyEntity<TKey>
**Ubicación**: `Systems.JulianaCloud.Domain/IKeyEntity.cs`

Todas las entidades de dominio deben implementar esta interfaz:
```csharp
public interface IKeyEntity<TKey>
{
    TKey Key { get; set; }
}
```

### IRepository<T>
**Ubicación**: `Systems.JulianaCloud.Interfaces/IRepository.cs`

Contrato para acceso genérico a datos.

### IUnitOfWork
**Ubicación**: `Systems.JulianaCloud.Interfaces/IUnitOfWork.cs`

Contrato para Unit of Work pattern.

### IBasicCrudService<TEntityTO, TEntityDomain, TKey>
**Ubicación**: `Systems.JulianaCloud.Interfaces/IBasicCrudService.cs`

Contrato para servicios CRUD genéricos.

### IEntityTransformationPipeline
**Ubicación**: `Systems.JulianaCloud.Business/Pipelines/IEntityTransformationPipeline.cs`

Pipeline de transformación de entidades.

### IEntityTransformPipe
**Ubicación**: `Systems.JulianaCloud.Business/Pipelines/IEntityTransformPipe.cs`

Contrato para cada transformación individual.

### ILambdaBuilder
**Ubicación**: `Systems.JulianaCloud.Business/ILambdaBuilder.cs`

Constructor de expresiones lambda dinámicas.

### IChangeableProperties
**Ubicación**: `Systems.JulianaCloud.TransferObjects/IChangeableProperties.cs`

Rastreo de propiedades modificadas en DTOs.

## Convenciones de Código

### Naming Conventions
- **Entities**: PascalCase sin sufijos (ej: `Position`, `Employee`)
- **Transfer Objects**: PascalCase + sufijo "TO" (ej: `PositionTO`, `EmployeeTO`)
- **Controllers**: PascalCase + sufijo "Controller" (ej: `PositionController`)
- **Services**: PascalCase + sufijo "Service" (ej: `AuthService`)
- **Interfaces**: "I" + PascalCase (ej: `IRepository`, `IUnitOfWork`)

### Column Naming (Base de Datos)
- **Formato**: `[tablename]_[columnname]` en snake_case
- **Ejemplo**:
  - Tabla `Position` → columnas: `position_key`, `position_name`, `position_active`
  - Tabla `Employee` → columnas: `employee_key`, `employee_name`, `employee_status`

### Boolean Representation
- **En código C#**: `bool` (true/false)
- **En base de datos**: `string` ("S"/"N")
- **Transformación**: Automática vía `BooleanPropertyMappingTransformPipe`

### Date Representation
- **En código C#**: `DateTime` o `DateTime?`
- **En base de datos**: formato "ugly" (string custom)
- **Transformación**: Automática vía `DatePropertyMappingTransformPipe`

## Seguridad

### JWT Configuration
**Ubicación**: `Systems.JulianaCloud.Web/Startup.cs`

**Parámetros**:
- **Secret Key**: Base64 string en `appsettings.json`
- **Issuer**: Configurado en settings
- **Audience**: Configurado en settings
- **Expiration**: 8 horas
- **Algorithm**: HS256

### JWT Claims Estándar
```csharp
new Claim("CompanyCode", "empresa123")
new Claim("Company", "Nombre Empresa S.A.")
new Claim("Code", "user123")
new Claim("Name", "Juan Pérez")
```

### Dos Niveles de Autenticación

1. **AppUser** (Global):
   - Tabla: `AppUser`
   - Columnas: `appuser_key`, `appuser_login`, `appuser_password`
   - Controlador: `AuthController`

2. **User** (Por Empresa):
   - Tabla: `User` (en BD de empresa)
   - Columnas: `user_key`, `user_login`, `user_password`
   - Controlador: `SecurityController`

### IMPORTANTE - Problemas de Seguridad Detectados
⚠️ **Passwords aparentemente en texto plano** - Considerar implementar hashing (BCrypt, PBKDF2, Argon2)

## Configuración de Entorno

### Connection Strings
**Ubicación**: `Systems.JulianaCloud.Web/appsettings.json`

**Formato Multi-Tenancy**:
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=...;Database={CompanyCode};User={User};Password={Password}"
  }
}
```

### Variables de Entorno
**Ubicación**: `Systems.JulianaCloud.Commons/EnviromentConfig.cs`

Maneja carga dinámica desde `appsettings.json` y `appsettings.{Environment}.json`.

## Testing

### Framework
**MSTest 2.1.0** + **Moq 4.18.1**

### Proyecto de Tests
`Systems.JulianaCloud.Tests`

### Estructura de Tests (a verificar)
- Unit tests para servicios
- Mocking de repositorios y UnitOfWork
- Coverage via coverlet

### Comando para ejecutar tests
```bash
dotnet test Systems.JulianaCloud.Tests/Systems.JulianaCloud.Tests.csproj
```

## Frontend (Angular)

### Configuración
**Ubicación**: `Systems.JulianaCloud.Web/app/angular.json`

### Dev Server
- **Puerto**: 4200
- **Proxy**: Configurado en ASP.NET Core Startup para desarrollo

### Integración con Backend
- SPA integrada vía `UseSpa()` en `Startup.cs`
- Assets servidos desde `wwwroot`
- Build output en `dist/`

## Limitaciones y Deuda Técnica

### Crítico
- ⚠️ **.NET Core 3.1 EOL** (fin de soporte: diciembre 2022) - Migrar a .NET 6/8
- ⚠️ **Passwords sin hash** - Implementar hashing seguro
- ⚠️ **SQL Injection potencial** - Revisar queries dinámicos

### Importante
- ⏱️ **Sin paginación** - GetAll() carga todo en memoria
- 📝 **Falta documentación XML** - Agregar XML comments
- 🧪 **Cobertura de tests desconocida** - Medir y ampliar
- 🔍 **Sin logging estructurado** - Considerar Serilog

### Mejoras Deseables
- 🚀 **Sin caching** - Implementar Redis o MemoryCache
- 🔄 **Sin versionado de API** - Agregar versionado de endpoints
- 📊 **Sin health checks** - Agregar endpoints de salud
- 🐳 **Sin containerización** - Agregar Dockerfile

## Casos de Uso Comunes

### 1. Agregar una nueva entidad CRUD simple
Seguir los pasos en "Para agregar una nueva entidad" (arriba).

**Tiempo estimado**: 30-60 minutos para entidad básica.

### 2. Agregar lógica de negocio custom
1. Crear interface en `Systems.JulianaCloud.Interfaces/`
2. Implementar en `Systems.JulianaCloud.Business/Services/`
3. Registrar en `Systems.JulianaCloud.IoC/IocConfig.cs`
4. Inyectar en controller

### 3. Agregar un nuevo pipe de transformación
1. Crear clase en `Systems.JulianaCloud.Business/Pipelines/Pipes/`
2. Implementar `IEntityTransformPipe`
3. Registrar en `IocConfig.ConfigureEntityTransformationPipeline()`

### 4. Modificar mapeo de entidad
Editar `Systems.JulianaCloud.IoC/MappingProfile.cs`

### 5. Agregar endpoint custom en controller existente
Sobrescribir o agregar método en controller que hereda de `BaseCrudController`.

## Comandos Útiles

### Scripts de Automatización (Recomendado)

```bash
# Configuración inicial (primera vez)
setup-local.bat

# Iniciar backend
start-backend.bat

# Detener backend
stop-backend.bat

# Verificar estado del backend
check-backend.bat
```

**Ubicación**: `c:\ProyectosWork\AppBase\`

**Descripción de scripts**:
- `setup-local.bat`: Verifica .NET SDK, restaura paquetes, compila proyecto, configura certificados HTTPS, verifica SQL Server
- `start-backend.bat`: Restaura, compila e inicia el backend en segundo plano, abre el navegador automáticamente
- `stop-backend.bat`: Detiene todos los procesos del backend ejecutándose
- `check-backend.bat`: Muestra el estado actual, puertos en uso, y últimas líneas del log

**Archivos generados por los scripts**:
- `backend.pid`: Almacena el PID del proceso en ejecución
- `backend.log`: Log de ejecución del backend

### Comandos Manuales de .NET

#### Build
```bash
dotnet build Systems.JulianaCloud.sln
```

#### Run API
```bash
dotnet run --project Systems.JulianaCloud.Web/Systems.JulianaCloud.Web.csproj
```

#### Run API con auto-reload (modo watch)
```bash
dotnet watch run --project Systems.JulianaCloud.Web/Systems.JulianaCloud.Web.csproj
```

#### Run Tests
```bash
dotnet test Systems.JulianaCloud.Tests/Systems.JulianaCloud.Tests.csproj
```

#### Restore NuGet Packages
```bash
dotnet restore
```

#### Clean Build
```bash
dotnet clean
```

#### Angular Dev Server (desde Web/app/)
```bash
cd Systems.JulianaCloud.Web/app
npm start
```

## Glosario de Términos Colombianos

| Término | Significado |
|---------|-------------|
| **EPS** | Entidad Promotora de Salud (seguro de salud) |
| **ARL** | Administradora de Riesgos Laborales (seguro de riesgos) |
| **AFP** | Administradora de Fondos de Pensiones (pensión) |
| **Caja** | Caja de Compensación Familiar (beneficios sociales) |
| **Cesantías** | Auxilio de cesantías (prestación social) |
| **Novedades** | Eventos en nómina (incapacidades, horas extra, etc.) |
| **Retiro** | Terminación de contrato laboral |

## Contactos y Recursos

### Documentación Oficial
- **.NET Core 3.1**: https://docs.microsoft.com/en-us/dotnet/core/
- **Entity Framework Core**: https://docs.microsoft.com/en-us/ef/core/
- **AutoMapper**: https://docs.automapper.org/
- **Angular**: https://angular.io/docs

### Estado del Proyecto
- **Branch principal**: `main`
- **Último commit**: `9bbcef9 Cargue Inicial #5`
- **Git status**: Múltiples archivos `obj/` modificados (archivos generados)

---

## Notas de Última Actualización

**Fecha**: 2025-12-29
**Versión de este documento**: 1.0
**Analizado por**: Claude (Sonnet 4.5)
**Estado del proyecto**: Análisis inicial completo

### Próximos Pasos Recomendados
1. ✅ Documentación completa creada (este archivo)
2. ⏭️ Planificar migración a .NET 6/8
3. ⏭️ Implementar hashing de passwords
4. ⏭️ Agregar paginación a endpoints GetAll
5. ⏭️ Ampliar cobertura de tests
6. ⏭️ Agregar logging estructurado
7. ⏭️ Implementar health checks
8. ⏭️ Documentar APIs con Swagger/OpenAPI

---

*Este documento debe actualizarse cada vez que se realicen cambios arquitectónicos significativos al proyecto.*
