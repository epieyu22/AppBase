using System;
using System.Collections.Generic;
using System.Text;

namespace Systems.JulianaCloud.TransferObjects.Interfaces.Lambda
{
    public interface IPropertyCondition
    {
        public string Name { get; set; }

        public object Value { get; set; }

        public Condition Condition { get; set; }
    }
}
