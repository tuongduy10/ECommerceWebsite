﻿using ECommerce.Application.Common;
using ECommerce.Application.BaseServices.Brand.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ECommerce.Utilities.Shared.Responses;

namespace ECommerce.Application.BaseServices.Brand
{
    public interface IBrandService
    {
        Task<ApiResponse> Create(BrandCreateRequest request);
        Task<Response<FileChangedResponse>> Update(BrandUpdateRequest request);
        Task<ApiResponse> UpdateStatus(int id, bool status);
        Task<ApiResponse> UpdateBrandsStatus(List<int> ids, bool status);
        Task<ApiResponse> UpdateBrandDescription(BrandUpdateRequest request);
        Task<BrandModel> getBrandById(int BrandId);
        Task<List<BrandModel>> getAll();
        Task<List<BrandModel>> getAllManage();
        Task<List<BrandModel>> getAllAvailableManage();
        Task<List<BrandModel>> getAllAvailableInCategory(int CategoryId);
        Task<List<BrandModel>> getAllBrandInShop(int userId);
        Task<Response<string>> DeleteBrand(int id);
        Task<Response<List<string>>> DeleteBrands(List<int> ids);
        Task<List<BrandModel>> getBrandsByShop(int id);
        Task<List<BrandModel>> GetAllAvailable();
    }
}
