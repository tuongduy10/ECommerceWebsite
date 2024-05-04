using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ECommerce.Data.Entities.UserSchema
{
    public partial class UserRole
    {
        public int UserId { get; set; }
        public int RoleId { get; set; }

        public virtual Role Role { get; set; }
        public virtual User User { get; set; }
    }
}
