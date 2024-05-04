using Microsoft.EntityFrameworkCore.Migrations;

namespace ECommerce.Data.Migrations
{
    public partial class AddPermissionTbl : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Permissions",
                schema: "dbo",
                columns: table => new
                {
                    Id = table.Column<string>(maxLength: 100, nullable: false),
                    Name = table.Column<string>(unicode: false, maxLength: 100, nullable: true),
                    Module = table.Column<string>(unicode: false, maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Permissions", x => x.Id);
                });

            migrationBuilder.InsertData(
                schema: "dbo",
                table: "Permissions",
                columns: new[] { "Id", "Module", "Name" },
                values: new object[,]
                {
                    { "ACCESS_ALL", null, "ACCESS_ALL" },
                    { "ORDER_UPDATE", "ORDER", "ORDER_UPDATE" },
                    { "ORDER_READ", "ORDER", "ORDER_READ" },
                    { "ORDER_CREATE", "ORDER", "ORDER_CREATE" },
                    { "USER_DETAIL_DELETE", "USER", "USER_DETAIL_DELETE" },
                    { "USER_DETAIL_UPDATE", "USER", "USER_DETAIL_UPDATE" },
                    { "USER_DETAIL_READ", "USER", "USER_DETAIL_READ" },
                    { "USER_DETAIL_CREATE", "USER", "USER_DETAIL_CREATE" },
                    { "USER_LIST_DELETE", "USER", "USER_LIST_DELETE" },
                    { "USER_LIST_UPDATE", "USER", "USER_LIST_UPDATE" },
                    { "USER_LIST_READ", "USER", "USER_LIST_READ" },
                    { "USER_LIST_CREATE", "USER", "USER_LIST_CREATE" },
                    { "COMMON_DELETE", "COMMON", "COMMON_DELETE" },
                    { "COMMON_UPDATE", "COMMON", "COMMON_UPDATE" },
                    { "COMMON_READ", "COMMON", "COMMON_READ" },
                    { "COMMON_CREATE", "COMMON", "COMMON_CREATE" },
                    { "ORDER_DELETE", "ORDER", "ORDER_DELETE" },
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Permissions",
                schema: "dbo");
        }
    }
}
