using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Systems.JulianaCloud.Domain.Attributes;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain.Employee
{
    [Table("CARGOS")]
    public class Position: IKeyEntity<short>
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Cargo")]
        public short Key { get; set; }

        [Required]
        [StringLength(40)]
        [Column("Nom_Cargo")]   
        public string Name { get; set; } = string.Empty;

        [Column("Sue_Disponible")]
        public double AvailableSalary { get; set; }

        [Column("Cod_Alterno")]
        public short AlternativeCode { get; set; }

        [Column("Objetivo")]
        [Required]

        public string Objective { get; set; } = string.Empty;

        [Column("Funciones")]
        [Required]
        public string Function { get; set; } = string.Empty;

        [Column("Perfil")]
        [Required]
        public string Profile { get; set; } = string.Empty;

        [Column("AutorizaSalarios")]
        [StringLength(1)]
        public string AuthorizeSalariesOld { get; set; }

        [Column("salaryAuthorization")]
        [BooleanPropertyMapping(Target = "AuthorizeSalariesOld")]
        public bool? AuthorizeSalaries { get; set; }

        [Column("RecibeMail")]
        [StringLength(1)]
        public string ReceiveMailsOld { get; set; } = string.Empty;

        [Column("receiveMails")]
        [BooleanPropertyMapping(Target = "ReceiveMailsOld")]
        public bool? ReceiveMails { get; set; }

        
        [Column("TieneJefe")]
        [StringLength(1)]
        public string HasBossOld { get; set; } = string.Empty;

        
        [Column("hasBoss")]
        [BooleanPropertyMapping(Target = "HasBossOld")]
        public bool? HasBoss { get; set; }

        [Column("Cod_CargoJefe")]
        public short BossPosition { get; set; }

        [Column("Firma_Doc")]
        public bool DocumentSignature { get; set; }

        [Column("Firma_Digital")]
        public byte[] DigitalSignature { get; set; }

        [Required]
        [StringLength(50)]
        [Column("Docu_Firma")]
        public string Signature { get; set; } = string.Empty;

        [Required]
        [StringLength(4)]
        [Column("Cod_Oficio")]
        public string ActivityCode { get; set; } = string.Empty;

        [Column("Art209")]
        [StringLength(1)]
        public string Art209Old { get; set; } = string.Empty;

        
        [Column("applyArt209")]
        [BooleanPropertyMapping(Target = "Art209Old")]
        public bool? Art209 { get; set; }
    }
}
