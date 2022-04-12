﻿using ECommerce.Application.Services.Configurations.Dtos;
using ECommerce.Data.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Configurations
{
    public class ConfigurationService : IConfigurationService
    {
        private readonly ECommerceContext _DbContext;
        public ConfigurationService(ECommerceContext DbContext)
        {
            _DbContext = DbContext;
        }

        public async Task<List<BannerModel>> getBanner()
        {
            var query = from banner in _DbContext.Banners select banner;
            var result = await query.Select(i => new BannerModel()
            {
                BannerId = i.BannerId,
                BannerPath = i.BannerPath,
                Status = i.Status
            }).ToListAsync();

            return result;
        }

        public async Task<ConfigurationModel> getConfiguration()
        {
            var query = from con in _DbContext.Configurations select con;
            var result = await query.Select(i => new ConfigurationModel()
            {
                WebsiteName = i.WebsiteName,
                LogoPath = i.LogoPath,
                FaviconPath = i.FaviconPath,
                StartTime = i.StartTime,
                EndTime = i.EndTime,
                Facebook = i.Facebook,
                FacebookUrl = i.FacebookUrl,
                Mail = i.Mail,
                PhoneNumber = i.PhoneNumber
            }).FirstAsync();

            return result;
        }
    }
}