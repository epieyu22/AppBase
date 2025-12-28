using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Resources;

namespace Systems.JulianaCloud.Domain.Attributes
{
    [AttributeUsage(AttributeTargets.Property, AllowMultiple = false, Inherited = true)]
    public class BooleanPropertyMappingAttribute : Attribute
    {
        public string Target { get; set; }

        public object TrueValue { get; set; } = ValueConstants.TrueStringValue;

        public object FalseValue { get; set; } = ValueConstants.FalseStringValue;

    }
}
