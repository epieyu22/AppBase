namespace Systems.JulianaCloud.Domain
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class APROBACION_PAGOS
    {
        [Key]
        public int Cod_Aprobacion_Pago { get; set; }

        public DateTime? Fecha_Aprobacion { get; set; }

        public short? Cod_Empleado { get; set; }

        [StringLength(8)]
        public string Fecha_Nomina { get; set; }

        public string Tipo_Aprobacion { get; set; }

        public string Estado { get; set; }


    }
}
