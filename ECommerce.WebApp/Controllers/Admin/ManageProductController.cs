﻿using ECommerce.Application.Constants;
using ECommerce.Application.Services.Brand;
using ECommerce.Application.Services.Product;
using ECommerce.Application.Services.Product.Dtos;
using ECommerce.Application.Services.Shop;
using ECommerce.Application.Services.SubCategory;
using ECommerce.WebApp.Models.Products;
using ECommerce.WebApp.Models.SaleProduct;
using ECommerce.WebApp.Utils;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Controllers.Admin
{
    [Authorize(AuthenticationSchemes = "AdminAuth")]
    [Authorize(Policy = "Admin")]
    public class ManageProductController : Controller
    {
        private IProductService _productService;
        private IBrandService _brandService;
        private IShopService _shopService;
        private ISubCategoryService _subCategoryService;
        private ManageFiles _manageFiles;
        private string FILE_PATH = FilePathConstant.PRODUCT_FILEPATH;
        private string FILE_PREFIX = FilePathConstant.PRODUCT_FILEPREFIX;
        public ManageProductController(
            IProductService productService,
            IBrandService brandService,
            IShopService shopService,
            IWebHostEnvironment webHostEnvironment,
            ISubCategoryService subCategoryService
        ) {
            _productService = productService;
            _brandService = brandService;
            _shopService = shopService;
            _subCategoryService = subCategoryService;
            _manageFiles = new ManageFiles(webHostEnvironment);
        }
        public async Task<IActionResult> ProductList(int subCategoryId = 0)
        {
            var model = new ProductListViewModel()
            {
                products = await _productService.getAllManaged(subCategoryId),
                subCategories = await _subCategoryService.getAll(),
            };
            return View(model);
        }
        [HttpGet]
        public async Task<IActionResult> AddProduct()
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(i => i.Type == "UserId").Value);
            var brands = await _brandService.getAllBrandInShop(userId);
            var shops = await _shopService.getShopListBySystemUserAccount();
            var model = new AddProductViewModel
            {
                brands = brands,
                shops = shops
            };
            return View(model);
        }
        [HttpPost]
        public async Task<IActionResult> AddProduct(ProductAddRequest request)
        {
            // Image null check
            if (request.systemImage == null)
            {
                return BadRequest("Vui lòng chọn ảnh");
            }

            request.userId = Int32.Parse(User.Claims.FirstOrDefault(i => i.Type == "UserId").Value);
            // Get files name
            request.systemFileName = _manageFiles.GetFilesName(request.systemImage, FILE_PREFIX);
            if (request.userFileName != null)
            {
                request.userFileName = _manageFiles.GetFilesName(request.userImage, FILE_PREFIX);
            }
            // Result 
            var result = await _productService.AddProduct(request);
            if (result.isSucceed)
            {
                // Add file with files, files'name, path
                _manageFiles.AddFiles(request.systemImage, request.systemFileName, FILE_PATH);
                if (request.userFileName != null)
                {
                    _manageFiles.AddFiles(request.userImage, request.userFileName, FILE_PATH);
                }
                return Ok(result.Message);
            }
            return BadRequest(result.Message);
        }
        public async Task<IActionResult> ProductDetail(ProductViewDetailRequest request)
        {
            var model = new ProductDetailViewModel
            {
                product = await _productService.GetProductDetailManaged(request.productId),
                shops = await _shopService.getShopList(),
                brands = await _brandService.getBrandsByShop(request.shopId),
                subCategories = await _subCategoryService.getSubCategoryInBrand(request.brandId)
            };
            return View(model);
        }
    }
}
