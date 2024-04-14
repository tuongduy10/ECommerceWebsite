using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ECommerce.Data.Migrations
{
    public partial class AddOrderTbl : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "oms");

            migrationBuilder.CreateTable(
                name: "Orders",
                schema: "oms",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreatedDate = table.Column<DateTime>(nullable: false),
                    CreatedBy = table.Column<string>(nullable: true),
                    UpdatedDate = table.Column<DateTime>(nullable: true),
                    UpdatedBy = table.Column<string>(nullable: true),
                    DeletedDate = table.Column<DateTime>(nullable: true),
                    DeletedBy = table.Column<string>(nullable: true),
                    FullName = table.Column<string>(nullable: true),
                    PhoneNumber = table.Column<string>(nullable: true),
                    Email = table.Column<string>(nullable: true),
                    Remark = table.Column<string>(nullable: true),
                    CityId = table.Column<int>(nullable: false),
                    CityCode = table.Column<string>(nullable: false),
                    DistrictId = table.Column<int>(nullable: false),
                    DistrictCode = table.Column<string>(nullable: true),
                    WardId = table.Column<int>(nullable: false),
                    WardCode = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Orders", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Orders_Provinces_CityCode",
                        column: x => x.CityCode,
                        principalTable: "Provinces",
                        principalColumn: "Code",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Orders_Districts_DistrictCode",
                        column: x => x.DistrictCode,
                        principalTable: "Districts",
                        principalColumn: "Code",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Orders_Wards_WardCode",
                        column: x => x.WardCode,
                        principalTable: "Wards",
                        principalColumn: "Code",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Orders_CityCode",
                schema: "oms",
                table: "Orders",
                column: "CityCode");

            migrationBuilder.CreateIndex(
                name: "IX_Orders_DistrictCode",
                schema: "oms",
                table: "Orders",
                column: "DistrictCode");

            migrationBuilder.CreateIndex(
                name: "IX_Orders_WardCode",
                schema: "oms",
                table: "Orders",
                column: "WardCode");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Orders",
                schema: "oms");
        }
    }
}
