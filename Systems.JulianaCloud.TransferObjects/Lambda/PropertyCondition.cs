using Systems.JulianaCloud.TransferObjects.Interfaces.Lambda;

namespace Systems.JulianaCloud.TransferObjects.Lambda
{
    public class PropertyCondition : IPropertyCondition
    {
        public string Name { get; set; }

        public object Value { get; set; }

        public Condition Condition { get; set; }
    }
}
