using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Interfaces.Data;

namespace Systems.JulianaCloud.Data
{
    public class RepositoryCollection : IRepositoryCollection
    {
        private Dictionary<Type, object> repositories;

        public RepositoryCollection()
        {
            repositories = new Dictionary<Type, object>();
        }

        public void Register<T>(IRepository<T> repository) where T : class
        {
            Type repositoryType = typeof(T);

            if (repositories.ContainsKey(repositoryType))
            {
                throw new ArgumentException("The provided repository type is already registered");
            }

            if (repository == null)
            {
                throw new ArgumentNullException("repsitory");
            }


            repositories.Add(repositoryType, repository);
        }

        public IRepository<T> Use<T>() where T : class
        {
            Type repositoryType = typeof(T);

            if (!repositories.ContainsKey(repositoryType))
            {
                throw new ArgumentException("There are not registered repositories for the provided type");
            }

            return (IRepository<T>)repositories[repositoryType];
        }

    }
}
