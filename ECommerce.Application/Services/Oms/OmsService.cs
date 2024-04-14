using ECommerce.Application.Common;
using ECommerce.Data.Abstractions;
using ECommerce.Data.Entities.OmsSchema;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Oms
{
    public class OmsService : IOmsService
    {
        private readonly IUnitOfWork _uow;
        public OmsService(IUnitOfWork uow) 
        {
            _uow = uow;
        } 
        public async Task<Response<Order>> getById(int id)
        {
            var ent = await _uow.Repository<Order>().GetByIdAsync(new Guid("18C4F8C8-67F2-4CCE-B482-5788DECE69B0"));
            return new SuccessResponse<Order>(ent);
        }
    }
}
