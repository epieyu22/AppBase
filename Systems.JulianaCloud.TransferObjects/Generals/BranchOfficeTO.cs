using System.Collections.Generic;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.TransferObjects.Interfaces;


namespace Systems.JulianaCloud.TransferObjects.Generals
{
    public class BranchOfficeTO : IChangeableProperties, IKeyEntity<short>
    {
        #region Properties
               
        public short Key { get; set; }

        public short CodeZone { get; set; }
        public ZoneTO Zone { get; set; }

        public  string Name { get; set; }
        public bool ComMeta { get; set; }

        public short CodeBoxFamilier { get; set; }
        public BoxFamilierTO BoxFamilier { get; set; }

        public string CodeBranchOfficePag { get; set; }
        public bool HasCompany { get; set; }
        public string NumDoc { get; set; }
        public string VerificationDigit { get; set; }
        public string Unified { get; set; } 
        public short CodeAgency { get; set; }
        
        public List<string> ChangedProperties { get ; set ; }
        public BranchOfficeTO()
        {
            ChangedProperties = new List<string>();
        }
        
        #endregion
    }
}
