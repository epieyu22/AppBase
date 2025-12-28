
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.TransferObjects
{    
    public class CountryTO : IKeyEntity<short>
    {
        #region Properties

        public short Key { get; set; }

        public string Name { get; set; }

        #endregion
    }
}
 