using System;
using System.Collections.Generic;
using System.Text;

namespace Systems.JulianaCloud.Domain.Interfaces
{
    public interface IEntity { }

    public interface IKeyEntity<TKey> : IEntity
    {
        TKey Key { get; set; }
    }
}
