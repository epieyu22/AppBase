using Microsoft.VisualStudio.TestTools.UnitTesting;
using Systems.JulianaCloud.Business.Pipelines.Shared;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.Interfaces.Business.Pipelines.Shared;
using Systems.JulianaCloud.Interfaces.Business.Pipelines.Shared.Pipes;

namespace Systems.JulianaCloud.Tests.Business.Utilities.Domain
{
    [TestClass]
    public class EntityTransformationPipelineTests
    {
        #region Dependencies

        private IEntityTransformationPipeline pipeline;

        #endregion

        #region Test Initialization and Clean Up

        [TestInitialize]
        public void TestInitialize()
        {
            this.pipeline = new EntityTransformationPipeline();
        }

        #endregion

        #region Test Methods

        [TestMethod]
        public void SimpleExecutionOrderTest()
        {
            #region Arrange

            Entity obj = new Entity
            {
                Value = 0
            };

            this.pipeline.Register(new Pipe1());
            this.pipeline.Register(new Pipe2());

            #endregion

            #region Act

            var result = this.pipeline.Run(obj);

            #endregion

            #region Assert

            Assert.AreEqual(obj, result);
            Assert.AreEqual(3, result.Value);

            #endregion
        }

        #endregion

        #region Test Class

        class Entity : IEntity
        {
            public int Value { get; set; }
        }

        class Pipe1 : IEntityTransformPipe
        {
            public TEntity Transform<TEntity>(TEntity entity) where TEntity : class, IEntity
            {
                var casted = entity as Entity;

                casted.Value += 1;

                return entity;
            }
        }

        class Pipe2 : IEntityTransformPipe
        {
            public TEntity Transform<TEntity>(TEntity entity) where TEntity : class, IEntity
            {
                var casted = entity as Entity;

                casted.Value += 2;

                return entity;
            }
        }

        #endregion
    }
}
