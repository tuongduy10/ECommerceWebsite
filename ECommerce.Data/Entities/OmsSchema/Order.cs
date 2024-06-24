using ECommerce.Data.Abstractions;
using ECommerce.Data.Entities.Common;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Utilities.Constants;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ECommerce.Data.Entities.OmsSchema
{
    [Table("Orders", Schema = "oms")]
    public class Order : GenericAuditEntity<Guid>
    {
        public string OrderCode { get; set; }
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Remark { get; set; }
        public string PaymentMethod { get; set; }
        public decimal TotalPrice { get; set; }
        public decimal TotalFinalPrice { get; set; }
        public int TotalQty { get; set; }
        public string Status { get; set; } = OmsConstant.STATUS_ORDER_PENDING;
        public string Address { get; set; }
        public string CityCode { get; set; }
        public virtual Province City { get; set; }
        public string DistrictCode { get; set; }
        public virtual District District { get; set; }
        public string WardCode { get; set; }
        public virtual Ward Ward { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
