using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace Systems.JulianaCloud.Commons.Utils
{
    public static class DateHelper
    {
        public static DateTime ConvertUglyDate(string unglyDate)
        {
            CultureInfo provider = CultureInfo.InvariantCulture;
            DateTime result = DateTime.ParseExact(unglyDate, "yyyyMMdd", provider);
            result = result.AddHours(5.0);
            return result;
        }
    }
}
