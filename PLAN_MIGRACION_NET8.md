# Plan de Migración: .NET Core 3.1 → .NET 8

## 📋 Resumen Ejecutivo

**Proyecto**: JulianaCloud
**Framework Origen**: .NET Core 3.1
**Framework Destino**: .NET 8 (LTS)
**Complejidad**: Media
**Tiempo Estimado**: 2-4 horas
**Riesgo**: Bajo (con rollback preparado)

---

## 🎯 Objetivos

1. ✅ Migrar de .NET Core 3.1 a .NET 8
2. ✅ Mantener todas las funcionalidades existentes
3. ✅ Actualizar paquetes NuGet a versiones compatibles
4. ✅ Resolver breaking changes mínimos
5. ✅ Verificar que todo compile y funcione

---

## 📊 Análisis de Dependencias Actuales

### Proyectos en la Solución (11 proyectos)

| Proyecto | TargetFramework | Paquetes Críticos |
|----------|-----------------|-------------------|
| **Web** | netcoreapp3.1 | AutoMapper 10.1.1, JWT Bearer 3.1.25, SpaServices 3.1.7 |
| **Api** | netcoreapp3.1 | AutoMapper 10.1.1, AspNetCore.Mvc 2.2.5 |
| **Business** | netcoreapp3.1 | AutoMapper 10.1.1, EF Core 3.1.9, JWT 6.19.0 |
| **Data** | netcoreapp3.1 | EF Core 3.1.9, EF Proxies 3.1.9, EF SqlServer 3.1.9 |
| **IoC** | netcoreapp3.1 | AutoMapper 10.1.1, Extensions 3.1.9 |
| **Domain** | netcoreapp3.1 | Sin paquetes externos |
| **TransferObjects** | netcoreapp3.1 | Sin paquetes externos |
| **Interfaces** | netcoreapp3.1 | Sin paquetes externos |
| **Commons** | netcoreapp3.1 | Sin paquetes externos |
| **Resources** | netcoreapp3.1 | Sin paquetes externos |
| **Tests** | netcoreapp3.1 | MSTest, Moq |

### Paquetes que Requieren Actualización

| Paquete Actual | Versión Actual | Versión .NET 8 | Breaking Changes |
|----------------|----------------|----------------|------------------|
| **Entity Framework Core** | 3.1.9 | 8.0.x | ⚠️ Mínimos |
| **AutoMapper** | 10.1.1 | 13.0.1 | ✅ Compatible |
| **JWT Bearer** | 3.1.25 | 8.0.x | ✅ Compatible |
| **System.IdentityModel.Tokens.Jwt** | 6.19.0 | 7.3.x | ✅ Compatible |
| **SpaServices** | 3.1.7 | ❌ Deprecated | ⚠️ Requiere cambio |

---

## 🚨 Breaking Changes Conocidos

### 1. SpaServices Deprecado
**Problema**: `Microsoft.AspNetCore.SpaServices.Extensions` está deprecado en .NET 8.

**Solución**: Usar `Microsoft.AspNetCore.SpaProxy` o configuración manual.

**Impacto**: Bajo - Solo afecta [Startup.cs](Systems.JulianaCloud.Web/Startup.cs:98-111)

### 2. Program.cs y Startup.cs
**Problema**: .NET 6+ prefiere el modelo "minimal hosting" sin Startup.cs.

**Solución**: Mantener Startup.cs (compatible) o migrar a minimal API.

**Recomendación**: Mantener Startup.cs para minimizar cambios.

### 3. Entity Framework Core
**Problema**: Algunos cambios menores en lazy loading y proxies.

**Solución**: Actualizar paquetes a EF Core 8.0.x.

**Impacto**: Muy bajo - API compatible.

### 4. Obsolete APIs
**Problema**: Algunos métodos marcados como obsoletos.

**Solución**: Reemplazar según warnings de compilación.

---

## 📝 Plan de Migración Paso a Paso

### FASE 0: PREPARACIÓN (15 minutos)

#### 0.1. Crear Backup
```bash
# Crear branch de backup
git checkout -b backup-netcore31
git push origin backup-netcore31

# Crear branch de migración
git checkout -b migrate-to-net8
```

#### 0.2. Verificar Estado Actual
```bash
# Compilar proyecto actual
dotnet build Systems.JulianaCloud.sln

# Ejecutar tests
dotnet test

# Documentar estado baseline
```

