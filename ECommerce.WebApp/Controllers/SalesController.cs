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
    }
}
