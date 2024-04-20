using Microsoft.EntityFrameworkCore.Migrations;

namespace ECommerce.Data.Migrations
{
    public partial class RemoveNotificationTypeTbl : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Notification_NotificationType",
                table: "Notification");

            migrationBuilder.DropTable(
                name: "NotificationType");

            migrationBuilder.DropColumn(
                name: "TypeId",
                table: "Notification");

            migrationBuilder.AddColumn<string>(
                name: "TypeCode",
                table: "Notification",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "TypeCode",
                table: "Notification");

            migrationBuilder.AddColumn<int>(
                name: "TypeId",
                table: "Notification",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "NotificationType",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TypeCode = table.Column<string>(type: "varchar(256)", unicode: false, maxLength: 256, nullable: true),
                    TypeName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NotificationType", x => x.Id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_Notification_NotificationType",
                table: "Notification",
                column: "TypeId",
                principalTable: "NotificationType",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
