using ECommerce.Data.Abstractions.Entity;
using System;

namespace ECommerce.Data.Abstractions
{
    public abstract class GenericAuditSoftDeleteEntity<T> : GenericEntity<T>, IGenericAuditSoftDeleteEntity<T>
    {
        public bool IsDeleted { get; set; } = false;
        public DateTime? DeletedDate { get; set; } = null;
        public string? DeletedBy { get; set; } = null;
    }
}
