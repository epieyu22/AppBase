using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Systems.JulianaCloud.Domain.Attributes;
using Systems.JulianaCloud.Domain.Generals;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain
{
    [Table("EMPRESAS")]
    public class Company : IKeyEntity<short>
    {
        #region Properties

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Codigo")]
        public short Key { get; set; }

        [Required]
        [StringLength(1)]
        [Column("Tipo_Documento")]
        public string TypeDoc { get; set; }

        [Required]
        [StringLength(9)]
        [Column("Num_Documento")]
        public string NumDoc { get; set; }

        [Required]
        [StringLength(1)]
        [Column("Digito_Verificacion")]
        public string DVer { get; set; }

        [Required]
        [StringLength(70)]
        [Column("Nombre_Empresa")]
        public string Name { get; set; }

        [Required]
        [StringLength(40)]
        [Column("Direccion")]
        public string Address { get; set; }

        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Depto")]
        public short CodDep { get; set; }
        [ForeignKey("CodDep")]
        public virtual Department Department { get; set; }

        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Ciudad")]
        public short CodCity { get; set; }
        [ForeignKey("CodCity")]
        public virtual City City { get; set; }

        [StringLength(10)]
        [Column("Tel")]
        public string? Tel { get; set; }

        [StringLength(10)]
        [Column("Fax")]
        public string? Fax { get; set; }

        [StringLength(10)]
        [Column("Clave")]
        public string? Clave { get; set; }

        [StringLength(1)]
        [Column("ModMIS")]
        public string? ModMISOld { get; set; }

        [Column("modFin")]
        [BooleanPropertyMapping(Target= "ModMISOld")]
        public bool? ModMIS { get; set; }

        [StringLength(10)]  
        [Column("Serial")]
        public string? Serial { get; set; }

        [StringLength(20)]
        [Column("Cod_Local")]
        public string? CodLocal { get; set; }

        [Column("Logo")]
        public byte[]? Logo { get; set; }

        [Key]
        [Column("LogoOpc")]
        public string? LogoOpc { get; set; }

        [Column("CargaLogoOpc")]
        public bool? LoadLogoOpc { get; set; }

        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Arp")]
        public short CodArl { get; set; }
        [ForeignKey("CodArl")]
        public virtual Arl Arl { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Sucursal_Pag")]
        public short? CodSubsiPag { get; set; }
        [ForeignKey("CodSubsiPag")]
        public virtual Subsidiary Subsidiary { get; set; }

        [Required]
        [StringLength(1)]
        [Column("Clase_Aportante")]
        public string ClassContrib { get; set; }

        [Required]
        [StringLength(1)]
        [Column("Forma_Presenta")]
        public string FormPresents { get; set; }

        [Required]
        [StringLength(8)]
        [Column("Fec_Instalacion")]
        public string FecInstallOld { get; set; }
        [Column("dateInstall")]
        [DatePropertyMapping(Target= "FecInstallOld")]
        public DateTime? FecInstall { get; set; }

        [Required]
        [StringLength(8)]
        [Column("Fec_Ult_Acceso")]
        public string FecUltAccessOld { get; set; }
        [Column("dateAccess")]
        [DatePropertyMapping(Target= "FecUltAccessOld")]
        public DateTime? FecUltAccess { get; set; }
        
        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Dias_Vigencia")]
        public short DaisValidity { get; set; }

        [Required]
        [StringLength(8)]
        [Column("Fec_Vence_Licencia")]
        public string FecExpiredLicOld { get; set; }
        [Column("dateExpiredLic")]
        [DatePropertyMapping(Target= "FecExpiredLicOld")]
        public DateTime? FecExpiredLic { get; set; }

        [Required]
        [StringLength(10)]
        [Column("Codigo_Habilitacion")]
        public string CodHabilita { get; set; }

        [Required]
        [Column("Cod_Pais")]
        public short CodCountry { get; set; }
        [ForeignKey("CodCountry")]
        public virtual Country Country { get; set; }

        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Licencias")]
        public short NumLicences { get; set; }

        [Required]
        [StringLength(25)]
        [Column("Servidor")]
        public string Server { get; set; }

        [Required]
        [StringLength(25)]
        [Column("BaseDatos")]
        public string DataBase { get; set; }

        [Required]
        [StringLength(25)]
        [Column("Usuario")]
        public string User { get; set; }

        [Required]
        [StringLength(25)]
        [Column("Passw")]
        public string Passw { get; set; }

        [Required]
        [StringLength(30)]
        [Column("Ruta")]
        public string Route { get; set; }

        [Required]
        [StringLength(1)]
        [Column("ModNOM")]
        public string ModNOMOld { get; set; }

        [Column("modPayroll")]
        [BooleanPropertyMapping(Target= "ModNOMOld")]
        public bool? ModNOM { get; set; }

        [Required]
        [StringLength(1)]
        [Column("ModRH")]
        public string ModRHOld { get; set; }

        [Column("modRrHh")]
        [BooleanPropertyMapping(Target= "ModRHOld")]
        public bool? ModRH { get; set; }

        [Required]
        [StringLength(1)]
        [Column("Estado")]
        public string State { get; set; }

        #endregion
    }
}
