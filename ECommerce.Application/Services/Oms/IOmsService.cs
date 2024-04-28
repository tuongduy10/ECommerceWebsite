using ECommerce.Application.Common;
using ECommerce.Application.Services.ProductSrv.Dtos;
using ECommerce.Data.Entities.OmsSchema;
using ECommerce.Dtos.Oms;
using ECommerce.Utilities.Shared;
using ECommerce.Utilities.Shared.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Oms
{
    public interface IOmsService
    {
        Task<Response<Order>> getById(int id);
        Task<Response<OrderResponseDto>> createOrder(OrderCreateRequest request);
        Task<Response<IEnumerable<OrderResponseDto>>> getOrderByStatus(string status);
        Task<Response<PagedResult<OrderResponseDto>>> getOrdersPaging(PagedRequest request);
    }
}
