using System;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.TransferObjects
{
    public class HolidayTO : IKeyEntity<short>
    {
        #region Properties

        public short Key { get; set; }
        public DateTime HolidayDate { get; set; }
        public string Name { get; set; }

        #endregion
    }
}
 