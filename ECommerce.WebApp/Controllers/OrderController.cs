using ECommerce.Application.BaseServices.User.Dtos;
using ECommerce.Application.Services.Oms;
using ECommerce.Dtos.Oms;
using ECommerce.Infrastructure.Authentications;
using ECommerce.Utilities.Constants;
using ECommerce.Utilities.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
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
        [AllowAnonymous]
        [HttpPost("create-order")]
        public async Task<IActionResult> CreateOrder(OrderCreateRequest request)
        {
            var result = await _omsService.createOrder(request);
            if (!result.isSucceed)
                return BadRequest(result);
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
        public async Task<IActionResult> getOrdersPaging(PagedRequest request)
        {
            var result = await _omsService.getOrdersPaging(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
    }
}
