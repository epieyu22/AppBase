using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Business.Utilities.Types;

namespace Systems.JulianaCloud.Tests.Business.Utilities.Types
{
    [TestClass]
    public class NumericExtensionsTests
    {
        #region Dependencies

        #endregion

        #region Test Initialization and Clean Up

        [TestInitialize]
        public void TestInitialize()
        {
            
        }

        #endregion

        #region Test Methods

        [TestMethod]
        public void CheckIsNumericType()
        {

            #region Act & Assert

            Assert.IsTrue(1.IsNumeric());
            Assert.IsTrue(1d.IsNumeric());
            Assert.IsTrue(1f.IsNumeric());
            Assert.IsTrue(1L.IsNumeric());
            Assert.IsTrue(((short)1).IsNumeric());

            #endregion
        }

        [TestMethod]
        public void CheckIsNotNumericType()
        {
            #region Arrange

            string value = "1";

            #endregion

            #region Act & Assert

            Assert.IsFalse(value.IsNumeric());

            #endregion
        }

        [TestMethod]
        public void CheckIsNumericNullType()
        {
            #region Arrange

            int? value = null;

            #endregion

            #region Act & Assert

            Assert.IsFalse(value.IsNumeric());

            #endregion
        }

        #endregion

    }
}
