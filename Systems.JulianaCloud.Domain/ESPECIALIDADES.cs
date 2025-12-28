namespace Systems.JulianaCloud.Domain
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class ESPECIALIDADES
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public short Cod_Especialidad { get; set; }

        [Required]
        [StringLength(50)]
        public string Descripcion { get; set; }
    }
}
