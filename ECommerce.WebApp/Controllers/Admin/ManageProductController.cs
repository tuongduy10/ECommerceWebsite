﻿using ECommerce.Application.Services.Brand;
using ECommerce.Application.Services.Product;
using ECommerce.Application.Services.Product.Dtos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Controllers.Admin
{
    [Authorize(AuthenticationSchemes = "AdminAuth")]
    [Authorize(Policy = "Admin")]
    public class ManageProductController : Controller
    {
        private IProductService _productService;
        private IBrandService _brandService;
        private IWebHostEnvironment _webHostEnvironment;
        public ManageProductController(IProductService productService, IBrandService brandService, IWebHostEnvironment webHostEnvironment)
        {
            _productService = productService;
            _brandService = brandService;
            _webHostEnvironment = webHostEnvironment;
        }
        public async Task<IActionResult> Index()
        {
            return View();
        }
    }
}
