﻿using System;
using System.Collections.Generic;
using ECommerce.Data.Entities.Inventory;

#nullable disable

namespace ECommerce.Data.Entities.ProductSchema
{
    public partial class ProductOption
    {
        public int ProductId { get; set; }
        public int OptionValueId { get; set; }

        public virtual OptionValue OptionValue { get; set; }
        public virtual Product Product { get; set; }
    }
}
