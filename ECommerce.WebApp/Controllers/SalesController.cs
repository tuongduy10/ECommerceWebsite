﻿using ECommerce.Application.BaseServices.Shop.Dtos;
using ECommerce.Application.Services.SalesSrv;
using ECommerce.Data.Entities.Cms;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Controllers
{
    [ApiController]
    [Route("api/sales")]
    public class SalesController : ControllerBase
    {
        private readonly ISalesService _salesService;
        public SalesController(ISalesService salesService) 
        { 
            _salesService = salesService;
        }

        [HttpGet("payment-methods")]
        public async Task<IActionResult> getPaymentMethods()
        {
            var res = await _salesService.getPaymentMethods();
            return Ok(res);
        }
        [HttpPost("save-payment-method")]
        public async Task<IActionResult> savePaymentMethods(Bank dto)
        {
            var res = await _salesService.savePaymentMethod(dto);
            return Ok(res);
        }
        [HttpPost("delete-payment-method")]
        public async Task<IActionResult> deletePaymentMethod([FromBody] int id)
        {
            var res = await _salesService.deletePaymentMethod(id);
            return Ok(res);
        }

        [HttpGet("get-shop/{id}")]
        public async Task<IActionResult> getShop(int id)
        {
            var res = await _salesService.getShopDetailManage(id);
            return Ok(res);
        }
        [HttpGet("get-shops")]
        public async Task<IActionResult> getShops()
        {
            var res = await _salesService.getShopList();
            return Ok(res);
        }
        [HttpPost("add-shop")]
        public async Task<IActionResult> addShop(ShopAddRequest request)
        {
            var res = await _salesService.addShop(request);
            return Ok(res);
        }
        [HttpPost("update-shop")]
        public async Task<IActionResult> updateShop(ShopUpdateRequest request)
        {
            var res = await _salesService.updateShop(request);
            return Ok(res);
        }
    }
}
