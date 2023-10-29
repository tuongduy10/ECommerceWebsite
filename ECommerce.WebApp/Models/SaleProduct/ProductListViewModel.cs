﻿using ECommerce.Application.BaseServices.Product.Dtos;
using ECommerce.Application.BaseServices.SubCategory.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Models.SaleProduct
{
    public class ProductListViewModel
    {
        public List<ProductShopListModel> products { get; set; }
        public List<SubCategoryModel> subCategories { get; set; }
    }
}
