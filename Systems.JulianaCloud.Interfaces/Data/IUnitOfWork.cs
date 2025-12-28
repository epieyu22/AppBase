using System;
using System.Collections.Generic;
using System.Text;

namespace Systems.JulianaCloud.Interfaces.Data
{
    public interface IUnitOfWork : IDisposable
    {
        IRepositoryCollection Repositories { get; }
        void CommitChanges();
        void InitializeAuth(string db);
        void Initialize();
    }
}
