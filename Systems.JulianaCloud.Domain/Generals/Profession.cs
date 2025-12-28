using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain
{
    [Table("PROFESIONES")]
    public class Profession : IKeyEntity<short>
    {
        #region Properties

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Profesion")]
        public short Key { get; set; }

        [Required]
        [StringLength(30)]
        [Column("Descripcion")]
        public string Name { get; set; }


        #endregion

    }
}
