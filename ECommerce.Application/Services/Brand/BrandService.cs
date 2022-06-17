﻿using ECommerce.Application.Common;
using ECommerce.Application.Services.Brand.Dtos;
using ECommerce.Data.Context;
using ECommerce.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Brand
{
    public class BrandService : IBrandService
    {
        private readonly ECommerceContext _DbContext;
        public BrandService(ECommerceContext DbContext)
        {
            this._DbContext = DbContext;
        }
        public async Task<ApiResponse> Create(BrandCreateRequest request)
        {
            try
            {
                if (string.IsNullOrEmpty(request.BrandImagePath) || string.IsNullOrEmpty(request.BrandName) || request.CategoryId == 0)
                {
                    return new ApiFailResponse("Thông tin không được để trống");
                }
                var name = await _DbContext.Brands.Where(i => i.BrandName == request.BrandName).ToListAsync();
                if (name.Count() > 0) return new ApiFailResponse("Tên đã tồn tại");

                // create new 
                var brand = new Data.Models.Brand
                {
                    BrandName = request.BrandName,
                    BrandImagePath = request.BrandImagePath,
                    CreatedDate = DateTime.Now,
                    Status = true,
                    CategoryId = request.CategoryId,
                    Highlights = request.Highlights
                };

                await _DbContext.Brands.AddAsync(brand);
                await _DbContext.SaveChangesAsync();
                return new ApiSuccessResponse("Thêm thành công");
            }
            catch
            {
                return new ApiFailResponse("Thêm thất bại");
            }
        }
        public async Task<Response<FileChangedResponse>> Update(BrandUpdateRequest request)
        {
            if (string.IsNullOrEmpty(request.BrandName) || request.CategoryId == 0)
            {
                return new FailResponse<FileChangedResponse>("Thông tin không được để trống");
            }
            try
            {
                var brand = await _DbContext.Brands.Where(i => i.BrandId == request.BrandId).FirstOrDefaultAsync();
                var oldFileName = brand.BrandImagePath;

                var fileChange = new FileChangedResponse();
                fileChange.previousFileName = oldFileName;
                if (request.BrandImagePath != null)
                {
                    brand.BrandImagePath = request.BrandImagePath;
                    fileChange.newFileName = brand.BrandImagePath;
                }
                brand.BrandName = request.BrandName;
                brand.Highlights = request.Highlights;
                brand.Status = request.Status;
                brand.CategoryId = request.CategoryId;
                await _DbContext.SaveChangesAsync();

                return new SuccessResponse<FileChangedResponse>("Cập nhật thành công", fileChange);
            }
            catch(Exception error)
            {
                return new FailResponse<FileChangedResponse>("Cập nhật thất bại" + error.Message);
            }
        }
        public async Task<ApiResponse> UpdateStatus(int id, bool status)
        {
            try
            {
                var brand = await _DbContext.Brands.Where(i => i.BrandId == id).FirstOrDefaultAsync();
                brand.Status = status;
                _DbContext.SaveChangesAsync().Wait();
                return new ApiSuccessResponse("Cập nhật thành công");
            }
            catch
            {
                return new ApiFailResponse("Cập nhật thất bại");
            }
        }
        public async Task<List<BrandModel>> getAll()
        {
            var query = from category in _DbContext.Categories
                        join brand in _DbContext.Brands on category.CategoryId equals brand.CategoryId
                        orderby brand.BrandName
                        where brand.Status == true
                        select new { brand, category};

            var list = await query.Select(i => new BrandModel()
            {
                BrandId = i.brand.BrandId,
                BrandName = i.brand.BrandName,
                BrandImagePath = i.brand.BrandImagePath,
                Status = i.brand.Status,
                CreatedDate = i.brand.CreatedDate,
                Highlights = i.brand.Highlights,
                New = i.brand.New,
                Category = i.category.CategoryName,
                CategoryId = i.category.CategoryId
            }).ToListAsync();

            return list;
        }
        public async Task<List<BrandModel>> getAllManage()
        {
            var query = from category in _DbContext.Categories
                        join brand in _DbContext.Brands on category.CategoryId equals brand.CategoryId
                        orderby brand.BrandName
                        select new { brand, category };

            var list = await query.Select(i => new BrandModel()
            {
                BrandId = i.brand.BrandId,
                BrandName = i.brand.BrandName,
                BrandImagePath = i.brand.BrandImagePath,
                Status = i.brand.Status,
                CreatedDate = i.brand.CreatedDate,
                Highlights = i.brand.Highlights,
                New = i.brand.New,
                Category = i.category.CategoryName,
                CategoryId = i.category.CategoryId
            }).ToListAsync();

            return list;
        }
        public async Task<List<BrandModel>> getAllBrandInCategory(int CategoryId)
        {
            var query = from category in _DbContext.Categories
                        join brand in _DbContext.Brands on category.CategoryId equals brand.CategoryId
                        orderby brand.BrandName
                        where brand.Status == true && category.CategoryId == CategoryId
                        select new { brand, category };

            var list = await query.Select(i => new BrandModel()
            {
                BrandId = i.brand.BrandId,
                BrandName = i.brand.BrandName,
                BrandImagePath = i.brand.BrandImagePath,
                Status = i.brand.Status,
                CreatedDate = i.brand.CreatedDate,
                Highlights = i.brand.Highlights,
                New = i.brand.New,
                Category = i.category.CategoryName,
                CategoryId = i.category.CategoryId
            }).ToListAsync();

            return list;
        }
        public async Task<BrandModel> getBrandById(int BrandId)
        {
            var query = from category in _DbContext.Categories
                        join brand in _DbContext.Brands on category.CategoryId equals brand.CategoryId
                        orderby brand.BrandName
                        where brand.Status == true && brand.BrandId == BrandId
                        select new { brand, category };

            var result = await query.Select(i => new BrandModel()
            {
                BrandId = i.brand.BrandId,
                BrandName = i.brand.BrandName,
                BrandImagePath = i.brand.BrandImagePath,
                Status = i.brand.Status,
                CreatedDate = i.brand.CreatedDate,
                Highlights = i.brand.Highlights,
                New = i.brand.New,
                Category = i.category.CategoryName,
                CategoryId = i.category.CategoryId
            }).SingleOrDefaultAsync();

            return result;
        }
        public async Task<ApiResponse> DeleteBrand(int id)
        {
            try
            {
                var brand = await _DbContext.Brands.Where(i => i.BrandId == id).FirstOrDefaultAsync();

                var productCount = await _DbContext.Products.Where(i => i.BrandId == id).CountAsync();
                var hasProduct = productCount > 0;
                if (hasProduct)
                {
                    return new ApiFailResponse($"Thương hiệu này đang tồn tại { productCount } sản phẩm, không thể xóa");
                }

                var shopCount = await _DbContext.ShopBrands.Where(i => i.BrandId == id).CountAsync();
                var hasShop = shopCount > 0;
                if (hasShop)
                {
                    return new ApiFailResponse($"Thương hiệu đang được { shopCount } shop quản lý, không thể xóa");
                }
                _DbContext.Remove(brand);
                _DbContext.SaveChangesAsync().Wait();
                 
                return new ApiSuccessResponse("Xóa thành công");
            }
            catch
            {
                return new ApiSuccessResponse("Xóa thất bại");
            }
        }
    }
}
