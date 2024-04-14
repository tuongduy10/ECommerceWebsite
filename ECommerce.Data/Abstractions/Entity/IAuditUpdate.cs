using System;

namespace ECommerce.Data.Abstractions.Entity
{
    public interface IAuditUpdate
    {
        public DateTime? UpdatedDate { get; set; }
        public string? UpdatedBy { get; set; }
    }
}

