using ECommerce.Data.Entities.UserSchema;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Data.Configurations.UserSchema
{
    public class RoleToPermissionConfiguration : IEntityTypeConfiguration<RoleToPermission>
    {
        public void Configure(EntityTypeBuilder<RoleToPermission> builder)
        {
            builder.HasKey(e => new { e.RoleId, e.PermissionId });

            builder.ToTable("RoleToPermissions");
        }
    }
}
