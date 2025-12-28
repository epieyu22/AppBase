using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.TransferObjects
{
    public class CityTO : IKeyEntity<short>
    {
        #region Properties

        public short Key { get; set; }
        public string CodDepto { get; set; }
        public string CodDane { get; set; }
        public string Name { get; set; }

        #endregion
    }
}
 
 