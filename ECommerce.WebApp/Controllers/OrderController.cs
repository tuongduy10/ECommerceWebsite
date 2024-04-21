using ECommerce.Application.BaseServices.User.Dtos;
using ECommerce.Application.Services.Oms;
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
        [HttpGet("test")]
        public async Task<IActionResult> test()
        {
            var result = await _omsService.getById(0);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
    }
}