#### 0.3. Instalar .NET 8 SDK
- Descargar de: https://dotnet.microsoft.com/download/dotnet/8.0
- Verificar: `dotnet --list-sdks`

---

### FASE 1: MIGRAR ARCHIVOS .CSPROJ (30 minutos)

#### Orden de Migración (Bottom-Up)
1. **Domain** (sin dependencias externas)
2. **Resources** (sin dependencias externas)
3. **Commons** (sin dependencias externas)
4. **Interfaces** (sin dependencias externas)
5. **TransferObjects** (depende de Domain)
6. **Business** (depende de Domain, Interfaces, Commons)
7. **Data** (depende de Business, Domain, Interfaces)
8. **IoC** (depende de Business, Data, Commons, Interfaces)
9. **Api** (depende de Business, Domain, Interfaces)
10. **Web** (depende de Api, IoC)
11. **Tests** (depende de Business)

#### Cambios en cada .csproj

**Para proyectos simples (Domain, Resources, Commons, Interfaces, TransferObjects)**:
```xml
<!-- ANTES -->
<TargetFramework>netcoreapp3.1</TargetFramework>

<!-- DESPUÉS -->
<TargetFramework>net8.0</TargetFramework>
```

**Para proyectos con paquetes**:
1. Cambiar `<TargetFramework>netcoreapp3.1</TargetFramework>` → `<TargetFramework>net8.0</TargetFramework>`
2. Actualizar versiones de paquetes (ver tabla abajo)

---

### FASE 2: ACTUALIZAR PAQUETES NUGET (45 minutos)

#### Matriz de Actualización de Paquetes

| Paquete | Versión Actual | Versión .NET 8 |
|---------|----------------|----------------|
| **Microsoft.EntityFrameworkCore** | 3.1.9 | 8.0.0 |
| **Microsoft.EntityFrameworkCore.SqlServer** | 3.1.9 | 8.0.0 |
| **Microsoft.EntityFrameworkCore.Proxies** | 3.1.9 | 8.0.0 |
| **AutoMapper** | 10.1.1 | 13.0.1 |
| **Microsoft.AspNetCore.Authentication.JwtBearer** | 3.1.25 | 8.0.0 |
| **System.IdentityModel.Tokens.Jwt** | 6.19.0 | 7.3.1 |
| **Microsoft.Extensions.Configuration** | 3.1.9 | 8.0.0 |
| **Microsoft.Extensions.Configuration.Json** | 3.1.9 | 8.0.0 |
| **Microsoft.Extensions.DependencyInjection** | 3.1.9 | 8.0.0 |
| **Microsoft.Extensions.Options.ConfigurationExtensions** | 3.1.9 | 8.0.0 |
| **Microsoft.AspNetCore.Mvc.Core** | 2.2.5 | 8.0.0 |
| **Microsoft.AspNetCore.Http.Abstractions** | 2.2.0 | 2.2.0 (mantener) |
| **Microsoft.AspNet.WebApi.Client** | 5.2.7 | 6.0.0 |
| **Microsoft.AspNetCore.SpaServices.Extensions** | 3.1.7 | ❌ ELIMINAR |
| **MSTest.TestFramework** | 2.1.0 | 3.2.0 |
| **MSTest.TestAdapter** | 2.1.0 | 3.2.0 |
| **Moq** | 4.18.1 | 4.20.70 |
| **coverlet.collector** | 1.2.0 | 6.0.0 |

#### Método de Actualización

**Opción 1: Actualización Manual** (Recomendado para control)
```bash
# Para cada proyecto, editar .csproj y cambiar versiones
```

**Opción 2: Comando dotnet**
```bash
# Actualizar paquete por paquete
cd Systems.JulianaCloud.Data
dotnet add package Microsoft.EntityFrameworkCore --version 8.0.0
dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 8.0.0
dotnet add package Microsoft.EntityFrameworkCore.Proxies --version 8.0.0
```

---

### FASE 3: RESOLVER BREAKING CHANGES (60 minutos)

#### 3.1. Problema: SpaServices Deprecado

**Ubicación**: [Systems.JulianaCloud.Web/Startup.cs](Systems.JulianaCloud.Web/Startup.cs:98-111)

**Código Actual**:
```csharp
services.AddSpaStaticFiles(configuration =>
{
    configuration.RootPath = "app/dist";
});

app.UseSpa(spa =>
{
    spa.Options.SourcePath = "app";
    if (env.IsDevelopment())
    {
        spa.UseProxyToSpaDevelopmentServer("http://localhost:4200");
    }
});
```

