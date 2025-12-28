using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Business.Utilities.Domain.Pipes;
using Systems.JulianaCloud.Domain.Attributes;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Domain;

namespace Systems.JulianaCloud.Tests.Business.Utilities.Domain
{
    [TestClass]
    public class DatePropertyMappingTransformPipeTests
    {
        #region Dependencies

        private IEntityTransformPipe transformer;

        #endregion

        #region Test Initialization and Clean Up

        [TestInitialize]
        public void TestInitialize()
        {
            this.transformer = new DatePropertyMappingTransformPipe();
        }

        #endregion

        #region Test Methods


        [TestMethod]
        [DataRow(2020, 1, 1, "20200101")]
        [DataRow(2020, 12, 31, "20201231")]
        public void TransformDateValueTest(int year, int month, int day, string expected)
        {
            #region Arrange

            var obj = new ATestOne
            {
                Source = new DateTime(year, month, day)
            };

            #endregion

            #region Act 

            var result = this.transformer.Transform(obj);

            #endregion

            #region Assert

            Assert.AreEqual(obj, result);
            Assert.AreEqual(expected, result.Target);

            #endregion
        }

        [TestMethod]
        [DataRow(2020, 1, 1, "01/01/2020")]
        [DataRow(2020, 12, 31, "31/12/2020")]
        public void TransformDateCustomFormatValueTest(int year, int month, int day, string expected)
        {
            #region Arrange

            var obj = new ATestTwo
            {
                Source = new DateTime(year, month, day)
            };

            #endregion

            #region Act 

            var result = this.transformer.Transform(obj);

            #endregion

            #region Assert

            Assert.AreEqual(obj, result);
            Assert.AreEqual(expected, result.Target);

            #endregion
        }

        #endregion

        #region Test Classes

        class ATestOne : IEntity
        {
            [DatePropertyMapping(Target = "Target")]
            public DateTime? Source { get; set; }

            public string Target { get; set; }
        }

        class ATestTwo : IEntity
        {
            [DatePropertyMapping(Target = "Target", Format = "dd/MM/yyyy")]
            public DateTime? Source { get; set; }

            public string Target { get; set; }
        }

        #endregion
    }
}
