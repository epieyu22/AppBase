using System.Collections.Generic;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.TransferObjects.Interfaces;

namespace Systems.JulianaCloud.TransferObjects.Authentication
{
    public class AppUserTO : IChangeableProperties, IKeyEntity<short>
    {
        public short Key { get; set; }

        public string Email { get; set; }

        public string State { get; set; }

        public short CompanyCode { get; set; }

        public string Company { get; set; }

        //extra definition

        public string Name { get; set; }

        public List<string> ChangedProperties { get; set; }
    }
}
