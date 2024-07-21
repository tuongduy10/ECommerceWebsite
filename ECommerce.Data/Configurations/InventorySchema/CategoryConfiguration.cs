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
    public class CategoryConfiguration : IEntityTypeConfiguration<Category>
    {
        public void Configure(EntityTypeBuilder<Category> entity)
        {
            entity.ToTable("Category");

            entity.Property(e => e.CategoryName)
                .IsRequired()
                .HasMaxLength(100);

            entity.HasQueryFilter(q => q.IsDeleted == false);
        }
    }
}
