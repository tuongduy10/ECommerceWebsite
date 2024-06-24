﻿using ECommerce.Application.BaseServices.Brand.Dtos;
using ECommerce.Application.BaseServices.SubCategory.Dtos;
using ECommerce.Data.Entities.ProductSchema;
using System;
using System.Collections.Generic;

namespace ECommerce.Application.BaseServices.Product.Dtos
{
    public class ProductDetailModel
    {
        public int ProductId { get; set; } //
        public string ProductCode { get; set; }
        public string PPC { get; set; }
        public string ProductName { get; set; } //
        public string ProductDescription { get; set; } //
        public string ProductDescriptionMobile { get; set; }
        public string SizeGuide { get; set; }
        public string Note { get; set; }
        public string Link { get; set; }
        public int Stock { get; set; }
        public bool? New { get; set; }
        public bool? Highlight { get; set; }
        public string? Delivery { get; set; } //
        public string? Repay { get; set; } //
        public bool? Legit { get; set; } //
        public string Insurance { get; set; } //
        public int SubCategoryId { get; set; }
        public string ShopName { get; set; } //
        public int ShopId { get; set; }
        // public int BrandId { get; set; } //
        public BrandModel? Brand { get; set; }
        public DateTime? ProductImportDate { get; set; } //
        public Rate ProductRate { get; set; } //

        // Price
        public decimal? PriceAvailable { get; set; }
        public decimal? DiscountAvailable { get; set; }
        public decimal? PricePreOrder { get; set; }
        public decimal? DiscountPreOrder { get; set; }
        public decimal? PriceImport { get; set; }
        public decimal? PriceForSeller { get; set; }
        public decimal? ProfitAvailable { get; set; }
        public decimal? ProfitPreOrder { get; set; }
        public decimal? ProfitForSeller { get; set; }

        public List<string> ProductImages { get; set; } // for view only
        public List<string> ProductUserImages { get; set; } // for view only

        public List<Data.Entities.ProductSchema.ProductImage> SystemImages { get; set; }
        public List<Data.Entities.ProductSchema.ProductUserImage> UserImages { get; set; }

        public byte? DiscountPercent { get; set; } //
        public List<ProductPrice> Prices { get; set; } //
        public List<Type> Types { get; set; } //
        public List<Attribute> Attributes { get; set; } //
        public List<OptionGetModel> Options { get; set; }
    }
    public class Attribute
    {
        public int Id { get; set; }
        public string AttrName { get; set; }
        public string Value { get; set; }
    }
    //public class Option
    //{
    //    public string Name { get; set; }
    //    public List<string> Value { get; set; }
    //}
    public class Rate
    {
        public int Value { get; set; }
        public int Total { get; set; }
    }
}
