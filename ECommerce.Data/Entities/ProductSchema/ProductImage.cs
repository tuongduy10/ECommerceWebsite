﻿using System;
using System.Collections.Generic;

namespace ECommerce.Data.Entities.ProductSchema
{
    public partial class ProductImage
    {
        public int ProductImageId { get; set; }
        public string ProductImagePath { get; set; }
        public int ProductId { get; set; }
        public int Order { get; set; }
        public virtual Product Product { get; set; }
    }
}
