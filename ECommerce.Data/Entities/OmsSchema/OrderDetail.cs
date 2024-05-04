using ECommerce.Data.Abstractions;
using ECommerce.Data.Entities.ProductSchema;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ECommerce.Data.Entities.OmsSchema
{
    [Table("OrderDetails", Schema = "oms")]
    public class OrderDetail : GenericAuditUpdateEntity<Guid>
    {
        public string ProductName { get; set; }
        public decimal Price { get; set; }
        public decimal PriceOnSell { get; set; }
        public int Qty { get; set; }
        public decimal TotalPrice { get; set; }
        public decimal TotalFinalPrice { get; set; }
        public int ProductId { get; set; }
        public Guid OrderId { get; set; }
        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
    }
}
