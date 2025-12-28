using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.TransferObjects
{
    public class DepartmentTO : IKeyEntity<short>
    {
        #region Properties

        public short Key { get; set; }
        public string CodeDane { get; set; }
        public string Name { get; set; }

        #endregion
    }
}
 