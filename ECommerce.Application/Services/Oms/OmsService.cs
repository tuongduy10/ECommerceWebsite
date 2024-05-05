using ECommerce.Application.Common;
using ECommerce.Application.Services.UserSrv;
using ECommerce.Data.Abstractions;
using ECommerce.Data.Entities.OmsSchema;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Dtos.Oms;
using ECommerce.Dtos.Oms.Request;
using ECommerce.Utilities.Constants;
using ECommerce.Utilities.Shared;
using ECommerce.Utilities.Shared.Responses;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Oms
{
    public class OmsService : IOmsService
    {
        private readonly IUnitOfWork _uow;
        private readonly IUserService _userService;
        public OmsService(IUnitOfWork uow, IUserService userService)
        {
            _uow = uow;
            _userService = userService;
        }
        public async Task<Response<Order>> getById(int id)
        {
            var ent = await _uow.Repository<Order>().GetByIdAsync(new Guid("18C4F8C8-67F2-4CCE-B482-5788DECE69B0"));
            return new SuccessResponse<Order>(ent);
        }
        public async Task<Response<IEnumerable<OrderResponseDto>>> getOrderByStatus(string status) 
        {
            var orders = (await _uow.Repository<Order>()
                .GetByAsync(
                    _ => _.Status == status, 
                    _ => _.OrderByDescending(i => i.CreatedDate), 
                    "OrderDetails,Ward,District,City"))
                .Select(_ => (OrderResponseDto)_);
            return new SuccessResponse<IEnumerable<OrderResponseDto>>(StatusConstant.SUCCESS, orders);
        }
        public async Task<Response<PagedResult<OrderResponseDto>>> getOrdersPaging(OrderPagingRequest request)
        {
            string searchKey = string.IsNullOrEmpty(request.SearchKey) ? string.Empty : request.SearchKey.Trim().ToLower();
            var pagedResult = await _uow.Repository<Order>()
                .GetPagedMappingByAsync<OrderResponseDto>(request.PageIndex,request.PageSize,
                    _ => _.IsDeleted == false
                        && (string.IsNullOrEmpty(request.status) || request.status == _.Status)
                        && (string.IsNullOrEmpty(searchKey) 
                            || searchKey.Contains(_.Remark.ToLower().Trim())
                            || searchKey.Contains(_.FullName.ToLower().Trim()))
                            || searchKey.Contains(_.Email.ToLower().Trim())
                            || searchKey.Contains(_.PhoneNumber.ToLower().Trim()),
                    _ => _.OrderByDescending(i => i.UpdatedDate)
                        .ThenByDescending(i => i.CreatedDate),
                    "OrderDetails,Ward,District,City");
            return new SuccessResponse<PagedResult<OrderResponseDto>>(StatusConstant.SUCCESS, pagedResult);
        }
        public async Task<Response<OrderResponseDto>> createOrder(OrderCreateRequest request)
        {
            var entity = new Order();
            entity.FullName = request.deliveryInfo.fullName;
            entity.PhoneNumber = request.deliveryInfo.phoneNumber;
            entity.Email = request.deliveryInfo.email;
            entity.Remark = request.deliveryInfo.remark;
            entity.Address = request.deliveryInfo.address;
            entity.CityCode = request.deliveryInfo.cityCode;
            entity.DistrictCode = request.deliveryInfo.districtCode;
            entity.WardCode = request.deliveryInfo.wardCode;
            entity.CreatedBy = _userService.getCurrentUserName() ?? request.deliveryInfo.fullName;
            entity.PaymentMethod = request.deliveryInfo.paymentMethod;
            entity.TotalQty = request.products.Sum(_ => _.qty);

            var transaction = await _uow.BeginTransactionAsync();
            try
            {
                var orderDetails = new List<OrderDetail>();
                decimal totalPrice = 0;
                decimal totalFinalPrice = 0;
                foreach (var product in request.products)
                {
                    var pro = await _uow.Repository<Product>().FindByAsync(_ => _.ProductId == product.id);
                    if (pro != null)
                    {
                        decimal price = 0;
                        decimal finalPrice = 0;
                        if (product.priceType.Equals(ProductConstant.PRICE_AVAILABLE))
                        {
                            // Price
                            if (pro.PriceAvailable != null)
                                price = (decimal)pro.PriceAvailable;
                            // Final price
                            finalPrice = price;
                            if (pro.DiscountAvailable != null)
                                finalPrice = (decimal)pro.DiscountAvailable;
                        }
                        if (product.priceType.Equals(ProductConstant.PRICE_PRE_ORDER))
                        {
                            // Price
                            if (pro.PricePreOrder != null)
                                price = (decimal)pro.PricePreOrder;
                            // Final price
                            finalPrice = price;
                            if (pro.DiscountPreOrder != null)
                                finalPrice = (decimal)pro.DiscountPreOrder;
                        }
                        totalPrice += price * product.qty;
                        totalFinalPrice += finalPrice * product.qty;
                        var detail = new OrderDetail
                        {
                            Price = price,
                            PriceOnSell = finalPrice >= price ? 0 : finalPrice,
                            TotalPrice = price * product.qty,
                            TotalFinalPrice = finalPrice * product.qty,
                            Qty = product.qty,
                            ProductName = pro.ProductName,
                            ProductId = pro.ProductId,
                        };
                        orderDetails.Add(detail);
                    }
                }
                entity.TotalPrice = totalPrice;
                entity.TotalFinalPrice = totalFinalPrice;
                entity.OrderDetails = orderDetails;
                await _uow.Repository<Order>().AddAsync(entity);
                await _uow.SaveChangesAsync();
                await transaction.CommitAsync();
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                throw;
            }

            var order = (OrderResponseDto)(await _uow.Repository<Order>().FindByAsync(_ => _.Id == entity.Id, "OrderDetails,Ward,District,City"));
            return new SuccessResponse<OrderResponseDto>(order);
        }


    }
}
