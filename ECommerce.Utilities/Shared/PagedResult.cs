using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Utilities.Shared
{
    public class PagedResult<T>
    {
        public const int UpperPageSize = 100;
        public const int DefaultPageSize = 10;
        public const int DefaultPageIndex = 1;

        public IReadOnlyList<T> Items { get; }
        public int PageIndex { get; }
        public int PageSize { get; }
        public int TotalItems { get; }
        public int TotalPages => (int)Math.Ceiling(TotalItems / (double)PageSize);
        public bool HasNextPage => PageIndex * PageSize < TotalItems;
        public bool HasPreviousPage => PageIndex > 1;
        public PagedResult(List<T> items, int pageIndex, int pageSize, int totalItems)
        {
            Items = items;
            PageIndex = pageIndex;
            PageSize = pageSize;
            TotalItems = totalItems;
        }
        public static async Task<PagedResult<T>> CreateAsync(IQueryable<T> query, int pageIndex, int pageSize)
        {
            pageIndex = pageIndex <= 0 ? DefaultPageIndex : pageIndex;
            pageSize = pageSize <= 0
                ? DefaultPageSize
                : pageSize > UpperPageSize
                    ? UpperPageSize : pageSize;
            var count = await query.CountAsync();
            var items = await query.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToListAsync();
            return new PagedResult<T>(items, pageIndex, pageSize, count);
        }
        public static PagedResult<T> Create(List<T> items, int pageIndex, int pageSize, int totalItems)
            => new PagedResult<T>(items, pageIndex, pageSize, totalItems);
    }
    public class PagedResult<T, TResult>
    {
        public static PagedResult<TResult> CreateMapping(PagedResult<T> pagedResult)
        {
            var listResult = pagedResult.Items.Select(_ => (TResult)(dynamic)_);
            return PagedResult<TResult>.Create(
                listResult.ToList(),
                pagedResult.PageIndex,
                pagedResult.PageSize,
                pagedResult.TotalItems);
        }
    }
}
