using ECommerce.Data.Entities.UserSchema;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using ECommerce.Utilities.Constants;
using System.Reflection;
using System.ComponentModel;

namespace ECommerce.Data.Configurations.UserSchema
{
    public class PermissionConfiguration : IEntityTypeConfiguration<Permission>
    {
        public void Configure(EntityTypeBuilder<Permission> builder)
        {
            builder.Property(e => e.Name)
                .HasMaxLength(100)
                .IsUnicode(false);

            builder.Property(e => e.Module)
                .HasMaxLength(100)
                .IsUnicode(false);

            builder.HasData(getAllPermissions());
        }
        private List<Permission> getAllPermissions()
        {
            var permissions = new List<Permission>();
            var currentFields = typeof(PermissionConstant).GetFields();
            foreach (var field in currentFields)
            {
                permissions.Add(new Permission
                {
                    Id = field.GetValue(null).ToString(),
                    Name = field.GetValue(null).ToString(),
                    Module = null,
                });
            }

            var nestedClasses = typeof(PermissionConstant).GetNestedTypes();
            foreach (var nestedClass in nestedClasses)
            {
                var fields = nestedClass.GetFields(BindingFlags.Public | BindingFlags.Static | BindingFlags.FlattenHierarchy);
                foreach (var field in fields)
                {
                    permissions.Add(new Permission
                    {
                        Id = field.GetValue(null).ToString(),
                        Name = field.GetValue(null).ToString(),
                        Module = nestedClass.Name.ToUpper(),
                    });
                }
            }
            return permissions;
        }
    }
}
