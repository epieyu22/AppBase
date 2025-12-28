namespace Systems.JulianaCloud.Domain
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using Systems.JulianaCloud.Domain.Interfaces;

    [Table("ZONAS")]
    public class Zone : IKeyEntity<short>
    {
        #region Properties

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Zona")]
        public short Key { get; set; }

        [Required]
        [StringLength(25)]
        [Column("Nom_Zona")]
        public string Name { get; set; }

        [Column("Tipo_Zona")]
        public short? TypeId { get; set; }

        #endregion
    }
}
