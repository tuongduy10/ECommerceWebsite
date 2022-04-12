﻿using System;
using System.Collections.Generic;

#nullable disable

namespace ECommerce.Data.Models
{
    public partial class ProductPrice
    {
        public int ProductId { get; set; }
        public int ProductTypeId { get; set; }
        public decimal? Price { get; set; }
        public decimal? PriceOnSell { get; set; }

        public virtual Product Product { get; set; }
        public virtual ProductType ProductNavigation { get; set; }
    }
}