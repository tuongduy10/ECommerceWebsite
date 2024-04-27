using System;

namespace ECommerce.Data.Abstractions.Entity
{
    public interface IAuditSoftDelete
    {
        public bool IsDeleted { get; set; }
        public DateTime? DeletedDate { get; set; }
        public string? DeletedBy { get; set; }
    }
}

