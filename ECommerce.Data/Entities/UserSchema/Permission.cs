using ECommerce.Data.Abstractions;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ECommerce.Data.Entities.UserSchema
{
    [Table("Permissions", Schema = "ums")]
    public class Permission : GenericAuditEntity<Guid>
    {
        public string Value { get; set; }
        public string Name { get; set; }
        public string Module { get; set; }
    }
}
