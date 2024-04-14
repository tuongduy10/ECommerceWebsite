using ECommerce.Data.Abstractions.Entity;
using System;

namespace ECommerce.Data.Abstractions
{
    public abstract class GenericEntity<T> : IGenericEntity<T>
    {
        public T Id { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        public string CreatedBy { get; set; }
    }
}
