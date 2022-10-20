﻿using ECommerce.Data.Context;
using ECommerce.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Repositories.Comment
{
    public class CommentRepository : RepositoryBase<Rate>, ICommentRepository
    {
        public CommentRepository(ECommerceContext DbContext):base(DbContext)
        {

        }
        public override async Task<IEnumerable<Rate>> FindAll()
        {
            try
            {
                return await _DbSet.ToListAsync();
            }
            catch (Exception error)
            {
                throw new Exception(error.ToString());
            }
        }
    }
}
