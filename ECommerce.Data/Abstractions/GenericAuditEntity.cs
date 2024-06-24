using ECommerce.Data.Abstractions.Entity;
using System;

namespace ECommerce.Data.Abstractions
{
    public abstract class GenericAuditEntity<T> : GenericEntity<T>, IGenericAuditEntity<T>
    {
        public bool IsDeleted { get; set; } = false;
        public DateTime? UpdatedDate { get; set; } = null;
        public string? UpdatedBy { get; set; } = null;
        public DateTime? DeletedDate { get; set; } = null;
        public string? DeletedBy { get; set; } = null;
    }
}
