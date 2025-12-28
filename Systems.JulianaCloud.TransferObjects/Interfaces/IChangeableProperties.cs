using System;
using System.Collections.Generic;
using System.Text;

namespace Systems.JulianaCloud.TransferObjects.Interfaces
{
    internal interface IChangeableProperties
    {
        public List<string> ChangedProperties { get; set; }
    }
}
