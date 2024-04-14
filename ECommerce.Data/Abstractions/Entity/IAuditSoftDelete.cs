using System;

namespace ECommerce.Data.Abstractions.Entity
{
    public interface IAuditSoftDelete
    {
        public DateTime? DeletedDate { get; set; }
        public string? DeletedBy { get; set; }
    }
}

