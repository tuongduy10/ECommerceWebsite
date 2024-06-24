using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Data.Abstractions.Entity
{
    public interface IGenericAuditSoftDeleteEntity<T> : IGenericEntity<T>, IAuditSoftDelete
    {
    }
}
