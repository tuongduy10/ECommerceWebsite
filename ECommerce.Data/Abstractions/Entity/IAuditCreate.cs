using System;

namespace ECommerce.Data.Abstractions.Entity
{
    public interface IAuditCreate
    {
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
    }
}
