using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain.Authentication
{
    [Table("USUARIOS")]
    public class User : IKeyEntity<short>
    {
        [Key]
        [Column("Cod_Usuario")]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public short Key { get; set; }

        [Column("Usuario")]
        [StringLength(10)]
        public string Username { get; set; }

        [Required]
        [Column("Nombre")]
        [StringLength(30)]
        public string Name { get; set; }

        [Required]
        [Column("Clave")]
        [StringLength(20)]
        public string Password { get; set; }

        [Required]
        [Column("Fec_Ingreso")]
        [StringLength(8)]
        public string CreatedAt { get; set; }

        [Required]
        [Column("Fec_Ult_Acceso")]
        [StringLength(8)]
        public string LastAccessAt { get; set; }

        [Required]
        [Column("Fec_Actualizo_Clave")]
        [StringLength(8)]
        public string LastPassChangedAt { get; set; }

        [Required]
        [Column("Fec_Eliminado")]
        [StringLength(8)]
        public string DeletedAt { get; set; }

        [Required]
        [Column("Nivel")]
        [StringLength(1)]
        public string Level { get; set; }

        [Required]
        [Column("Mod_Nomina")]
        [StringLength(1)]
        public string PaysheetModule { get; set; }

        [Required]
        [Column("Mod_Recursos")]
        [StringLength(1)]
        public string ResourceModule { get; set; }

        [Required]
        [Column("Estado")]
        [StringLength(1)]
        public string State { get; set; }

        [Required]
        [Column("AutorizaPagos")]
        [StringLength(1)]
        public string EnablesPayment { get; set; }

        [Required]
        [Column("Cedula")]
        [StringLength(12)]
        public string ID { get; set; }

        [Required]
        [Column("AjustaProvisiones")]
        [StringLength(1)]
        public string AdjustsProvisions { get; set; }

        [Required]
        [Column("Val_Asignado")]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public short AssignedValue { get; set; }

        [Required]
        [Column("VisualizaSalarios")]
        [StringLength(1)]
        public string SeesSalaries { get; set; }

        [Required]
        [Column("TipoUsuario")]
        [StringLength(1)]
        public string UserType { get; set; }

        [Required]
        [Column("Dir_Elec")]
        [StringLength(100)]
        public string Email { get; set; }
    }
}
