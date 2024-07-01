using ECommerce.Data.Entities.Inventory;
using ECommerce.Data.Entities.UserSchema;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using System.Text;

namespace ECommerce.Data.Configurations.InventorySchema
{
    public class OptionConfiguration : IEntityTypeConfiguration<Option>
    {
        public void Configure(EntityTypeBuilder<Option> entity)
        {
            entity.ToTable("Option");

            entity.Property(e => e.OptionName)
                .IsRequired()
                .HasMaxLength(50);

            entity.HasQueryFilter(q => q.IsDeleted == false);
        }
    }
}
