using System;
using System.Collections.Generic;
using System.Text;

namespace Systems.JulianaCloud.Interfaces.Data
{
    public interface IAppUserContext : IDisposable
    {
        object GetContext();
    }
}
