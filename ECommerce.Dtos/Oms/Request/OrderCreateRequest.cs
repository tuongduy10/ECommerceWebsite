using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Dtos.Oms.Request
{
    public class OrderCreateRequest
    {
        public DeliveryInfo deliveryInfo { get; set; }
        public IEnumerable<ProductsInCart> products { get; set; }
    }

    public class DeliveryInfo
    {
        public string fullName { get; set; }
        public string phoneNumber { get; set; }
        public string email { get; set; }
        public string cityCode { get; set; }
        public string districtCode { get; set; }
        public string wardCode { get; set; }
        public string address { get; set; }
        public string remark { get; set; }
        public string paymentMethod { get; set; }
    }

    public class ProductsInCart
    {
        public int id { get; set; }
        public string priceType { get; set; }
        public object options { get; set; }
        public int qty { get; set; }
    }
}
