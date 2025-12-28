using System;
using System.Collections.Generic;
using System.Text;

namespace Systems.JulianaCloud.Business.Utilities.Types
{
    public static class NumericExtensions
    {
        #region Public Static Methods

        public static bool IsNumeric(this object source)
        {
            if (Equals(source, null))
            {
                return false;
            }

            Type objType = source.GetType();
            objType = Nullable.GetUnderlyingType(objType) ?? objType;

            if (objType.IsPrimitive)
            {
                return objType != typeof(bool) &&
                    objType != typeof(char) &&
                    objType != typeof(IntPtr) &&
                    objType != typeof(UIntPtr);
            }

            return objType == typeof(decimal);
        }

        #endregion
    }
}
