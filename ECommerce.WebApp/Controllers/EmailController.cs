using ECommerce.Application.ExternalServices.Emails;
using ECommerce.Application.ExternalServices.Emails.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/email")]
    public class EmailController : ControllerBase
    {
        private readonly IEmailService _emailService;
        public EmailController(IEmailService emailService) 
        { 
            _emailService = emailService;
        }

        [AllowAnonymous]
        [HttpPost("send-mail")]
        public async Task<IActionResult> SendMail(SendMailDto dto)
        {
            await _emailService.SendEmailAsync(dto);
            return Ok();
        }
    }
}
