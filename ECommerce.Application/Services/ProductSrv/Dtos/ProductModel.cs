﻿using ECommerce.Application.BaseServices.Shop.Dtos;
using ECommerce.Application.Services.Inventory.Dtos;
using ECommerce.Data.Entities;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Application.Services.ProductSrv.Dtos
{
    public class ProductModel
    {
        public int id { get; set; }
        public string? ppc { get; set; }
        public string? code { get; set; }
        public string name { get; set; }
        public byte? discountPercent { get; set; }
        public int? stock { get; set; }
        public byte? status { get; set; }
        public bool? isNew { get; set; } // Mới
        public bool? isHighlight { get; set; } // Hot
        public bool? isLegit { get; set; } // Hot
        // sub category
        public int subCategoryId { get; set; }
        public string? subCategoryName { get; set; }
        public SubCategoryModel subCategory { get; set; }
        public string? categoryName { get; set; }
        public int shopId { get; set; }
        public ShopModel shop { get; set; }
        public int brandId { get; set; }
        public BrandModel brand { get; set; }

        public DateTime? createdDate { get; set; }
        public DateTime? importDate { get; set; }
        public List<string> imagePaths { get; set; }
        public List<string> userImagePaths { get; set; }
        public string? description { get; set; }
        public string? sizeGuide { get; set; }
        public string? size { get; set; }
        public string? link { get; set; }
        public string? note { get; set; }
        public string? repay { get; set; } // Đổi trả
        public string? delivery { get; set; } // Giao hàng
        public string? insurance { get; set; } // Bảo hành
        // Price
        public decimal? priceAvailable { get; set; }
        public decimal? discountAvailable { get; set; }
        public decimal? pricePreOrder { get; set; }
        public decimal? discountPreOrder { get; set; }
        public bool? isDiscountPercent { get; set; }
        public decimal? priceImport { get; set; }
        public decimal? priceForSeller { get; set; }
        // Profit from price
        public decimal? profitAvailable { get; set; }
        public decimal? profitPreOrder { get; set; }
        public decimal? profitForSeller { get; set; }

        public decimal? profitPreOrderForSeller { get; set; }
        public decimal? profitAvailableForSeller { get; set; }
        // Relationship data
        public List<OptionModel>? options { get; set; }
        public List<AttributeModel>? attributes { get; set; }
        public ReviewModel review { get; set; }
        public ProductModel()
        {
            id = -1;
            subCategoryId = -1;
            shopId = -1;
            brandId = -1;
        }
    }
}
