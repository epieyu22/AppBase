using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.TransferObjects
{
    public class CajaTO : IKeyEntity<short>
    {
        #region Properties

        public short Key { get; set; }
        public string Name { get; set; }
        public string NumDoc { get; set; }
        public string DVer { get; set; }
        public string Address { get; set; }
        public string Tel1 { get; set; }
        public string Tel2 { get; set; }
        public string Fax { get; set; }
        public string Contac { get; set; }
        public float Total { get; set; }
        public string CodSuper { get; set; }

        #endregion
    }
}
