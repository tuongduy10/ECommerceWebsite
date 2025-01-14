﻿using System;
using System.Collections.Generic;

namespace ECommerce.Data.Entities.ProductSchema
{
    public partial class ShopBrand
    {
        public int ShopId { get; set; }
        public int BrandId { get; set; }

        public virtual Brand Brand { get; set; }
        public virtual Shop Shop { get; set; }
    }
}
