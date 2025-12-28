using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;
using Systems.JulianaCloud.Resources;

namespace Systems.JulianaCloud.Commons.Utils
{
    public static class DateHelper
    {
        public static DateTime ConvertUglyDate(string unglyDate, string format = ValueConstants.DefaultDateStringFormat)
        {
            CultureInfo provider = CultureInfo.InvariantCulture;
            DateTime result = DateTime.ParseExact(unglyDate, format, provider);
            result = result.AddHours(5.0);
            return result;
        }
    }
}
