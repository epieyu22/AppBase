using System.Collections.Generic;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.TransferObjects.Interfaces;

namespace Systems.JulianaCloud.TransferObjects.Employee
{
    public class PositionTO : IChangeableProperties, IKeyEntity<short>
    {
        public short Code { get; set; }

        public string Name { get; set; }

        public double AvailableSalary { get; set; }

        public short AlternativeCode { get; set; } 

        public string Objective { get; set; } = string.Empty;

        public string Function { get; set; } = string.Empty;

        public string Profile { get; set; } = string.Empty;

        public bool AuthorizeSalaries { get; set; }

        public bool ReceiveMails { get; set; }

        public bool HasBoss { get; set; }

        public short BossPosition { get; set; }

        public bool DocumentSignature { get; set; }

        public string Signature { get; set; } = string.Empty;

        public string ActivityCode { get; set; } = string.Empty;

        public bool Art209 { get; set; }

        public List<string> ChangedProperties { get ; set ; }
        
        public short Key { get => this.Code; set => this.Code = value; }

        public PositionTO()
        {
            ChangedProperties = new List<string>();
            AlternativeCode = 0;
            BossPosition = 0;
        }
    }
}
