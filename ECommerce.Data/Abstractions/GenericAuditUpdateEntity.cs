using ECommerce.Data.Abstractions.Entity;
using System;

namespace ECommerce.Data.Abstractions
{
    public abstract class GenericAuditUpdateEntity<T> : GenericEntity<T>, IGenericAuditUpdateEntity<T>
    {
        public DateTime? UpdatedDate { get; set; }
        public string? UpdatedBy { get; set; }
    }
}
