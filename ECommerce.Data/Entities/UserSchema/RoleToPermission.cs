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
        public string RoleKey { get; set; }
        public string PermissionKey { get; set; }
    }
}
