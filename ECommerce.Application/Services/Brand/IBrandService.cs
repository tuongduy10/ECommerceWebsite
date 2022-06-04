﻿using ECommerce.Application.Common;
using ECommerce.Application.Services.Brand.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Brand
{
    public interface IBrandService
    {
        Task<ApiResponse> Create(BrandCreateRequest request);
        Task<Response<FileChangedResponse>> Update(BrandUpdateRequest request);
        Task<int> Delete(int BrandId);
        Task<BrandModel> getBrandById(int BrandId);
        Task<List<BrandModel>> getAll();
        Task<List<BrandModel>> getAllManage();
        Task<List<BrandModel>> getAllBrandInCategory(int CategoryId);
    }
}
