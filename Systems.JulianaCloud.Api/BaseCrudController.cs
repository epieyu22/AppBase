using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects.Interfaces.Lambda;
using Systems.JulianaCloud.TransferObjects.Lambda;

namespace Systems.JulianaCloud.Api
{
    //[Authorize]
    public class BaseCrudController<TEntityTO, TEntityDomain, TKey> : ControllerBase
        where TEntityDomain : class, IKeyEntity<TKey>
        where TEntityTO : class, IKeyEntity<TKey>
    {
        #region Fields

        protected readonly IBasicCrudService<TEntityTO, TEntityDomain, TKey> crudService;

        #endregion

        #region Constructor

        public BaseCrudController(IBasicCrudService<TEntityTO, TEntityDomain, TKey> crudService)
        {
            this.crudService = crudService;
        }

        #endregion

        #region Crud Actions

        [HttpGet]
        public List<TEntityTO> GetAll()
        {
            return this.crudService.GetAll();
        }

        [HttpGet]
        [Route("{key}")]
        public TEntityTO GetOne(TKey key)
        {
            return this.crudService.GetOne(key);
        }

        [HttpPost]
        public void Create(TEntityTO source)
        {
            try
            {
                this.crudService.Create(source);
            }
            catch (Exception)
            {
                this.Response.StatusCode = 500;
            }
        }

        [HttpPut]
        public void Update(TEntityTO source)
        {
            try
            {
                this.crudService.Update(source);
            }
            catch (ArgumentException)
            {
                this.Response.StatusCode = 404;
            }
            catch (Exception ex)
            {
                Debug.WriteLine("Error while updating entires:" + ex.Message);
                Debug.WriteLine("--> inner exceptions:" + ex.InnerException?.Message);
                
                this.Response.StatusCode = 500;
            }
        }

        [HttpDelete]
        [Route("{key}")]
        public void Delete(TKey key)
        {
            try
            {
                this.crudService.Delete(key);
            }
            catch (ArgumentException)
            {
                this.Response.StatusCode = 404;
            }
            catch (Exception)
            {
                this.Response.StatusCode = 500;
            }
        }

        #endregion

        #region Filters

        [HttpGet]
        [Route("by/{propertyName}/{condition}/{value}")]
        public List<TEntityTO> GetByProperty(string propertyName, Condition condition, string value)
        {
            return this.crudService.GetByProperty(new PropertyCondition { 
                Name = propertyName, 
                Condition = condition, 
                Value = value 
            });
        }

        #endregion
    }
}
