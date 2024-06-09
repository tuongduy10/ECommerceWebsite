using ECommerce.Data.Entities.Cms;
using ECommerce.Utilities.Shared.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Cms
{
    public interface ICmsService
    {
        Task<Response<Blog>> saveBlog(Blog dto);
        Task<Response<Blog>> GetBlog(int id);
        Task<Response<IEnumerable<Blog>>> GetBlogs();
    }
}
