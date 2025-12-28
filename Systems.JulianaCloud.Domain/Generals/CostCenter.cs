using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain
{
    [Table("CCOSTOS")]
    public class CostCenter : IKeyEntity<short>
    {
        #region Properties
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Ccosto")]
        public short Key { get; set; }

        [Required]
        [StringLength(200)]
        [Column("Nom_Ccosto")]
        public string Name { get; set; }

        [StringLength(10)]
        [Column("Ccosto_Sec")]
        public string CostCenterSec { get; set; }

        [Required]
        [StringLength(6)]
        [Column("Ppto_SAP")]
        public string PptoSap { get; set; }

        [Required]
        [StringLength(10)]
        [Column("PMP")]
        public string Pmp { get; set; }

        [Required]
        [StringLength(10)]
        [Column("ProfitCenter")]
        public string ProfitCenter { get; set; }

        [Required]
        [StringLength(1)]
        [Column("Sucursal")]
        public string Subsidiary { get; set; }
     
        #endregion
    }
}
