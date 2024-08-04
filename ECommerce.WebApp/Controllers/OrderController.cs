using ECommerce.Application.BaseServices.User.Dtos;
using ECommerce.Application.Services.Oms;
using ECommerce.Dtos.Oms.Request;
using ECommerce.Infrastructure.Authentications;
using ECommerce.Utilities.Constants;
using ECommerce.Utilities.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/order")]
    public class OrderController : ControllerBase
    {
        private readonly IOmsService _omsService;
        public OrderController(IOmsService omsService) 
        {
            _omsService = omsService;
        }
        [HttpGet("order-detail/{id}")]
        public async Task<IActionResult> getOrderDetail(Guid id)
        {
            var result = await _omsService.getById(id);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [AllowAnonymous]
        [HttpPost("create-order")]
        public async Task<IActionResult> createOrder(OrderCreateRequest request)
        {
            var result = await _omsService.createOrder(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("approve-order/{id}")]
        public async Task<IActionResult> approveOrder(Guid id)
        {
            var result = await _omsService.approveOrder(id);
            return Ok(result);
        }
        [HttpGet("pending-orders")]
        public async Task<IActionResult> getPendingOrder()
        {
            var result = await _omsService.getOrderByStatus(OmsConstant.STATUS_ORDER_PENDING);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("orders-paging")]
        public async Task<IActionResult> getOrdersPaging(OrderPagingRequest request)
        {
            var result = await _omsService.getOrdersPaging(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("user-orders-paging")]
        public async Task<IActionResult> getUserOrdersPaging(OrderPagingRequest request)
        {
            var result = await _omsService.getUserOrdersPaging(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
    }
}
