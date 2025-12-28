using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.TransferObjects.Generals
{
    public class UtilityTO : IKeyEntity<short>
    {
        #region Properties

        public short Key { get; set; }
        public string Initials { get; set; }
        public string UtilityType { get; set; }
        public string UtilityName { get; set; }
        
        #endregion
    }
}
