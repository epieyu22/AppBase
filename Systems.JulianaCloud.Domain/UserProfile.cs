using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain
{
    [Table("userProfile")]
    public class UserProfile : IEntityKey
    {
        #region Properties

        [Key]
        public int Id { get; set; }


        [Column("ProfileName")]

        public string Name { get; set; }


        public DateTime BirthDay { get; set; }

        #endregion
    }
}
