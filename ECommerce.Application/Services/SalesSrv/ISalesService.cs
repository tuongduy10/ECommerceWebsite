using ECommerce.Data.Entities.Cms;
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
    }
}
