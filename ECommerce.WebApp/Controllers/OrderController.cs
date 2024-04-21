using ECommerce.Application.BaseServices.User.Dtos;
using ECommerce.Application.Services.Oms;
using ECommerce.Dtos.Oms;
using ECommerce.Utilities.Constants;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AllowAnonymous]
    public class OrderController : ControllerBase
    {
        private readonly IOmsService _omsService;
        public OrderController(IOmsService omsService) 
        {
            _omsService = omsService;
        }
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
    }
}
