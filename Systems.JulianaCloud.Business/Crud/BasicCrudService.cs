using AutoMapper;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using Systems.JulianaCloud.Business.Utilities.Types;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Domain;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Lambda;
using Systems.JulianaCloud.Interfaces.Data;
using Systems.JulianaCloud.Resources;
using Systems.JulianaCloud.TransferObjects.Interfaces.Lambda;

namespace Systems.JulianaCloud.Business.Crud
{
    public class BasicCrudService<TEntityTO, TEntityDomain, TKey> : IBasicCrudService<TEntityTO, TEntityDomain, TKey> 
        where TEntityDomain : class, IKeyEntity<TKey>
        where TEntityTO : class, IKeyEntity<TKey>
    {
        #region Dependencies

        protected readonly IUnitOfWork unitOfWork;
        protected readonly IMapper mapper;
        protected readonly ILambdaBuilder lambdaBuilder;
        protected readonly IEntityTransformationPipeline entityTransformationPipeline;
        protected readonly IRepository<TEntityDomain> mainRepository;

        #endregion

        #region Constructor

        public BasicCrudService(
            IUnitOfWork unitOfWork, 
            IMapper mapper,
            ILambdaBuilder lambdaBuilder,
            IEntityTransformationPipeline entityTransformationPipeline)
        {
            this.unitOfWork = unitOfWork;
            this.mapper = mapper;
            this.lambdaBuilder = lambdaBuilder;
            this.entityTransformationPipeline = entityTransformationPipeline;
            this.unitOfWork.Initialize();
            this.mainRepository = unitOfWork.Repositories.Use<TEntityDomain>();
        }

        #endregion

        #region Public Methods

        public void Create(TEntityTO source)
        {
            TKey maxCode = this.mainRepository.AsQuerable().Max(p => p.Key);

            TEntityDomain entityDomain = mapper.Map<TEntityDomain>(source);

            entityDomain.Key = IncrementKeyValue(maxCode);

            entityDomain = this.entityTransformationPipeline.Run(entityDomain);

            unitOfWork.Repositories.Use<TEntityDomain>().Add(entityDomain);

            unitOfWork.CommitChanges();
        }

        public void Update(TEntityTO source)
        {
            TEntityDomain target = GetEntity(source.Key);

            if (target == null)
            {
                throw new ArgumentException(
                    string.Format(Messages.EntityNotFoundMessage, source.Key)
                );
            }

            UpdateEntry(source, target);

            target = this.entityTransformationPipeline.Run(target);

            unitOfWork.CommitChanges();
        }

        public void Delete(TKey key)
        {
            IRepository<TEntityDomain> repository = this.mainRepository;

            try
            {
                    TEntityDomain position = repository.FindSingle(p => p.Key.Equals(key));

                repository.Remove(position);
            }
            catch
            {
                throw new ArgumentException(
                    string.Format(Messages.EntityNotFoundMessage, key)
                );
            }

            unitOfWork.CommitChanges();
        }

        public List<TEntityTO> GetAll()
        {
            var entries = this.mainRepository.GetAll();

            return this.mapper.Map<List<TEntityTO>>(
                entries
            );
        }

        public TEntityTO GetOne(TKey key)
        {
            return this.mapper.Map<TEntityTO>(GetEntity(key));
        }

        public List<TEntityTO> GetByProperty(IPropertyCondition propCondition)
        {
            IRepository<TEntityDomain> repo = this.mainRepository;

            PropertyInfo propertyInfo = typeof(TEntityDomain).GetProperty(propCondition.Name);

            if (propertyInfo == null)
                throw new ArgumentException(
                    string.Format(Messages.PropertyNotFoundMessage, propCondition.Name, typeof(TEntityDomain).Name)
                );

            var lambda = this.lambdaBuilder.Build<TEntityDomain>(propCondition.Name, propCondition.Value, propCondition.Condition);

            List<TEntityDomain> results = repo.Find(lambda).ToList();

            return this.mapper.Map<List<TEntityTO>>(results);
        }

        #endregion

        #region Private methods

        private TEntityDomain GetEntity(TKey key)
        {
            return unitOfWork.Repositories.Use<TEntityDomain>()
                                           .Find(p => p.Key.Equals(key))
                                           .FirstOrDefault();
        }

        private TKey IncrementKeyValue(TKey value)
        {
            try
            {
                if(value.IsNumeric())
                {
                    return (TKey) Convert.ChangeType(Convert.ToInt32(value) + 1, typeof(TKey));
                }
            }
            catch {}

            return value;
        }

        private void UpdateEntry(TEntityTO source, TEntityDomain target)
        {
            Type sourceType = typeof(TEntityTO);

            bool hasChangedPropeties = sourceType.GetProperties().Any(p => p.Name == "ChangedProperties");
            IEnumerable<PropertyInfo> sourceProps;

            if (hasChangedPropeties)
            {
                PropertyInfo changedPropertiesProperty = sourceType.GetProperties().FirstOrDefault(p => p.Name == "ChangedProperties");

                sourceProps = sourceType.GetProperties()
                                        .Where(prop => { 
                                            
                                            var changedProperties = (List<string>) changedPropertiesProperty.GetValue(source);

                                            return changedProperties.Any(p => p.ToLower() == prop.Name.ToLower());
                                        });
            }
            else
            {
                sourceProps = sourceType.GetProperties();
            }

            var targetProps = target.GetType().GetProperties()
                                              .ToDictionary(p => p.Name, p => p);

            foreach (var property in sourceProps)
            {
                object value = property.GetValue(source);

                if (!targetProps.ContainsKey(property.Name))
                    continue;

                if (!CheckIfPrimitiveType(targetProps[property.Name].PropertyType))
                {
                    continue;
                }

                if (value is bool && targetProps[property.Name].PropertyType == typeof(string))
                {
                    value = (bool)value ? "S" : "N";
                }


                targetProps[property.Name].SetValue(target, value);
            }
        }

        private bool CheckIfPrimitiveType(Type type)
        {
            return type.IsPrimitive ||
                   type == typeof(DateTime) ||
                   type == typeof(DateTime?) ||
                   type == typeof(String) ||
                   type == typeof(Decimal);
        }

        #endregion
    }
}
