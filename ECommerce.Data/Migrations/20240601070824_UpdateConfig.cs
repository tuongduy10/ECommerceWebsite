using Microsoft.EntityFrameworkCore.Migrations;

namespace ECommerce.Data.Migrations
{
    public partial class UpdateConfig : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "InstagramUrl",
                table: "Configurations",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "YoutubeUrl",
                table: "Configurations",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "InstagramUrl",
                table: "Configurations");

            migrationBuilder.DropColumn(
                name: "YoutubeUrl",
                table: "Configurations");
        }
    }
}
