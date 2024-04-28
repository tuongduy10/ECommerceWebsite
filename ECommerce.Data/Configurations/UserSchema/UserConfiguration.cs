using ECommerce.Data.Entities.UserSchema;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using System.Text;

namespace ECommerce.Data.Configurations.UserSchema
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.ToTable("User");

            builder.Property(e => e.IsSystemAccount).HasColumnName("isSystemAccount");

            builder.Property(e => e.Password)
                .IsRequired()
                .HasMaxLength(100)
                .IsUnicode(false);

            builder.Property(e => e.UserAddress).HasMaxLength(100);

            builder.Property(e => e.UserCityCode)
                .HasMaxLength(50)
                .IsUnicode(false);

            builder.Property(e => e.UserDistrictCode)
                .HasMaxLength(50)
                .IsUnicode(false);

            builder.Property(e => e.UserFullName).HasMaxLength(100);

            builder.Property(e => e.UserJoinDate).HasColumnType("datetime");

            builder.Property(e => e.LastOnline).HasColumnType("datetime");

            builder.Property(e => e.UserMail)
                .HasMaxLength(50)
                .IsUnicode(false);

            builder.Property(e => e.UserPhone)
                .HasMaxLength(50)
                .IsUnicode(false);

            builder.Property(e => e.UserWardCode)
                .HasMaxLength(50)
                .IsUnicode(false);
        }
    }
}
