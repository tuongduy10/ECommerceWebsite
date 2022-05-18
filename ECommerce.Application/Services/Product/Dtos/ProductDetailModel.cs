﻿using ECommerce.Data.Models;
using System;
using System.Collections.Generic;

namespace ECommerce.Application.Services.Product.Dtos
{
    public class ProductDetailModel
    {
        public int ProductId { get; set; } //
        public string ProductName { get; set; } //
        public string ProductDescription { get; set; } //

        public bool? FreeDelivery { get; set; } //
        public bool? FreeReturn { get; set; } //
        public bool? Legit { get; set; } //
        public string Insurance { get; set; } //

        public string ShopName { get; set; } //
        public int BrandId { get; set; } //
        public string BrandName { get; set; } //
        public DateTime? ProductImportDate { get; set; } //
        public Rate ProductRate { get; set; } //

        public List<string> ProductImages { get; set; } //
        public List<string> ProductUserImages { get; set; } //

        public byte? DiscountPercent { get; set; } //
        public List<ProductPrice> Prices { get; set; } //
        public List<Type> Types { get; set; } //
        public List<Attribute> Attributes { get; set; } //
    }
    public class Attribute
    {
        public string AttrName { get; set; }
        public string Value { get; set; }
    }
    public class OptionModel
    {
        public List<Option> Options { get; set; }
        public List<OptionValue> OptionValues { get; set; }
    }
    public class OptionValue
    {
        public int Id { get; set; }
        public string Value { get; set; }
    }
    public class Option
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
    public class Rate
    {
        public int Value { get; set; }
        public int Total { get; set; }
    }
}
