﻿using ECommerce.Application.Services.Category.Dtos;
using ECommerce.Data.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Category
{
    public class SubCategoryService : ISubCategoryService
    {
        private readonly ECommerceContext _DbContext;
        public SubCategoryService(ECommerceContext DbContext)
        {
            _DbContext = DbContext;
        }
        public async Task<int> Create(SubCategoryCreateRequest request)
        {
            throw new NotImplementedException();
        }
        public async Task<int> Delete(int CategoryId)
        {
            throw new NotImplementedException();
        }
        public async Task<int> Update(SubCategoryCreateRequest request)
        {
            throw new NotImplementedException();
        }
        public async Task<List<SubCategoryModel>> getAll()
        {
            var list = from c in _DbContext.Categories select c;

            return await list.Select(i => new SubCategoryModel()
            {
                CategoryId = i.CategoryId,
                CategoryName = i.CategoryName
            }).ToListAsync();
        }
    }
}
