﻿using ECommerce.Application.Services.Bank;
using ECommerce.Application.Services.Bank.Dtos;
using ECommerce.Application.Services.Configurations;
using ECommerce.Application.Services.Configurations.Dtos;
using ECommerce.Application.Services.Configurations.Dtos.Footer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System.IO;
using System.Threading.Tasks;

namespace ECommerce.WebApp.APIs.Admin
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = "AdminAuth")]
    [Authorize(Policy = "Admin")]
    public class ManageConfigurationsAPI : ControllerBase
    {
        private IConfigurationService _configurationService;
        private IFooterService _footerService;
        private IBankService _bankService;
        private IWebHostEnvironment _webHostEnvironment;
        private IHeaderService _headerService;
        public ManageConfigurationsAPI(IConfigurationService configurationService,
                                        IFooterService footerService,
                                        IBankService bankService,
                                        IHeaderService headerService,
                                        IWebHostEnvironment webHostEnvironment)
        {
            _headerService = headerService;
            _configurationService = configurationService;
            _footerService = footerService;
            _bankService = bankService;
            _webHostEnvironment = webHostEnvironment;
        }
        [HttpPost("AddBlog")]
        public async Task<IActionResult> AddBlog(BlogModel request)
        {
            var result = await _footerService.AddBlog(request);
            if (!result.isSucceed)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }
        [HttpPost("UpdateBlog")]
        public async Task<IActionResult> UpdateBlog(BlogUpdateRequest request)
        {
            var result = await _footerService.UpdateBlog(request);
            if (!result.isSucceed)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }
        [HttpPost("DeleteBlog")]
        public async Task<IActionResult> DeleteBlog([FromBody] int BlogId)
        {
            var result = await _footerService.DeleteBlog(BlogId);
            if (!result.isSucceed)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }
        [HttpPost("UpdateSocial")]
        public async Task<IActionResult> UpdateSocial([FromBody] SocialUpdateRequest request)
        {
            var result = await _footerService.UpdateSocial(request);
            if (!result.isSucceed)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }
        [HttpPost("DeleteBank")]
        public async Task<IActionResult> DeleteBank([FromBody] int bankId)
        {
            var result = await _bankService.deleteBank(bankId);
            if (result.isSucceed)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }
        [HttpPost("UpdateBank")]
        public async Task<IActionResult> UpdateBank([FromBody] BankUpdateRequest request)
        {
            var result = await _bankService.updateBank(request);
            if (result.isSucceed)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }
        [HttpPost("AddBank")]
        public async Task<IActionResult> AddBank([FromBody] BankAddRequest request)
        {
            var result = await _bankService.addBank(request);
            if (result.isSucceed)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }
        [HttpPost("UpdateAddress")]
        public async Task<IActionResult> UpdateAddress([FromBody] AddressUpdateRequest request)
        {
            var result = await _configurationService.UpdateAddress(request);
            if (result.isSucceed)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }
        [HttpPost("UpdateTime")]
        public async Task<IActionResult> UpdateTime([FromBody] TimeUpdateRequest request)
        {
            var result = await _configurationService.UpdateTime(request);
            if (result.isSucceed)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }
        [HttpPost("DeleteBanner")]
        public async Task<IActionResult> DeleteBanner([FromBody] BannerDeleteModel banner)
        {
            var result = await _headerService.deleteBanner(banner.BannerId);
            if (result.isSucceed)
            {
                string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "images/banner");
                string filePath = Path.Combine(uploadsFolder, banner.BannerPath);
                System.IO.File.Delete(filePath);

                return Ok(result);
            }

            return BadRequest(result);
        }
        [HttpPost("UpdateWebConfig")]
        public async Task<IActionResult> UpdateWebConfig([FromBody] UpdateConfigRequest request)
        {
            var result = await _configurationService.updateConfig(request);
            if (result.isSucceed)
            {
                return Ok(result);
            }
            return BadRequest(result);
        }
    }
    public class BannerDeleteModel
    {
        public int BannerId { get; set; }
        public string BannerPath { get; set; }
    }
}
