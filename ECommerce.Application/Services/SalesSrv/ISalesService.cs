using ECommerce.Application.BaseServices.Shop.Dtos;
using ECommerce.Data.Entities.Cms;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Utilities.Shared.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.SalesSrv
{
    public interface ISalesService
    {
        Task<Response<IEnumerable<Bank>>> getPaymentMethods();
        Task<Response<Bank>> savePaymentMethod(Bank dto);
        Task<Response<string>> deletePaymentMethod(int id);
        Task<Response<Shop>> addShop(ShopAddRequest request);
    }
}
