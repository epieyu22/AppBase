using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.TransferObjects
{
    public class RiskTO : IKeyEntity<short>
    {
        #region Properties

        public short Key { get; set; }
        public string Name { get; set; }
        public string NumDoc { get; set; }
        public string VerificationDigit { get; set; }
        public string Address { get; set; }
        public string Tel1 { get; set; }
        public string Tel2 { get; set; }
        public string Fax { get; set; }
        public string Contact { get; set; }
        public int Total { get; set; }
        public string CodeSuper { get; set; }
        
        #endregion
    }
}
