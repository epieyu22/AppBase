namespace Systems.JulianaCloud.Domain
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    [Table("RANGOSSOLPENSION")]
    public partial class RANGOSSOLPENSION
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public short Ano { get; set; }

        [Key]
        [Column(Order = 1)]
        public float Desde { get; set; }

        [Key]
        [Column(Order = 2)]
        public float Hasta { get; set; }

        [Key]
        [Column(Order = 3)]
        public float Porc_Sol_Pen { get; set; }
    }
}
