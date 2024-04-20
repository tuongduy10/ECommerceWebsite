using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Repositories
{
    public interface IRepositoryBase<T> where T : class
    {
        // Base 
        DbSet<T> Entity();
        // Custom
        IQueryable<T> Queryable(Expression<Func<T, bool>> expression = null, string includes = "");
        // Single obj
        Task<T> GetAsyncWhere(Expression<Func<T, bool>> expression, string includes = "");
        Task<IEnumerable<T>> ToListAsyncWhere(Expression<Func<T, bool>> expression);
        // Add
        Task AddAsync(T entity);
        Task AddRangeAsync(IEnumerable<T> entities);
        // Update
        void Update(T entity);
        // Remove
        Task RemoveRangeAsyncWhere(Expression<Func<T, bool>> expression);
        void RemoveRange(IEnumerable<T> entities);
    }
}
