using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain
{
    [Table("DEPARTAMENTOS")]
    public class Department : IKeyEntity<short>
    {
        #region Properties

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Codigo")]
        public short Key { get; set; }

        [Required]
        [StringLength(4)]
        [Column("Codigo_Dane")]
        public string CodDane { get; set; }

        [Required]
        [StringLength(15)]
        [Column("Nom_Depto")]
        public string Name { get; set; }
        #endregion
    }
}
