using System;
using System.Collections.Generic;
using ECommerce.Data.Entities.Inventory;

namespace ECommerce.Data.Entities.ProductSchema
{
    public partial class ProductOptionValue
    {
        public int ProductId { get; set; }
        public int OptionValueId { get; set; }

        public virtual OptionValue OptionValue { get; set; }
        public virtual Product Product { get; set; }
    }
}
