namespace Systems.JulianaCloud.Domain
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using Systems.JulianaCloud.Domain.Interfaces;
    
    [Table("CAUSALESRETIRO")]
    public class Withdrawal : IKeyEntity<short>
    {
        #region Properties

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Column("Codigo")]
        public short Key { get; set; }

        [Required]
        [StringLength(30)]
        [Column("Descripcion")]
        public string Name { get; set; }


        #endregion

    }
}
