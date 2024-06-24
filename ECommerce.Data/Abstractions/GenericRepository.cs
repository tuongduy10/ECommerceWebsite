using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ECommerce.Data.Context;
using ECommerce.Utilities.Shared;

namespace ECommerce.Data.Abstractions
{
    public class GenericRepository<TEntity> : IGenericRepository<TEntity> where TEntity : class
    {
        private readonly ECommerceContext _dbContext;
        private readonly DbSet<TEntity> _dbSet;
        public GenericRepository(ECommerceContext dbContext)
        {
            _dbContext = dbContext;
            _dbSet = dbContext.Set<TEntity>();
        }
        public async Task<IEnumerable<TEntity>> GetAllAsync()
        {
            return await _dbSet.ToListAsync();
        }
        public async Task<TEntity> GetByIdAsync(object id)
        {
            return await _dbSet.FindAsync(id);
        }
        public async Task AddAsync(TEntity entity)
        {
            await _dbSet.AddAsync(entity);
        }
        public async Task AddAsync(IEnumerable<TEntity> entities)
        {
            await _dbSet.AddRangeAsync(entities);
        }
        public async Task<bool> AnyAsync(Expression<Func<TEntity, bool>> filter)
        {
            return await _dbSet.Where(filter).AnyAsync();
        }
        public virtual void Delete(TEntity entity)
        {
            if (_dbContext.Entry(entity).State == EntityState.Detached)
            {
                _dbSet.Attach(entity);
            }
            _dbSet.Remove(entity);
        }
        public virtual void Delete(IEnumerable<TEntity> entities)
        {
            foreach (var entity in entities)
            {
                var entry = _dbContext.Entry(entity);
                if (entry.State == EntityState.Detached)
                {
                    _dbSet.Attach(entity);
                }
            }
            _dbSet.RemoveRange(entities);
        }
        public virtual void Update(TEntity entity)
        {
            _dbSet.Update(entity);
            _dbContext.Entry(entity).State = EntityState.Modified;
        }
        public virtual void Update(IEnumerable<TEntity> entities)
        {
            _dbSet.UpdateRange(entities.ToList());
            foreach (var entity in entities)
            {
                _dbContext.Entry(entity).State = EntityState.Modified;
            }
        }
        public virtual IQueryable<TEntity> QueryableAsync(
            Expression<Func<TEntity, bool>> filter = null,
            Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
            string includeProperties = "")
        {
            IQueryable<TEntity> query = _dbSet.AsQueryable();

            if (filter != null)
            {
                query = query.Where(filter);
            }

            foreach (var includeProperty in includeProperties.Split
                (new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                query = query.Include(includeProperty);
            }

            if (orderBy != null)
            {
                return orderBy(query);
            }
            return query;
        }
        public virtual async Task<TEntity> FindByAsync(
            Expression<Func<TEntity, bool>> filter = null,
            string includeProperties = "")
        {
            var query = QueryableAsync(filter, null, includeProperties);
            return await query.FirstOrDefaultAsync();
        }
        public virtual async Task<IEnumerable<TEntity>> GetByAsync(
            Expression<Func<TEntity, bool>> filter = null,
            Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
            string includeProperties = "")
        {
            var query = QueryableAsync(filter, orderBy, includeProperties);
            return await query.ToListAsync();
        }
        public virtual async Task<PagedResult<TEntity>> GetPagedResultByAsync(
            int pageIndex,
            int pageSize,
            Expression<Func<TEntity, bool>> filter = null,
            Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
            string includeProperties = "")
        {
            var query = QueryableAsync(filter, orderBy, includeProperties);
            return await PagedResult<TEntity>.CreateAsync(query, pageIndex, pageSize);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="TResult">
        /// Your custom clas response must has "explicit operator static" function to map from Entity class to Custom class
        /// </typeparam>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="filter"></param>
        /// <param name="orderBy"></param>
        /// <param name="includeProperties"></param>
        /// <returns></returns>
        public virtual async Task<PagedResult<TResult>> GetPagedMappingByAsync<TResult>(
            int pageIndex,
            int pageSize,
            Expression<Func<TEntity, bool>> filter = null,
            Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
            string includeProperties = "")
        {
            var pagedResult = await GetPagedResultByAsync(pageIndex, pageSize, filter, orderBy, includeProperties);
            return PagedResult<TEntity, TResult>.CreateMapping(pagedResult);
        }
    }
}
