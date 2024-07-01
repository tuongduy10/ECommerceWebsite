using Microsoft.EntityFrameworkCore.Migrations;

namespace ECommerce.Data.Migrations
{
    public partial class QueryFilter_MasterData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "SubCategory",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "Option",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "SubCategory");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "Option");
        }
    }
}
