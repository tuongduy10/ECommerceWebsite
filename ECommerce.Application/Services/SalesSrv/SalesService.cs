using ECommerce.Data.Abstractions;
using ECommerce.Data.Entities.Cms;
using ECommerce.Utilities.Shared.Responses;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.SalesSrv
{
    public class SalesService : ISalesService
    {
        private readonly IUnitOfWork _uow;
        public SalesService(IUnitOfWork uow) 
        { 
            _uow = uow;
        }
        public async Task<Response<IEnumerable<Bank>>> getPaymentMethods()
        {
            var banks = await _uow.Repository<Bank>().GetAllAsync();
            return new SuccessResponse<IEnumerable<Bank>>(banks);
        }
        public async Task<Response<Bank>> savePaymentMethod(Bank dto)
        {
            if (dto.BankId > -1)
            {
                var ent = await _uow.Repository<Bank>().FindByAsync(_ => _.BankId == dto.BankId);
                ent.BankName = dto.BankName;
                ent.BankAccountName = dto.BankAccountName;
                ent.BankAccountNumber = dto.BankAccountNumber;
                _uow.Repository<Bank>().Update(ent);
            }
            else
            {
                var newEnt = new Bank
                {
                    BankName = dto.BankName,
                    BankAccountName = dto.BankAccountName,
                    BankAccountNumber = dto.BankAccountNumber,
                };
                await _uow.Repository<Bank>().AddAsync(newEnt);
            }
            await _uow.SaveChangesAsync();
            return new SuccessResponse<Bank>();
        }
        public async Task<Response<string>> deletePaymentMethod(int id)
        {
            var ent = await _uow.Repository<Bank>().FindByAsync(_ => _.BankId == id);
            if (ent != null)
            {
                _uow.Repository<Bank>().Delete(ent);
                await _uow.SaveChangesAsync();
            }
            return new SuccessResponse<string>();
        }
    }
}
