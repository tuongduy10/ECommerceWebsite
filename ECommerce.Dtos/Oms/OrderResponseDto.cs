using ECommerce.Data.Entities.OmsSchema;
using ECommerce.Utilities.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ECommerce.Dtos.Oms
{
    public class OrderResponseDto
    {
        public Guid Id { get; set; }
        public string orderCode { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Remark { get; set; }
        public string PaymentMethod { get; set; }
        public decimal TotalPrice { get; set; }
        public decimal TotalFinalPrice { get; set; }
        public int TotalQty { get; set; }
        public string Status { get; set; }
        public string Address { get; set; }
        public string CityCode { get; set; }
        public string CityName { get; set; }
        public string DistrictCode { get; set; }
        public string DistrictName { get; set; }
        public string WardCode { get; set; }
        public string WardName { get; set; }
        public IEnumerable<OrderDetailResponseDto> OrderDetails { get; set; }
        public static explicit operator OrderResponseDto(Order data)
        {
            return new OrderResponseDto
            {
                Id = data.Id,
                orderCode = data.OrderCode,
                CreatedDate = data.CreatedDate,
                CreatedBy = data.CreatedBy,
                CityCode = data.CityCode,
                CityName = data.City.Name,
                DistrictCode = data.DistrictCode,
                DistrictName = data.District.Name,
                WardCode = data.WardCode,
                WardName = data.Ward.Name,
                Address = data.Address,
                Email = data.Email,
                FullName = data.FullName,
                PaymentMethod = data.PaymentMethod,
                PhoneNumber = data.PhoneNumber,
                Remark = data.Remark,
                Status = data.Status,
                TotalFinalPrice = data.TotalFinalPrice,
                TotalPrice = data.TotalPrice,
                UpdatedDate = data.UpdatedDate,
                TotalQty = data.TotalQty,
                OrderDetails = data.OrderDetails.Select(_ => (OrderDetailResponseDto)_).ToList(),
            };
        }
    }

    public class OrderDetailResponseDto
    {
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public decimal PriceOnSell { get; set; }
        public decimal TotalPrice { get; set; }
        public decimal TotalFinalPrice { get; set; }
        public int Qty { get; set; }
        public string options { get; set; }
        public int ProductId { get; set; }
        public static explicit operator OrderDetailResponseDto(OrderDetail data)
        {
            return new OrderDetailResponseDto
            {
                Price = data.Price,
                PriceOnSell = data.PriceOnSell,
                TotalPrice = data.TotalPrice,
                TotalFinalPrice = data.TotalFinalPrice,
                ProductId = data.ProductId,
                ProductName = data.ProductName,
                Qty = data.Qty,
                options = data.Options
            };
        }
    }
}
