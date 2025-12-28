using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace Systems.JulianaCloud.Interfaces.Data
{
    public interface IRepository<T> where T : class
    {
        void Add(List<T> entities);
        void Add(T entity);
        IQueryable<T> AsQuerable();
        void Attach(T entity);
        int Count();
        IEnumerable<T> Find(Expression<Func<T, bool>> filter);
        IEnumerable<T> Find(Expression<Func<T, bool>> filter, params Expression<Func<T, object>>[] includeProperties);
        T FindSingle(Expression<Func<T, bool>> filter);
        T FindSingle(Expression<Func<T, bool>> filter, params Expression<Func<T, object>>[] includeProperties);
        List<T> GetAll();
        List<T> GetAll(params Expression<Func<T, object>>[] includeProperties);
        void Remove(T entity);
    }
} 