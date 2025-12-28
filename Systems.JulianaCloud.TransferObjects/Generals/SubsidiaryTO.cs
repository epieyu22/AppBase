using System.Collections.Generic;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.TransferObjects.Interfaces;


namespace Systems.JulianaCloud.TransferObjects.Generals
{
    public class SubsidiaryTO : IChangeableProperties, IKeyEntity<short>
    {
        #region Properties
               
        public short Key { get; set; }

        public short CodZone { get; set; }
        public ZoneTO Zone { get; set; }

        public  string Name { get; set; }
        public bool CumMeta { get; set; }

        public short CodCaja { get; set; }
        public CajaTO Caja { get; set; }

        public string CodSubsiSec { get; set; }
        public bool HasCompany { get; set; }
        public string NumDoc { get; set; }
        public string DVer { get; set; }
        public string Unified { get; set; } 
        public short CodAgency { get; set; }
        
        public List<string> ChangedProperties { get ; set ; }
        public SubsidiaryTO()
        {
            ChangedProperties = new List<string>();
        }
        
        #endregion
    }
}
