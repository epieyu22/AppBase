using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.TransferObjects
{
    public class CostCenterTO : IKeyEntity<short>
    {
        #region Properties

        public short Key { get; set; }
        public string Name { get; set; }
        public string CostCenterSec { get; set; }
        public string PptoSap { get; set; }
        public string Pmp { get; set; }
        public string ProfitCenter { get; set; }
        public string BranchOffice { get; set; }

        #endregion
    }
}
