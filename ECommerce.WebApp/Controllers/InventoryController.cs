﻿using ECommerce.Utilities.Constants;
using ECommerce.Application.BaseServices.Brand;
using ECommerce.Application.BaseServices.Product;
using ECommerce.Application.BaseServices.Product.Dtos;
using ECommerce.Application.BaseServices.Shop;
using ECommerce.Application.Services.Comment;
using ECommerce.Application.Services.Inventory;
using ECommerce.WebApp.Utils;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System;
using System.Threading.Tasks;
using ECommerce.Application.Services.UserSrv.Dtos;
using ECommerce.Application.Services.Inventory.Dtos;
using ECommerce.Application.Common;
using ECommerce.Utilities.Shared.Responses;

namespace ECommerce.WebApp.Controllers
{
    [AllowAnonymous]
    [ApiController]
    [Route("api/inventory")]
    public class InventoryController : ControllerBase
    {
        private IInventoryService _inventoryService;
        public InventoryController(IInventoryService inventoryService) 
        {
            _inventoryService = inventoryService;
        }
        [HttpPost("sub-categories")]
        public async Task<IActionResult> getSubCategories(InventoryRequest request)
        {
            var res = await _inventoryService.getSubCategories(request);
            if (!res.isSucceed) 
                return BadRequest(res);
            return Ok(res);
        }
        [HttpPost("get-brands")]
        public async Task<IActionResult> getBrands(BrandGetRequest request)
        {
            var res = await _inventoryService.getBrands(request);
            if (!res.isSucceed)
                return BadRequest(res);
            return Ok(res);
        }
        [HttpPost("add-brand")]
        public async Task<IActionResult> addBrand(BrandAddRequest request)
        {
            var res = await _inventoryService.addBrand(request);
            return Ok(res);
        }
        [HttpPost("update-brand")]
        public async Task<IActionResult> updateBrand(BrandAddRequest request)
        {
            var res = await _inventoryService.updateBrand(request);
            return Ok(res);
        }
        [HttpPost("delete-brand")]
        public async Task<IActionResult> deleteBrand([FromBody] int id)
        {
            var res = await _inventoryService.deleteBrand(id);
            return Ok(res);
        }

        [HttpPost("get-categories")]
        public async Task<IActionResult> getCategories()
        {
            var res = await _inventoryService.getCategories();
            if (!res.isSucceed)
                return BadRequest(res);
            return Ok(res);
        }
        [HttpGet("get-category/{id}")]
        public async Task<IActionResult> getCategories(int id)
        {
            var res = await _inventoryService.getCategory(id);
            if (!res.isSucceed)
                return BadRequest(res);
            return Ok(res);
        }
        [HttpPost("update-category")]
        public async Task<IActionResult> updateCategory(CategoryModelRequest req)
        {
            var res = await _inventoryService.updateCategory(req);
            if (!res.isSucceed)
                return BadRequest(res);
            return Ok(res);
        }
        [HttpPost("add-category")]
        public async Task<IActionResult> addCategory(CategoryModelRequest req)
        {
            var res = await _inventoryService.addCategory(req);
            if (!res.isSucceed)
                return BadRequest(res);
            return Ok(res);
        }
        [HttpPost("delete-category")]
        public async Task<IActionResult> deleteCategory([FromBody] int id)
        {
            var res = await _inventoryService.deleteCategory(id);
            if (!res.isSucceed)
                return BadRequest(res);
            return Ok(res);
        }
        [HttpPost("add-sub-category")]
        public async Task<IActionResult> addSubCategory(SubCategoryModel request)
        {
            var res = await _inventoryService.addSubCategory(request);
            if (!res.isSucceed)
                return BadRequest(res);
            return Ok(res);
        }
        [HttpPost("update-sub-category")]
        public async Task<IActionResult> updateSubCategory(SubCategoryModel request)
        {
            var res = await _inventoryService.updateSubCategory(request);
            if (!res.isSucceed)
                return BadRequest(res);
            return Ok(res);
        }
        [HttpPost("delete-sub-category")]
        public async Task<IActionResult> deleteSubCategory([FromBody] int id)
        {
            var res = await _inventoryService.deleteSubCategory(id);
            if (!res.isSucceed)
                return BadRequest(res);
            return Ok(res);
        }
        [HttpGet("get-brand/{id}")]
        public async Task<IActionResult> getBrand(int id)
        {
            var res = await _inventoryService.getBrand(id);
            if (!res.isSucceed)
                return BadRequest(res);
            return Ok(res);
        }
        [HttpPost("options")]
        public async Task<IActionResult> getOptions(InventoryRequest request)
        {
            var result = await _inventoryService.getOptions(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("save-options")]
        public async Task<IActionResult> saveOptions(OptionModel request)
        {
            var res = new Response<bool>();
            if (request.id > -1)
                res = await _inventoryService.updateOptions(request);
            if (request.id == -1)
                res = await _inventoryService.addOptions(request);

            if (!res.isSucceed)
                return BadRequest(res.Message);
            return Ok(res);
        }
        [HttpPost("delete-option")]
        public async Task<IActionResult> deleteOptions([FromBody] int id)
        {
            var res = await _inventoryService.deleteOption(id);
            return Ok(res);
        }
        [HttpPost("product-options")]
        public async Task<IActionResult> getProductOptions(InventoryRequest request)
        {
            var result = await _inventoryService.getProductOptions(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("product-attributes")]
        public async Task<IActionResult> getProductAttributes(InventoryRequest request)
        {
            var result = await _inventoryService.getProductAttributes(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("attributes")]
        public async Task<IActionResult> getAttributes(InventoryRequest request)
        {
            var result = await _inventoryService.getAttributes(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("delete-attribute")]
        public async Task<IActionResult> deleteAttribute([FromBody] int id)
        {
            var result = await _inventoryService.deleteAttribute(id);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("save-attributes")]
        public async Task<IActionResult> saveAttributes(InventoryRequest request)
        {
            var result = await _inventoryService.saveAttributes(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("save-size")]
        public async Task<IActionResult> updateSizeGuide(SizeGuideModel req)
        {
            var result = await _inventoryService.saveSizeGuide(req);
            return Ok(result);
        }
    }
}
