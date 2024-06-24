using Microsoft.EntityFrameworkCore.Migrations;

namespace ECommerce.Data.Migrations
{
    public partial class UpdateOrderTbl : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Provinces_CityCode",
                schema: "oms",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Wards_WardCode",
                schema: "oms",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "CityId",
                schema: "oms",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "DistrictId",
                schema: "oms",
                table: "Orders");

            migrationBuilder.DropColumn(
                name: "WardId",
                schema: "oms",
                table: "Orders");

            migrationBuilder.AlterColumn<string>(
                name: "WardCode",
                schema: "oms",
                table: "Orders",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");

            migrationBuilder.AlterColumn<string>(
                name: "CityCode",
                schema: "oms",
                table: "Orders",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Provinces_CityCode",
                schema: "oms",
                table: "Orders",
                column: "CityCode",
                principalTable: "Provinces",
                principalColumn: "Code",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Wards_WardCode",
                schema: "oms",
                table: "Orders",
                column: "WardCode",
                principalTable: "Wards",
                principalColumn: "Code",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Provinces_CityCode",
                schema: "oms",
                table: "Orders");

            migrationBuilder.DropForeignKey(
                name: "FK_Orders_Wards_WardCode",
                schema: "oms",
                table: "Orders");

            migrationBuilder.AlterColumn<string>(
                name: "WardCode",
                schema: "oms",
                table: "Orders",
                type: "nvarchar(450)",
                nullable: false,
                oldClrType: typeof(string),
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "CityCode",
                schema: "oms",
                table: "Orders",
                type: "nvarchar(450)",
                nullable: false,
                oldClrType: typeof(string),
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CityId",
                schema: "oms",
                table: "Orders",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "DistrictId",
                schema: "oms",
                table: "Orders",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "WardId",
                schema: "oms",
                table: "Orders",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Provinces_CityCode",
                schema: "oms",
                table: "Orders",
                column: "CityCode",
                principalTable: "Provinces",
                principalColumn: "Code",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Orders_Wards_WardCode",
                schema: "oms",
                table: "Orders",
                column: "WardCode",
                principalTable: "Wards",
                principalColumn: "Code",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