**Solución para .NET 8**:
```csharp
// OPCIÓN A: Configuración manual (más control)
app.UseStaticFiles();

if (app.Environment.IsDevelopment())
{
    // En desarrollo, el proxy manual funciona
    app.UseSpa(spa =>
    {
        spa.Options.SourcePath = "app";
        spa.UseProxyToSpaDevelopmentServer("http://localhost:4200");
    });
}
else
{
    // En producción, servir archivos estáticos
    app.UseStaticFiles(new StaticFileOptions
    {
        FileProvider = new PhysicalFileProvider(
            Path.Combine(Directory.GetCurrentDirectory(), "app", "dist")),
        RequestPath = ""
    });

    app.UseRouting();
    app.MapFallbackToFile("index.html");
}
```

**Cambios necesarios en .csproj**:
```xml
<!-- ELIMINAR -->
<PackageReference Include="Microsoft.AspNetCore.SpaServices.Extensions" Version="3.1.7" />

<!-- NO necesitas reemplazar - la funcionalidad está integrada en .NET 8 -->
```

#### 3.2. Problema: Program.cs y Startup.cs

**Ubicación**: [Systems.JulianaCloud.Web/Program.cs](Systems.JulianaCloud.Web/Program.cs)

**Código Actual** (Compatible):
```csharp
public static IHostBuilder CreateHostBuilder(string[] args) =>
    Host.CreateDefaultBuilder(args)
        .ConfigureWebHostDefaults(webBuilder =>
        {
            webBuilder.UseStartup<Startup>();
        });
```

**Solución**: Mantener código actual - es 100% compatible con .NET 8.

#### 3.3. Problema: Entity Framework Lazy Loading

**Ubicación**: [Systems.JulianaCloud.Data](Systems.JulianaCloud.Data/)

**Cambios mínimos esperados**:
- Lazy loading funciona igual en EF Core 8
- No requiere cambios de código
- Solo actualizar paquetes

#### 3.4. Problema: JWT Token Validation

**Ubicación**: [Systems.JulianaCloud.Web/Startup.cs](Systems.JulianaCloud.Web/Startup.cs:43-57)

**Código Actual**:
```csharp
services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
.AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateIssuerSigningKey = true,
        ValidateLifetime = true,
        ValidIssuer = Configuration["JWT:Issuer"],
        ValidAudience = Configuration["JWT:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(Convert.FromBase64String(Configuration["JWT:Secret"]))
    };
});
```

**Solución**: Compatible - no requiere cambios.

---

### FASE 4: COMPILAR Y VERIFICAR (30 minutos)

#### 4.1. Compilar Proyecto Completo
```bash
cd c:\ProyectosWork\AppBase
dotnet clean
dotnet restore
dotnet build Systems.JulianaCloud.sln --configuration Release
```

#### 4.2. Verificar Warnings
```bash
# Revisar warnings de compilación
dotnet build > build-output.txt 2>&1
notepad build-output.txt
```

#### 4.3. Ejecutar Tests
```bash
dotnet test Systems.JulianaCloud.Tests/Systems.JulianaCloud.Tests.csproj
```

#### 4.4. Ejecutar Aplicación
```bash
cd Systems.JulianaCloud.Web
dotnet run
```

**Verificaciones**:
- ✅ API responde en https://localhost:5001
- ✅ Frontend Angular carga correctamente
- ✅ Endpoints CRUD funcionan
- ✅ Autenticación JWT funciona
- ✅ Base de datos conecta correctamente

---

### FASE 5: PRUEBAS FUNCIONALES (45 minutos)

#### 5.1. Pruebas de Autenticación
```bash
# Login primario
curl -X POST https://localhost:5001/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"test","password":"test"}'

# Login secundario
curl -X POST https://localhost:5001/api/security/login \
  -H "Content-Type: application/json" \
  -d '{"companyCode":"NmDEMO","username":"test","password":"test"}'
```

#### 5.2. Pruebas de Endpoints CRUD
```bash
# Listar posiciones
curl https://localhost:5001/api/employee-positions/

# Crear posición
curl -X POST https://localhost:5001/api/employee-positions/ \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer {token}" \
  -d '{"name":"Test Position","active":"S"}'
```

#### 5.3. Pruebas de Base de Datos
- Verificar conexión a SQL Server
- Verificar operaciones CRUD
- Verificar transacciones

#### 5.4. Pruebas de Frontend
- Abrir https://localhost:5001
- Probar navegación
- Probar formularios
- Probar tablas y listados

