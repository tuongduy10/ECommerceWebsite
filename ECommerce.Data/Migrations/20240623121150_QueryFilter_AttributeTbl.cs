using Microsoft.EntityFrameworkCore.Migrations;

namespace ECommerce.Data.Migrations
{
    public partial class QueryFilter_AttributeTbl : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "dbo");

            migrationBuilder.RenameTable(
                name: "ProductSetting",
                newName: "ProductSetting",
                newSchema: "dbo");

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "Attribute",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "Attribute");

            migrationBuilder.RenameTable(
                name: "ProductSetting",
                schema: "dbo",
                newName: "ProductSetting");
        }
    }
}
