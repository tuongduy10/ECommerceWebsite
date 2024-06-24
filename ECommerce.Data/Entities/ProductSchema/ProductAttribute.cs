using System;
using System.Collections.Generic;
using ECommerce.Data.Entities.Inventory;

namespace ECommerce.Data.Entities.ProductSchema
{
    public partial class ProductAttribute
    {
        public int ProductId { get; set; }
        public int AttributeId { get; set; }
        public string Value { get; set; }

        public virtual Inventory.Attribute Attribute { get; set; }
        public virtual Product Product { get; set; }
    }
}
