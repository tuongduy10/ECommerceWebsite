﻿using ECommerce.Application.Common;
using ECommerce.Application.Services.Product.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Product
{
    public interface IProductService
    {
        Task<PageResult<ProductInBrandModel>> getProductPaginated(ProductGetRequest request);
        Task<List<ProductInBrandModel>> getProductSuggestion();
        Task<ProductDetailModel> getProductDetail(int id);
        Task<ProductDetailModel> GetProductDetailManaged(int id);
        Task<List<Option>> getProductOption(int id);
        Task<List<ProductShopListModel>> getProductByUser(int shopId, int subcategoryId);
        Task<List<ProductShopListModel>> getAllManaged(int subcategoryId);
        Task<PageResult<ProductInBrandModel>> getProductInPagePaginated(ProductGetRequest request);
        Task<Price> getProductPrice(int productId, int typeId);
        Task<ApiResponse> AddProduct(ProductAddRequest request);
        Task<Response<ProductDeleteResponse>> DeleteProduct(int id);
        Task<ApiResponse> DisableProducts(List<int> ids);
        Task<ApiResponse> ApproveProducts(List<int> ids);
        Task<ApiResponse> AddSizeGuide(SizeGuideAddRequest request);
        Task<ApiResponse> UpdateSizeGuide(SizeGuideAddRequest request);
        Task<Response<Data.Models.SizeGuide>> SizeGuideDetail(int id);
    }
}
