using Microsoft.EntityFrameworkCore.Migrations;

namespace ECommerce.Data.Migrations
{
    public partial class UpdateRole : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_RoleToPermissions_Permissions_PermissionId",
                table: "RoleToPermissions");

            migrationBuilder.DropForeignKey(
                name: "FK_RoleToPermissions_Role_RoleId",
                table: "RoleToPermissions");

            migrationBuilder.DropTable(
                name: "Permissions");

            migrationBuilder.DropTable(
                name: "UserRole");

            migrationBuilder.DropTable(
                name: "Role");

            migrationBuilder.DropPrimaryKey(
                name: "PK_RoleToPermissions",
                table: "RoleToPermissions");

            migrationBuilder.DropIndex(
                name: "IX_RoleToPermissions_PermissionId",
                table: "RoleToPermissions");

            migrationBuilder.DropColumn(
                name: "RoleId",
                table: "RoleToPermissions");

            migrationBuilder.DropColumn(
                name: "PermissionId",
                table: "RoleToPermissions");

            migrationBuilder.AddColumn<string>(
                name: "RoleKey",
                table: "User",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PermissionKey",
                table: "RoleToPermissions",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "RoleKey",
                table: "RoleToPermissions",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_RoleToPermissions",
                table: "RoleToPermissions",
                column: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_RoleToPermissions",
                table: "RoleToPermissions");

            migrationBuilder.DropColumn(
                name: "RoleKey",
                table: "User");

            migrationBuilder.DropColumn(
                name: "PermissionKey",
                table: "RoleToPermissions");

            migrationBuilder.DropColumn(
                name: "RoleKey",
                table: "RoleToPermissions");

            migrationBuilder.AddColumn<int>(
                name: "RoleId",
                table: "RoleToPermissions",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "PermissionId",
                table: "RoleToPermissions",
                type: "nvarchar(100)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddPrimaryKey(
                name: "PK_RoleToPermissions",
                table: "RoleToPermissions",
                columns: new[] { "RoleId", "PermissionId" });

            migrationBuilder.CreateTable(
                name: "Permissions",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Module = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: true),
                    Name = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Permissions", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Role",
                columns: table => new
                {
                    RoleId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleName = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Role", x => x.RoleId);
                });

            migrationBuilder.CreateTable(
                name: "UserRole",
                columns: table => new
                {
                    UserId = table.Column<int>(type: "int", nullable: false),
                    RoleId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserRole", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_UserRole_Role",
                        column: x => x.RoleId,
                        principalTable: "Role",
                        principalColumn: "RoleId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_UserRole_User",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "UserId",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.InsertData(
                table: "Permissions",
                columns: new[] { "Id", "Module", "Name" },
                values: new object[,]
                {
                    { "ACCESS_ALL", null, "ACCESS_ALL" },
                    { "ORDER_READ", "ORDER", "ORDER_READ" },
                    { "ORDER_CREATE", "ORDER", "ORDER_CREATE" },
                    { "USER_DETAIL_DELETE", "USER", "USER_DETAIL_DELETE" },
                    { "USER_DETAIL_UPDATE", "USER", "USER_DETAIL_UPDATE" },
                    { "USER_DETAIL_READ", "USER", "USER_DETAIL_READ" },
                    { "USER_DETAIL_CREATE", "USER", "USER_DETAIL_CREATE" },
                    { "ORDER_UPDATE", "ORDER", "ORDER_UPDATE" },
                    { "USER_LIST_DELETE", "USER", "USER_LIST_DELETE" },
                    { "USER_LIST_READ", "USER", "USER_LIST_READ" },
                    { "USER_LIST_CREATE", "USER", "USER_LIST_CREATE" },
                    { "COMMON_DELETE", "COMMON", "COMMON_DELETE" },
                    { "COMMON_UPDATE", "COMMON", "COMMON_UPDATE" },
                    { "COMMON_READ", "COMMON", "COMMON_READ" },
                    { "COMMON_CREATE", "COMMON", "COMMON_CREATE" },
                    { "USER_LIST_UPDATE", "USER", "USER_LIST_UPDATE" },
                    { "ORDER_DELETE", "ORDER", "ORDER_DELETE" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_RoleToPermissions_PermissionId",
                table: "RoleToPermissions",
                column: "PermissionId");

            migrationBuilder.CreateIndex(
                name: "IX_UserRole_RoleId",
                table: "UserRole",
                column: "RoleId");

            migrationBuilder.AddForeignKey(
                name: "FK_RoleToPermissions_Permissions_PermissionId",
                table: "RoleToPermissions",
                column: "PermissionId",
                principalTable: "Permissions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_RoleToPermissions_Role_RoleId",
                table: "RoleToPermissions",
                column: "RoleId",
                principalTable: "Role",
                principalColumn: "RoleId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
