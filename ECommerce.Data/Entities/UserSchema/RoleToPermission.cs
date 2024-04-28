using ECommerce.Data.Abstractions;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ECommerce.Data.Entities.UserSchema
{
    [Table("RoleToPermissions", Schema = "ums")]
    public class RoleToPermission : GenericAuditEntity<Guid>
    {
        public string RoleKey { get; set; }
        public string PermissionKey { get; set; }
        public bool Read { get; set; }
        public bool Write { get; set; }
        public bool Update { get; set; }
        public bool Delete { get; set; }
    }
}
