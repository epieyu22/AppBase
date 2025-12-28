namespace Systems.JulianaCloud.Domain
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    [Table("HOJAVIDA")]
    public partial class HOJAVIDA
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public short Cod_HojaVida { get; set; }
        
        [StringLength(15)]
        public string PNombre { get; set; }

        [StringLength(15)]
        public string SNombre { get; set; }
                
        [StringLength(15)]
        public string PApellido { get; set; }
                
        [StringLength(15)]
        public string SApellido { get; set; }
        
        [StringLength(60)]
        public string Aspirante { get; set; }
        
        [StringLength(12)]
        public string Doc_Identidad { get; set; }

        public short Cod_Nacionalidad { get; set; }

        
        [StringLength(8)]
        public string Fec_Nacimiento { get; set; }
        
        [StringLength(1)]
        public string Sexo { get; set; }

        [StringLength(12)]
        public string Lib_Militar { get; set; }
        
        [StringLength(3)]
        public string Distrito { get; set; }
        
        [StringLength(1)]
        public string Est_Civil { get; set; }

        [StringLength(150)]
        public string Direccion { get; set; }

        public short Cod_Pais { get; set; }
        
        [StringLength(45)]
        public string Dir_Electronica { get; set; }

        public short Cod_Ciudad { get; set; }
        
        [StringLength(25)]
        public string Tel1 { get; set; }
        
        [StringLength(12)]
        public string Tel2 { get; set; }
        
        [StringLength(15)]
        public string Celular { get; set; }

        public double Asp_Salarial { get; set; }
        
        [StringLength(2)]
        public string PViaje { get; set; }
        
        [StringLength(2)]
        public string PTraslado { get; set; }

        public short Cod_Profesion { get; set; }
        
        [StringLength(15)]
        public string Idioma_Nativo { get; set; }
        
        [StringLength(15)]
        public string Idioma1 { get; set; }

        public float Porc_Conocimiento_Idioma1 { get; set; }
        
        [StringLength(15)]
        public string Idioma2 { get; set; }

        public float Porc_Conocimiento_Idioma2 { get; set; }
        
        [StringLength(2)]
        public string Estudiante_Practica { get; set; }

        public int Anos_Experiencia { get; set; }
        
        [StringLength(8)]
        public string Fec_Creacion { get; set; }
        
        [StringLength(8)]
        public string Fec_Actualizacion { get; set; }

        public short Cod_Cargo_Aspira { get; set; }

        [Column(TypeName = "text")]
        public string Sketch { get; set; }

        public short Cod_Personalidad { get; set; }
        
        [StringLength(1)]
        public string Tipo_Documento { get; set; }
        
        [StringLength(1)]
        public string Estado { get; set; }

        public short Cod_Lugar_Expedicion { get; set; }
        
        [StringLength(20)]
        public string Nivel_Idioma1 { get; set; }
        
        [StringLength(20)]
        public string Nivel_Idioma2 { get; set; }
        
        
        public string Unidad_Tiempo { get; set; }

        public string Imagen_Perfil { get; set; }
    }
}
