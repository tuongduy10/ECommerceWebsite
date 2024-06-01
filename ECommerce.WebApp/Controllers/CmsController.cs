using ECommerce.Application.Services.Cms;
using ECommerce.Data.Abstractions;
using ECommerce.Data.Entities.Cms;
using ECommerce.Utilities.Shared.Responses;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/cms")]
    public class CmsController : ControllerBase
    {
        private readonly ICmsService _cmsService;
        private readonly IUnitOfWork _uow;
        public CmsController(ICmsService cmsService, IUnitOfWork uow) 
        { 
            _cmsService = cmsService;
            _uow = uow;
        }
        [AllowAnonymous]
        [HttpGet("blog/{id}")]
        public async Task<IActionResult> GetBlog(int id)
        {
            var res = await _cmsService.GetBlog(id);
            return Ok(res);
        }
        [AllowAnonymous]
        [HttpGet("blogs")]
        public async Task<IActionResult> GetBlogs()
        {
            var res = await _cmsService.GetBlogs();
            return Ok(res);
        }
        [HttpPost("save-blog")]
        public async Task<IActionResult> saveBlog(Blog dto)
        {
            var res = await _cmsService.saveBlog(dto);
            return Ok(res);
        }
        [HttpGet("config")]
        [AllowAnonymous]
        public async Task<IActionResult> getConfig()
        {
            var res = await _uow.Repository<Configuration>().FindByAsync(null);
            return Ok(new SuccessResponse<Configuration>(res));
        }
        [HttpPost("save-config")]
        public async Task<IActionResult> saveConfig(Configuration dto)
        {
            var ent = await _uow.Repository<Configuration>().FindByAsync(_ => _.Id == dto.Id);
            if (ent != null)
            {
                ent.FacebookUrl = dto.FacebookUrl;
                ent.PhoneNumber = dto.PhoneNumber;
                ent.Address = dto.Address;
                ent.AddressUrl = dto.AddressUrl;
                ent.Mail = dto.Mail;
                ent.YoutubeUrl = dto.YoutubeUrl;
                ent.InstagramUrl = dto.InstagramUrl;
                ent.StartTime = dto.StartTime;
                ent.EndTime = dto.EndTime;
                _uow.Repository<Configuration>().Update(ent);
                await _uow.SaveChangesAsync();
            }
            return Ok();
        }
    }
}
