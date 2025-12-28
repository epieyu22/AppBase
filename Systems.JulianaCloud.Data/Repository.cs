using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Systems.JulianaCloud.Interfaces.Data;

namespace Systems.JulianaCloud.Data
{
    public class Repository<T> : IRepository<T> where T : class
    {
        #region Protected fields
        
        protected DbSet<T> table { get; set; }

        protected IUnitOfWork unitOfWork { get; set; }

        #endregion
        
        #region Constructors

        public Repository(IUnitOfWork unitOfWork, DbSet<T> table)
        {
            this.unitOfWork = unitOfWork;
            this.table = table;
        }

        #endregion

        #region Public Methods

        public void Add(T entity)
        {
            this.table.Add(entity);
        }

        public void Add(List<T> entities)
        {
            this.table.AddRange(entities);
        }

        public void Attach(T entity)
        {
            this.table.Attach(entity);
        }

        public int Count()
        {
            return this.table.Count();
        }

        public IQueryable<T> AsQuerable()
        {
            return this.table.AsQueryable();
        }

        public IEnumerable<T> Find(Expression<Func<T, bool>> filter)
        {
            return this.table.Where(filter);
        }

        public IEnumerable<T> Find(Expression<Func<T, bool>> filter, params Expression<Func<T, object>>[] includeProperties)
        {
            return this.IncludeProperties(includeProperties).Where(filter);
        }

        public T FindSingle(Expression<Func<T, bool>> filter)
        {
            return this.Find(filter).Single();
        }

        public T FindSingle(Expression<Func<T, bool>> filter, params Expression<Func<T, object>>[] includeProperties)
        {
            return this.Find(filter, includeProperties).Single();
        }

        public List<T> GetAll()
        {
            return this.table.ToList();
        }

        public List<T> GetAll(params Expression<Func<T, object>>[] includeProperties)
        {
            return this.IncludeProperties(includeProperties).ToList();
        }

        public void Remove(T entity)
        {
            this.table.Remove(entity);
        }

        #endregion

        #region Private Methods

        private IQueryable<T> IncludeProperties(params Expression<Func<T, object>>[] includeProperties)
        {
            IQueryable<T> entities = this.table;

            foreach (var includeProperty in includeProperties)
            {
                entities = entities.Include(includeProperty);
            }

            return entities;
        }

        #endregion


    }
}
