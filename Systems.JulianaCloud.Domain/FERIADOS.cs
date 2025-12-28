namespace Systems.JulianaCloud.Domain
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class FERIADOS
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public short Cod_Feriado { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(8)]
        public string Fecha { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(30)]
        public string Descripcion { get; set; }
    }
}
