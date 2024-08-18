using Microsoft.EntityFrameworkCore.Migrations;

namespace ECommerce.Data.Migrations
{
    public partial class UpdateCollation : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("ALTER TABLE [hihichi_com_ecommerceweb].[dbo].[Product] ALTER COLUMN ProductName NVARCHAR(255) COLLATE Vietnamese_CI_AI");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }
    }
}
