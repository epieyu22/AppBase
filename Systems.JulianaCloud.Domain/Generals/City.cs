using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain
{
    [Table("CIUDADES")]
    public class City : IKeyEntity<short>
    {
        #region Properties

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Codigo")]
        public short Key { get; set; }

        [Required]
        [StringLength(2)]
        [Column("Codigo_Departamento")]
        public string CodDepto { get; set; }

        [Required]
        [StringLength(8)]
        [Column("Codigo_Dane")]
        public string CodDane { get; set; }

        [Required]
        [StringLength(15)]
        [Column("Nom_Ciudad")]
        public string Name { get; set; }
        
        #endregion
    }
}
