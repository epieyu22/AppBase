using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Domain.Authentication
{
    [Table("Users")]
    public class AppUser : IKeyEntity<short>
    {
        #region Properties

        [Key]
        [Column("Code")]
        public short Key { get; set; }

        public string Email { get; set; }

        public string State { get; set; }

        public short CompanyCode { get; set; }

        public string Company { get; set; }

        #endregion
    }
}
