using ECommerce.Data.Abstractions.Entity;
using System;

namespace ECommerce.Data.Abstractions
{
    public abstract class GenericAuditSoftDeleteEntity<T> : GenericEntity<T>, IGenericAuditSoftDeleteEntity<T>
    {
        public DateTime? DeletedDate { get; set; } = null;
        public string? DeletedBy { get; set; } = null;
    }
}
