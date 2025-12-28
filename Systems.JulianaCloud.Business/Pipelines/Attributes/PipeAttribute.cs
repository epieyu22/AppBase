using System;

namespace Systems.JulianaCloud.Business.Pipelines.Attributes
{
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = true, Inherited = true)]
    public class PipeAttribute : Attribute
    {
        [Flags]
        public enum Type
        {
            Read,
            CreateAndUpdate,
            General
        }

        public Type UsedFor { get; set; } = Type.General;

        public string Qualifier { get; set; }
    }
}
