namespace Systems.JulianaCloud.Domain
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    public partial class FAMILIARES
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public short Cod_Empleado { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(45)]
        public string Nombre { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(25)]
        public string Parentesco { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(3)]
        public string Edad { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(35)]
        public string Profesion { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(35)]
        public string Empresa { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(25)]
        public string Cargo { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(8)]
        public string FechaNacimiento { get; set; }

        [Key]
        [Column(Order = 8)]
        [StringLength(20)]
        public string PNombre { get; set; }

        [Key]
        [Column(Order = 9)]
        [StringLength(30)]
        public string SNombre { get; set; }

        [Key]
        [Column(Order = 10)]
        [StringLength(20)]
        public string PApellido { get; set; }

        [Key]
        [Column(Order = 11)]
        [StringLength(30)]
        public string SApellido { get; set; }

        [Key]
        [Column(Order = 12)]
        [StringLength(12)]
        public string Cedula { get; set; }

        [Key]
        [Column(Order = 13)]
        [StringLength(1)]
        public string Tipo_Documento { get; set; }

        [Key]
        [Column(Order = 14)]
        public double Upc { get; set; }
    }
}
