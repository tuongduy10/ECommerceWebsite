using ECommerce.Data.Entities.UserSchema;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using System.Text;

namespace ECommerce.Data.Configurations.InventorySchema
{
    public class AttributeConfiguration : IEntityTypeConfiguration<Entities.Inventory.Attribute>
    {
        public void Configure(EntityTypeBuilder<Entities.Inventory.Attribute> builder)
        {
            builder.Property(e => e.AttributeName)
                .HasMaxLength(50);

            builder.HasQueryFilter(q => q.IsDeleted == false);

            builder.ToTable("Attribute");
        }
    }
}
