using Microsoft.VisualStudio.TestTools.UnitTesting;
using Systems.JulianaCloud.Business.Pipelines.Domain.Pipes;
using Systems.JulianaCloud.Domain.Attributes;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.Interfaces.Business.Pipelines.Shared.Pipes;

namespace Systems.JulianaCloud.Tests.Business.Utilities.Domain
{
    [TestClass]
    public class BooleanPropertyMappingTransformPipeTests
    {
        #region Dependencies

        private IEntityTransformPipe transformer;

        #endregion

        #region Test Initialization and Clean Up

        [TestInitialize]
        public void TestInitialize()
        {
            this.transformer = new BooleanPropertyMappingTransformPipe();
        }

        #endregion

        #region Test Methods


        [TestMethod]
        [DataRow(true, "S")]
        [DataRow(false, "N")]
        public void TransformBooleanValueTest(bool sourceValue, object expected)
        {
            #region Arrange

            var obj = new ATestOne 
            { 
                Source = sourceValue
            };

            #endregion

            #region Act 

            var result = this.transformer.Transform(obj);

            #endregion

            #region Assert

            Assert.AreEqual(obj, result);
            Assert.AreEqual(sourceValue, result.Source);
            Assert.AreEqual(expected, result.Target);

            #endregion
        }

        [TestMethod]
        [DataRow(true, 1)]
        [DataRow(false, -1)]
        public void TransformBooleanCustomMappingValueTest(bool sourceValue, object expected)
        {
            #region Arrange

            var obj = new ATestTwo
            {
                Source = sourceValue
            };

            #endregion

            #region Act 

            var result = this.transformer.Transform(obj);

            #endregion

            #region Assert

            Assert.AreEqual(obj, result);
            Assert.AreEqual(sourceValue, result.Source);
            Assert.AreEqual(expected, result.Target);

            #endregion
        }

        #endregion

        #region Test Classes

        class ATestOne : IEntity
        {
            [BooleanPropertyMapping(Target = "Target")]
            public bool? Source { get; set; }

            public string Target { get; set; }
        }

        class ATestTwo : IEntity
        {
            [BooleanPropertyMapping(Target = "Target", TrueValue = 1, FalseValue = -1)]
            public bool? Source { get; set; }

            public int Target { get; set; }
        }

        #endregion
    }
}
