﻿using ECommerce.Application.Services.Bank;
using ECommerce.Application.Services.Configurations;
using ECommerce.WebApp.Models.Configurations.Footer;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Controllers.Admin
{
    public class ConfigurationController : Controller
    {
        private IFooterService _footerService;
        private IConfigurationService _configurationService;
        private IBankService _bankService;
        public ConfigurationController(IFooterService footerService, IConfigurationService configurationService, IBankService bankService)
        {
            _footerService = footerService;
            _configurationService = configurationService;
            _bankService = bankService;
        }
        public async Task<IActionResult> ManageFooter()
        {
            var blogs = await _footerService.getAllBlog();
            var socials = await _footerService.getAllSocial();
            var configs = await _configurationService.getConfiguration();

            var model = new ManageFooterViewModel()
            {
                listBlog = blogs,
                listSocial = socials,
                config = configs
            };
            return View(model);
        }
        public async Task<IActionResult> BlogDetail(int BlogId)
        {
            var blog = await _footerService.getBlogDetail(BlogId);
            return View(blog);
        }

        public async Task<IActionResult> ManageBank()
        {
            var listBank = await _bankService.getListBank();
            return View(listBank);
        }
    } 
}
