using ECommerce.Data.Entities.ProductSchema;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Data.Configurations.InventorySchema
{
    public class BrandConfiguration : IEntityTypeConfiguration<Brand>
    {
        public void Configure(EntityTypeBuilder<Brand> entity)
        {
            entity.ToTable("Brand");

            entity.Property(e => e.BrandImagePath)
                .IsRequired()
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.Property(e => e.BrandName)
                .IsRequired()
                .HasMaxLength(100);

            entity.Property(e => e.CreatedDate).HasColumnType("date");

            entity.Property(e => e.Description).HasColumnType("ntext");

            entity.Property(e => e.DescriptionTitle).HasMaxLength(500);

            entity.HasOne(d => d.Discount)
                .WithMany(p => p.Brands)
                .HasForeignKey(d => d.DiscountId)
                .HasConstraintName("FK_Brand_Discount");

            entity.HasQueryFilter(q => q.IsDeleted == false);
        }
    }
}
