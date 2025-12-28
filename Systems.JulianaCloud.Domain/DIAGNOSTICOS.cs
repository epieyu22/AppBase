namespace Systems.JulianaCloud.Domain
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class DIAGNOSTICOS
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public short Codigo { get; set; }

        [StringLength(200)]
        public string Descripcion { get; set; }

        [Required]
        [StringLength(20)]
        public string Cod_Alterno { get; set; }
    }
}
