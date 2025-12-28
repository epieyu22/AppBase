using System;
using System.Collections.Generic;
using System.Text;

namespace Systems.JulianaCloud.Interfaces.Domain
{
    public interface IEntity { }

    public interface IKeyEntity : IEntity
    {
        int Id { get; set; }
    }
}
