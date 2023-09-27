﻿using ECommerce.Application.Common;
using ECommerce.Application.BaseServices.Configurations.Dtos.Footer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.BaseServices.Configurations
{
    public interface IFooterService
    {
        // Blog
        Task<ApiResponse> AddBlog(BlogModel request);
        Task<ApiResponse> UpdateBlog(BlogUpdateRequest request);
        Task<ApiResponse> DeleteBlog(int id);
        Task<List<BlogModel>> getAllBlog(); // 2 cột, 8 blog
        Task<BlogModel> getBlogDetail(int BlogId);
        Task<Response<BlogModel>> GetBlog(BlogDto request);

        // Social
        Task<ApiResponse> UpdateSocial(SocialUpdateRequest request);
        Task<List<SocialModel>> getAllSocial(); //1 cột 4 social
    }
}
