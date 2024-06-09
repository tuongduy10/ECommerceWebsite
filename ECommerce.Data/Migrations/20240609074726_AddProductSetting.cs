using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ECommerce.Data.Migrations
{
    public partial class AddProductSetting : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "NewUpdatedDate",
                table: "Product",
                nullable: false,
                defaultValue: DateTime.Now);

            migrationBuilder.CreateTable(
                name: "ProductSetting",
                schema: "dbo",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedBy = table.Column<string>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedBy = table.Column<string>(nullable: true),
                    DeletedDate = table.Column<DateTime>(nullable: true),
                    DeletedBy = table.Column<string>(nullable: true),
                    NewPeriod = table.Column<int>(nullable: false, defaultValue: 14)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductSetting", x => x.Id);
                });

            migrationBuilder.Sql("INSERT INTO [dbo].[ProductSetting] " +
                "([Id],[CreatedDate],[CreatedBy],[IsDeleted],[UpdatedDate],[UpdatedBy],[DeletedDate],[DeletedBy],[NewPeriod]) " +
                "VALUES (NEWID(),getdate(),NULL,0,GETDATE(),NULL,NULL,NULL,14)");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ProductSetting");

            migrationBuilder.DropColumn(
                name: "NewUpdatedDate",
                table: "Product");
        }
    }
}
