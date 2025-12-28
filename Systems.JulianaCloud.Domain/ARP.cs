namespace Systems.JulianaCloud.Domain
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    [Table("ARP")]
    public partial class ARP
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public short Cod_Arp { get; set; }

        [Required]
        [StringLength(30)]
        public string Nom_Arp { get; set; }

        [Required]
        [StringLength(9)]
        public string Nit_Arp { get; set; }

        [Required]
        [StringLength(1)]
        public string Digito_Verificacion { get; set; }

        
        [StringLength(40)]
        public string? Dir_Arp { get; set; }

        [StringLength(10)]
        public string? Tel1_Arp { get; set; }

        [StringLength(10)]
        public string? Tel2_Arp { get; set; }

        [StringLength(10)]
        public string? Fax_Arp { get; set; }

        [StringLength(30)]
        public string? Contacto_Arp { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Tot_Afiliados { get; set; }

        [Required]
        [StringLength(6)]
        public string Cod_Super { get; set; }
    }
}
