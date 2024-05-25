using ECommerce.Data.Abstractions;
using ECommerce.Data.Entities.Cms;
using ECommerce.Utilities.Shared.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Cms
{
    public class CmsService : ICmsService
    {
        private readonly IUnitOfWork _uow;
        public CmsService(IUnitOfWork uow) 
        { 
            _uow = uow;
        }
        public async Task<Response<Blog>> saveBlog(Blog dto)
        {
            var ent = await _uow.Repository<Blog>().FindByAsync(_ => _.BlogId == dto.BlogId);
            if (ent != null)
            {
                ent.BlogContent = dto.BlogContent;
                ent.BlogTitle = string.IsNullOrEmpty(dto.BlogTitle) ? string.Empty : dto.BlogTitle.Trim();
                ent.Status = dto.Status;
                _uow.Repository<Blog>().Update(ent);
                await _uow.SaveChangesAsync();
                return new SuccessResponse<Blog>(ent);
            }
            return new SuccessResponse<Blog>();
        }
        public async Task<Response<Blog>> GetBlog(int id)
        {
            var blog = (await _uow.Repository<Blog>().GetByAsync(_ => _.Status == 1 && _.BlogId == id)).FirstOrDefault();
            return new SuccessResponse<Blog>(blog);
        }
        public async Task<Response<IEnumerable<Blog>>> GetBlogs()
        {
            var blogs = await _uow.Repository<Blog>().GetByAsync(null, 
                _ => _.OrderBy(x => x.BlogPosition)
                        .ThenBy(x => x.BlogId));
            return new SuccessResponse<IEnumerable<Blog>>(blogs);
        }
    }
}
