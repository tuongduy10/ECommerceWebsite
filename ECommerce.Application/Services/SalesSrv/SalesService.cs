using ECommerce.Application.BaseServices.Shop.Dtos;
using ECommerce.Application.BaseServices.Shop.Enums;
using ECommerce.Application.Common;
using ECommerce.Data.Abstractions;
using ECommerce.Data.Entities.Cms;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Utilities.Shared.Responses;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
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

        public async Task<Response<Shop>> addShop(ShopAddRequest request)
        {
            var transaction = await _uow.BeginTransactionAsync();
            try
            {
                // Check null
                if (string.IsNullOrEmpty(request.name.Trim())) return new FailResponse<Shop>("Thông tin không được để trống");
                if (string.IsNullOrEmpty(request.phone.Trim())) return new FailResponse<Shop>("Thông tin không được để trống");

                // Check already exist
                var checkName = (await _uow.Repository<Shop>().GetByAsync(s => s.ShopName == request.name.Trim())).FirstOrDefault();
                if (checkName != null) return new FailResponse<Shop>("Tên đã tồn tại");
                var checkPhone = (await _uow.Repository<Shop>().GetByAsync(s => s.ShopPhoneNumber == request.phone.Trim())).FirstOrDefault();
                if (checkPhone != null) return new FailResponse<Shop>("Số điện thoại đã tồn tại");
                if (request.mail != null)
                {
                    var checkMail = (await _uow.Repository<Shop>().GetByAsync(s => s.ShopMail == request.mail.Trim())).FirstOrDefault();
                    if (checkMail != null) return new FailResponse<Shop>("Mail đã tồn tại");
                }

                var shop = new Shop();
                shop.ShopName = request.name.Trim();
                shop.ShopPhoneNumber = request.phone.Trim();
                shop.ShopAddress = request.address.Trim();
                shop.ShopCityCode = request.cityCode;
                shop.ShopDistrictCode = request.districtCode;
                shop.ShopWardCode = request.wardCode;
                shop.ShopMail = request.mail.Trim();
                shop.ShopJoinDate = DateTime.Now;
                shop.Tax = (byte)request.tax;
                shop.Status = (int)enumShopStatus.Available; // Available..

                await _uow.Repository<Shop>().AddAsync(shop);
                await _uow.SaveChangesAsync();

                var newBank = new ShopBank
                {
                    ShopAccountName = request.bankAccount,
                    ShopBankName = request.bankName,
                    ShopAccountNumber = request.accountNumber,
                    ShopId = shop.ShopId,
                };
                await _uow.Repository<ShopBank>().AddAsync(newBank);
                await _uow.SaveChangesAsync();

                if (request.brandIds.Count > 0)
                {
                    var brands = request.brandIds
                        .Select(_ => new ShopBrand
                        {
                            BrandId = _,
                            ShopId = shop.ShopId,
                        });
                    await _uow.Repository<ShopBrand>().AddAsync(brands);
                    await _uow.SaveChangesAsync();
                }

                await _uow.CommitTransactionAsync(transaction);
                return new SuccessResponse<Shop>("Thêm thành công", shop);
            }
            catch
            {
                await _uow.RollbackTransactionAsync(transaction);
                throw;
            }
        }
    }
}
