using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain
{
    [Table("CAJASCOMP")]
    public class Caja : IKeyEntity<short>
    {
        #region Properties
        
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Codigo")]
        public short Key { get; set; }

        [Required]
        [StringLength(30)]
        [Column("Nom_Caja")]
        public string Name { get; set; }

        [Required]
        [StringLength(10)]
        [Column("Nit_CajaComp")]
        public string NumDoc { get; set; }

        [Required]
        [StringLength(1)]
        [Column("Dig_Verificacion")]
        public string DVer { get; set; }

        [Required]
        [StringLength(30)]
        [Column("Direccion")]
        public string Address { get; set; }

        [StringLength(10)]
        [Column("Tel1")]
        public string? Tel1 { get; set; }

        [StringLength(10)]
        [Column("Tel2")]
        public string? Tel2 { get; set; }

        [StringLength(10)]
        [Column("Fax")]
        public string? Fax { get; set; }

        [StringLength(30)]
        [Column("Contacto")]
        public string? Contac { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("TotAfiliados")]
        public float? Total { get; set; }

        [Required]
        [StringLength(6)]
        [Column("Cod_Super")]
        public string CodSuper { get; set; }
        
        #endregion
    }
}