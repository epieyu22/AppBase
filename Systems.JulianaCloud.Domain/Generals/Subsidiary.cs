using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Systems.JulianaCloud.Domain.Attributes;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain.Generals
{
    [Table("SUCURSALES")]
    public class Subsidiary : IKeyEntity<short>
    {
        #region Properties

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Sucursal")]
        public short Key { get; set; }

        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Zona")]
        public short CodZone { get; set; }
        [ForeignKey("CodZone")]
        public virtual Zone Zone { get; set; }

        [Required]
        [StringLength(30)]
        [Column("Nom_Sucursal")]
        public string Name { get; set; }

        [Required]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_CajaComp")]
        public short CodCaja { get; set; }
        [ForeignKey("CodCaja")]
        public virtual Caja Caja { get; set; }

        [Required]
        [StringLength(2)]
        [Column("Sucursal_Sec")]
        public string CodSubsiSec { get; set; }

        [Required]
        [StringLength(9)]
        [Column("Nit_Sucursal")]
        public string NumDoc { get; set; }

        [Required]
        [StringLength(1)]
        [Column("Digito_Verificacion")]
        public string DVer { get; set; }

        [StringLength(1)]
        [Column("Unificado")]
        public string Unified { get; set; }
 
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Agencia")]
        public short CodAgency { get; set; }

        [StringLength(1)]
        [Column("Cumplio_Meta")]
        public string CumMetaOld { get; set; }
 
        [Column("cumMeta")]
        [BooleanPropertyMapping(Target= "CumMetaOld")]
        public bool? CumMeta { get; set; }

        [StringLength(1)]
        [Column("EsEmpresa")]
        public string HasCompanyOld { get; set; }
 
        [Column("hasCompany")]
        [BooleanPropertyMapping(Target= "HasCompanyOld")]
        public bool? HasCompany { get; set; }

       #endregion
    }
}
