using ECommerce.Application.Common;
using ECommerce.Application.Services.UserSrv;
using ECommerce.Data.Abstractions;
using ECommerce.Data.Entities.OmsSchema;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Dtos.Oms;
using ECommerce.Utilities.Constants;
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
                .GetByAsync(_ => _.Status == status, null, "OrderDetails,Ward,District,City"))
                .Select(_ => (OrderResponseDto)_);
            return new SuccessResponse<IEnumerable<OrderResponseDto>>(StatusConstant.SUCCESS, orders);
        }
        public async Task<Response<OrderResponseDto>> createOrder(OrderCreateRequest request)
        {
            var entity = new Order();
            entity.FullName = request.deliveryInfo.fullName;
            entity.PhoneNumber = request.deliveryInfo.phoneNumber;
            entity.Email = request.deliveryInfo.email;
            entity.Remark = request.deliveryInfo.remark;
            entity.CityCode = request.deliveryInfo.cityCode;
            entity.DistrictCode = request.deliveryInfo.districtCode;
            entity.WardCode = request.deliveryInfo.wardCode;
            entity.CreatedBy = _userService.getCurrentUserFullName();
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
                            price = (decimal)pro.PriceAvailable;
                            finalPrice = (decimal)pro.DiscountAvailable;
                        }
                        if (product.priceType.Equals(ProductConstant.PRICE_PRE_ORDER))
                        {
                            price = (decimal)pro.PricePreOrder;
                            finalPrice = (decimal)pro.DiscountPreOrder;
                        }
                        totalPrice += price;
                        totalFinalPrice += finalPrice;
                        var detail = new OrderDetail
                        {
                            Price = price,
                            PriceOnSell = finalPrice,
                            Qty = product.qty,
                            ProductName = pro.ProductName,
                            ProductId = pro.ProductId,
                        };
                        orderDetails.Add(detail);
                    }
                }
                entity.TotalPice = totalPrice;
                entity.TotalFinalPrice = totalFinalPrice;
                entity.OrderDetails = orderDetails;
                await _uow.Repository<Order>().AddAsync(entity);
                await _uow.SaveChangesAsync();
                await transaction.CommitAsync();
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return new FailResponse<OrderResponseDto>(ex.Message);
            }

            var order = (OrderResponseDto)(await _uow.Repository<Order>().FindByAsync(_ => _.Id == entity.Id, "OrderDetails,Ward,District,City"));
            return new SuccessResponse<OrderResponseDto>(order);
        }
    }
}
