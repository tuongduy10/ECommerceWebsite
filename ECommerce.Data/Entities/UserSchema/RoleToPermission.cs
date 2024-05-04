using ECommerce.Data.Abstractions;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ECommerce.Data.Entities.UserSchema
{
    [Table("RoleToPermissions")]
    public class RoleToPermission : GenericAuditEntity<Guid>
    {
        public int RoleId { get; set; }
        public string PermissionId { get; set; }
        public virtual Permission Permission { get; set; }
        public virtual Role Role { get; set; }
    }
}
