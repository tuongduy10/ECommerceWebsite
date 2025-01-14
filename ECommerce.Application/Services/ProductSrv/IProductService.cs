﻿using ECommerce.Application.Common;
using ECommerce.Application.Services.ProductSrv.Dtos;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Utilities.Shared.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.ProductSrv
{
    public interface IProductService
    {
        Task<Response<ProductModel>> getProductDetail(int id);
        Task<Response<PageResult<ProductModel>>> getProductList(ProductGetRequest request);
        Task<Response<PageResult<ProductModel>>> getProductManagedList(ProductGetRequest request);
        Task<Response<DiscountModel>> getDiscount(DiscountGetRequest request);
        Task<Response<bool>> updateStatus(UpdateStatusRequest request);
        Task<Response<bool>> save(ProductSaveRequest request); // add or update
        Task<Response<ProductDeleteResponse>> delete(ProductDeleteRequest request);
        Task<Response<List<string>>> removeUserImages(List<int?> ids);
        Task<Response<List<string>>> removeUserImages(List<string> fileNames);
        Task<Response<List<string>>> removeSystemImages(List<int?> ids);
        Task<Response<List<string>>> removeSystemImages(List<string> fileNames);
        Task processUpdateNewProduct();
        Task<Response<ProductSetting>> getSettings();
        Task<Response<ProductSetting>> updateSetting(ProductSetting request);
    }
}
