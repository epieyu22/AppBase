using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Resources;

namespace Systems.JulianaCloud.Domain.Attributes
{
    [AttributeUsage(AttributeTargets.Property, AllowMultiple = false, Inherited = true)]
    public class DatePropertyMappingAttribute : Attribute
    {
        public string Target { get; set; }

        public string Format { get; set; } = ValueConstants.DefaultDateStringFormat;

    }
}
