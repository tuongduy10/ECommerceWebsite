﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.BaseServices.ProductImage.Dtos
{
    public class ProductImageModel
    {
        public int ProductImageId { get; set; }
        public string ProductImagePath { get; set; }
        public int ProductId { get; set; }
    }
}
