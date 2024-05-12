using ECommerce.Data.Abstractions;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;
using System.Text;

namespace ECommerce.Data.Entities.UserSchema
{
    [Table("Permissions")]
    public class Permission
    {
        [Key]
        [NotNull]
        [MaxLength(100)]
        public string Id { get; set; }
        public string Name { get; set; }
        public string Module { get; set; }
    }
}
