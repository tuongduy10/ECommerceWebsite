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
    public class SubCategoryConfiguration : IEntityTypeConfiguration<SubCategory>
    {
        public void Configure(EntityTypeBuilder<SubCategory> entity)
        {
            entity.ToTable("SubCategory");

            entity.Property(e => e.SubCategoryName)
                .IsRequired()
                .HasMaxLength(50);

            entity.HasOne(d => d.Category)
                .WithMany(p => p.SubCategories)
                .HasForeignKey(d => d.CategoryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_SubCategory_Category");

            entity.HasOne(d => d.SizeGuide)
                .WithMany(p => p.SubCategories)
                .HasForeignKey(d => d.SizeGuideId)
                .HasConstraintName("FK_SubCategory_SizeGuide");

            entity.HasQueryFilter(q => q.IsDeleted == false);
        }
    }
}
