using System.Collections.Generic;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.TransferObjects.Interfaces;

namespace Systems.JulianaCloud.TransferObjects.Authentication
{
    public class UserTO : IChangeableProperties, IKeyEntity<short>
    {
        public short Key { get; set; }

        public string Username { get; set; }

        public string Name { get; set; }

        public string Password { get; set; }

        public string CreatedAt { get; set; }

        public string LastAccessAt { get; set; }

        public string LastPassChangedAt { get; set; }

        public string DeletedAt { get; set; }

        public string Level { get; set; }

        public string PaysheetModule { get; set; }

        public string ResourceModule { get; set; }

        public string State { get; set; }

        public string EnablesPayment { get; set; }

        public string ID { get; set; }

        public string AdjustsProvisions { get; set; }

        public short AssignedValue { get; set; }

        public string SeesSalaries { get; set; }

        public string UserType { get; set; }

        public string Email { get; set; }

        public List<string> ChangedProperties { get; set; }
    }
}
