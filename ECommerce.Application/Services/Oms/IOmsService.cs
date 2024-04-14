using ECommerce.Application.Common;
using ECommerce.Application.Services.Product.Dtos;
using ECommerce.Data.Entities.OmsSchema;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Oms
{
    public interface IOmsService
    {
        Task<Response<Order>> getById(int id);
    }
}
