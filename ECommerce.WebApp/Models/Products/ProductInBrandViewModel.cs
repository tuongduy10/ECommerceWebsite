﻿using ECommerce.Application.Services.Product.Dtos;
using ECommerce.Application.Services.SubCategory.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Models.Products
{
    public class ProductInBrandViewModel
    {
        public List<SubCategoryModel> listSubCategory { get; set; }
        public List<ProductInBrandModel> listProduct { get; set; }
    }
}
