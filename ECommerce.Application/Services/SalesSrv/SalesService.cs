using ECommerce.Application.BaseServices.Shop.Dtos;
using ECommerce.Application.BaseServices.Shop.Enums;
using ECommerce.Application.Common;
using ECommerce.Data.Abstractions;
using ECommerce.Data.Entities.Cms;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Data.Entities.UserSchema;
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

        public async Task<ShopDetailManagedModel> getShopDetailManage(int shopId)
        {
            var brands = (await _uow.Repository<ShopBrand>()
                        .GetByAsync(br => br.ShopId == shopId))
                        .Select(br => br.BrandId)
                        .ToList();
            var bank = (await _uow.Repository<ShopBank>()
                        .GetByAsync(b => b.ShopId == shopId))
                        .Select(b => new ShopBankModel()
                        {
                            ShopAccountName = b.ShopAccountName,
                            ShopBankName = b.ShopBankName,
                            ShopAccountNumber = b.ShopAccountNumber
                        })
                        .FirstOrDefault();

            var shop = (await _uow.Repository<Shop>()
                .GetByAsync(b => b.ShopId == shopId))
                .Select(i => new ShopDetailManagedModel
                {
                    // Shop
                    ShopId = i.ShopId,
                    ShopName = i.ShopName,
                    ShopPhoneNumber = i.ShopPhoneNumber,
                    ShopMail = i.ShopMail,
                    ShopAddress = i.ShopAddress,
                    ShopCityCode = i.ShopCityCode,
                    ShopDistrictCode = i.ShopDistrictCode,
                    ShopJoinDate = (DateTime)i.ShopJoinDate,
                    ShopWardCode = i.ShopWardCode,
                    Status = (byte)i.Status,
                    Tax = (byte)i.Tax,
                    ShopBank = bank == null ? null : bank,
                    ShopBrands = brands.Count() == 0 ? null : brands
                })
                .FirstOrDefault();

            return shop;
        }
        public async Task<List<ShopGetModel>> getShopList()
        {
            var list = (await _uow.Repository<Shop>()
                .GetByAsync(i => i.Status != 4 && i.Status != 2, null, "User"))
                .Select(i => new ShopGetModel()
                {
                    ShopId = i.ShopId,
                    ShopName = i.ShopName,
                    ShopPhoneNumber = i.ShopPhoneNumber,
                    ShopMail = i.ShopMail,
                    ShopAddress = i.ShopAddress,
                    ShopCityCode = i.ShopCityCode,
                    ShopDistrictCode = i.ShopDistrictCode,
                    ShopJoinDate = (DateTime)i.ShopJoinDate,
                    ShopWardCode = i.ShopWardCode,
                    Status = (byte)i.Status,
                })
                .ToList();
            var result = list.OrderByDescending(i => i.ShopId).ToList();
            return result;
        }
        public async Task<Response<Shop>> addShop(ShopAddRequest request)
        {
            var transaction = await _uow.BeginTransactionAsync();
            try
            {
                var shop = new Shop();
                shop.ShopName = request.name;
                shop.ShopJoinDate = DateTime.Now;
                shop.ShopPhoneNumber = "";
                shop.ShopMail = "";
                shop.ShopAddress =  "";
                shop.ShopWardCode = "";
                shop.ShopDistrictCode = "";
                shop.ShopCityCode = "";
                shop.Tax = (byte)request.tax;
                shop.Status = (int)enumShopStatus.Available; // Available..

                await _uow.Repository<Shop>().AddAsync(shop);
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

        public async Task<ApiResponse> updateShop(ShopUpdateRequest request)
        {
            var transaction = await _uow.BeginTransactionAsync();
            try
            {
                var shop = (await _uow.Repository<Shop>().GetByAsync(i => i.ShopId == request.id)).FirstOrDefault();
                if (shop == null) return new ApiFailResponse("Shop không tồn tại");

                shop.ShopName = request.name;
                shop.Tax = (byte?)request.tax;
                _uow.Repository<Shop>().Update(shop);
                await _uow.SaveChangesAsync();

                var brands = await _uow.Repository<ShopBrand>().GetByAsync(i => i.ShopId == request.id);
                // Remove previous brands if exist
                if (brands.Count() > 0)
                {
                    _uow.Repository<ShopBrand>().Delete(brands);
                    await _uow.SaveChangesAsync();
                }
                // Add new brands if has items
                if (request.shopBrands != null)
                {
                    foreach (var id in request.shopBrands)
                    {
                        var brand = new ShopBrand
                        {
                            BrandId = id,
                            ShopId = shop.ShopId
                        };
                        await _uow.Repository<ShopBrand>().AddAsync(brand);
                    }
                    await _uow.SaveChangesAsync();
                }
                await _uow.CommitTransactionAsync(transaction);
                return new ApiSuccessResponse("Cập nhật thành công");
            }
            catch (Exception error)
            {
                await _uow.RollbackTransactionAsync(transaction);
                throw;
            }
        }
    }
}
