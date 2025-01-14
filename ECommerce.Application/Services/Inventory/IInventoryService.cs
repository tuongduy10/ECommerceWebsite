﻿using ECommerce.Application.BaseServices.FilterProduct.Dtos;
using ECommerce.Application.Common;
using ECommerce.Application.Services.Inventory.Dtos;
using ECommerce.Application.Services.UserSrv.Dtos;
using ECommerce.Data.Entities.Inventory;
using ECommerce.Utilities.Shared.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Inventory
{
    public interface IInventoryService
    {
        Task<Response<BrandModel>> getBrand(int brandId);
        Task<Response<List<BrandModel>>> getBrands(BrandGetRequest request);
        Task<Response<bool>> addBrand(BrandAddRequest request);
        Task<Response<bool>> updateBrand(BrandAddRequest request);
        Task<Response<bool>> deleteBrand(int id);
        Task<Response<List<CategoryModel>>> getCategories();
        Task<Response<CategoryModel>> getCategory(int id);
        Task<Response<Category>> updateCategory(CategoryModelRequest req);
        Task<Response<Category>> addCategory(CategoryModelRequest req);
        Task<Response<bool>> deleteCategory(int id);
        Task<Response<List<SubCategoryModel>>> getSubCategories(InventoryRequest request);
        Task<Response<SubCategory>> updateSubCategory(SubCategoryModel request);
        Task<Response<SubCategory>> addSubCategory(SubCategoryModel request);
        Task<Response<bool>> deleteSubCategory(int id);
        Task<Response<bool>> deleteAttribute(int id);
        Task<Response<List<OptionModel>>> getOptions(InventoryRequest request);
        Task<Response<bool>> addOptions(OptionModel request);
        Task<Response<bool>> updateOptions(OptionModel request);
        Task<Response<bool>> deleteOption(int id);
        Task<Response<List<OptionModel>>> getProductOptions(InventoryRequest request);
        Task<Response<List<AttributeModel>>> getAttributes(InventoryRequest request);
        Task<Response<bool>> saveAttributes(InventoryRequest request);
        Task<Response<List<AttributeModel>>> getProductAttributes(InventoryRequest request);
        Task<Response<List<SizeGuideModel>>> getProductSizeGuides();
        Task<Response<bool>> saveSizeGuide(SizeGuideModel request);
    }
}
