using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Systems.JulianaCloud.Domain.Attributes;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain
{
    [Table("FERIADOS")]
    public class Holiday : IKeyEntity<short>
    {
        #region Properties

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Cod_Feriado")]
        public short Key { get; set; }

        [Required]
        [StringLength(8)]
        [Column("Fecha")]
        public string HolidaytDateOld { get; set; }
        [Column("dateHolliday")]
        [DatePropertyMapping(Target= "HolidaytDateOld")]
        public DateTime? HolidaytDate { get; set; }

        [Required]
        [StringLength(30)]
        [Column("Descripcion")]
        public string Name { get; set; }

        #endregion
    }
}
