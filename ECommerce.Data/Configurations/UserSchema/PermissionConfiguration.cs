using ECommerce.Data.Entities.UserSchema;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using ECommerce.Utilities.Constants;
using System.Reflection;

namespace ECommerce.Data.Configurations.UserSchema
{
    public class PermissionConfiguration : IEntityTypeConfiguration<Permission>
    {
        public void Configure(EntityTypeBuilder<Permission> builder)
        {


            builder.HasData(getAllPermissions());
        }
        private List<Permission> getAllPermissions()
        {
            var permissions = new List<Permission>();
            var nestedClasses = typeof(PermissionConstant).GetNestedTypes();
            foreach (var nestedClass in nestedClasses)
            {
                var fields = nestedClass.GetFields(BindingFlags.Public | BindingFlags.Static | BindingFlags.FlattenHierarchy);
                foreach (var field in fields)
                {
                    permissions.Add(new Permission
                    {
                        Name = field.Name,
                        Value = field.GetValue(null).ToString(),
                        Module = nestedClass.Name,
                    });
                }
            }
            return permissions;
        }
    }
}