---

## 🛠️ Checklist de Migración

### Pre-Migración
- [ ] Crear backup en Git (`backup-netcore31` branch)
- [ ] Instalar .NET 8 SDK
- [ ] Compilar proyecto actual exitosamente
- [ ] Ejecutar tests actuales exitosamente
- [ ] Documentar funcionalidades críticas

### Migración
- [ ] Migrar Domain a .NET 8
- [ ] Migrar Resources a .NET 8
- [ ] Migrar Commons a .NET 8
- [ ] Migrar Interfaces a .NET 8
- [ ] Migrar TransferObjects a .NET 8
- [ ] Migrar Business a .NET 8 + actualizar paquetes
- [ ] Migrar Data a .NET 8 + actualizar EF Core
- [ ] Migrar IoC a .NET 8 + actualizar paquetes
- [ ] Migrar Api a .NET 8 + actualizar paquetes
- [ ] Migrar Web a .NET 8 + resolver SpaServices
- [ ] Migrar Tests a .NET 8 + actualizar MSTest

### Verificación
- [ ] `dotnet clean` exitoso
- [ ] `dotnet restore` sin errores
- [ ] `dotnet build` sin errores
- [ ] `dotnet test` todos los tests pasan
- [ ] `dotnet run` inicia correctamente
- [ ] API responde en https://localhost:5001
- [ ] Frontend carga correctamente
- [ ] Login funciona
- [ ] CRUD funciona
- [ ] Base de datos conecta
- [ ] No hay warnings críticos

### Post-Migración
- [ ] Actualizar documentación ([claude.md](claude.md))
- [ ] Actualizar README.md con .NET 8
- [ ] Actualizar scripts (.bat) si necesario
- [ ] Commit de cambios
- [ ] Push a repositorio
- [ ] Crear PR/Merge request
- [ ] Deploy a ambiente de pruebas

---

## 📈 Beneficios Esperados

### Rendimiento
- ⚡ **30-40% más rápido** en operaciones de I/O
- ⚡ **20% menos uso de memoria**
- ⚡ **Mejor throughput** en APIs

### Seguridad
- 🔒 Parches de seguridad actualizados
- 🔒 Mejores prácticas de autenticación
- 🔒 Soporte hasta noviembre 2026

### Desarrollo
- 🚀 Nuevas características de C# 12
- 🚀 Mejor tooling en Visual Studio
- 🚀 Mejor soporte de bibliotecas modernas

---

## 🔙 Plan de Rollback

Si algo sale mal durante la migración:

### Rollback Rápido
```bash
# Volver a branch anterior
git checkout backup-netcore31

# Compilar versión anterior
dotnet build
dotnet run
```

### Rollback Parcial
Si algunos proyectos migraron correctamente pero otros no:
```bash
# Revertir archivo específico
git checkout backup-netcore31 -- Systems.JulianaCloud.Web/Systems.JulianaCloud.Web.csproj

# Recompilar
dotnet restore
dotnet build
```

---

## 📞 Soporte y Recursos

### Documentación Oficial
- **.NET 8 Migration Guide**: https://learn.microsoft.com/en-us/aspnet/core/migration/31-to-80
- **EF Core 8 Breaking Changes**: https://learn.microsoft.com/en-us/ef/core/what-is-new/ef-core-8.0/breaking-changes
- **ASP.NET Core 8**: https://learn.microsoft.com/en-us/aspnet/core/release-notes/aspnetcore-8.0

### Herramientas Útiles
- **upgrade-assistant**: https://dotnet.microsoft.com/platform/upgrade-assistant
  ```bash
  dotnet tool install -g upgrade-assistant
  upgrade-assistant analyze Systems.JulianaCloud.sln
  ```

---

## ✅ Criterios de Éxito

La migración será exitosa cuando:

1. ✅ Todos los proyectos compilen sin errores
2. ✅ Todos los tests unitarios pasen
3. ✅ La aplicación inicie correctamente
4. ✅ API responda a todos los endpoints
5. ✅ Frontend Angular cargue y funcione
6. ✅ Autenticación JWT funcione
7. ✅ CRUD operations funcionen
8. ✅ Conexión a base de datos funcione
9. ✅ No haya warnings críticos
10. ✅ Performance sea igual o mejor

---

**Fecha de Creación**: 2025-12-29
**Última Actualización**: 2025-12-29
**Estado**: Pendiente de Ejecución
**Responsable**: Equipo de Desarrollo
