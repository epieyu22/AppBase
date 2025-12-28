using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain
{
    [Table("ARP")]
    public class Arl : IKeyEntity<short>
    {
        #region Properties
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Arp")]
        public short Key { get; set; }

        [Required]
        [StringLength(30)]
        [Column("Nom_Arp")]
        public string Name { get; set; }

        [Required]
        [StringLength(9)]
        [Column("Nit_Arp")]
        public string NumDoc { get; set; }

        [Required]
        [StringLength(1)]
        [Column("Digito_Verificacion")]
        public string DVer { get; set; }

        [StringLength(40)]
        [Column("Dir_Arp")]
        public string? Address { get; set; }

        [StringLength(10)]
        [Column("Tel1_Arp")]
        public string? Tel1 { get; set; }

        [StringLength(10)]
        [Column("Tel2_Arp")]
        public string? Tel2 { get; set; }

        [StringLength(10)]
        [Column("Fax_Arp")]
        public string? Fax { get; set; }

        [StringLength(30)]
        [Column("Contacto_Arp")]
        public string? Contac { get; set; }
        
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Tot_Afiliados")]
        public int Total { get; set; }
        
        [Required]
        [StringLength(6)]
        [Column("Cod_Super")]
        public string CodSuper { get; set; }
     
        #endregion
    }
}
