﻿
using ECommerce.Application.Common;
using ECommerce.Application.Services.Rate.Dtos;
using ECommerce.Application.Services.Rate.Models;
using ECommerce.Application.Services.User;
using ECommerce.Application.Services.User.Enums;
using ECommerce.Data.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Rate
{
    public class RateService : IRateService
    {
        private ECommerceContext _DbContext;
        public RateService(ECommerceContext DbContext)
        {
            _DbContext = DbContext;
        }
        public async Task<List<RateGetModel>> GetAll()
        {
            var rate = await _DbContext.Rates
                .Select(rate => new RateGetModel()
                {
                    Id = rate.RateId,
                    ProductName = rate.Product.ProductName,
                    ShopName = rate.Product.Shop.ShopName,
                    Value = (int)rate.RateValue,
                    UserName = rate.User.UserFullName,
                    Comment = rate.Comment,
                    CreateDate = (DateTime)rate.CreateDate,
                    Images = _DbContext.RatingImages.Where(img => img.RateId == rate.RateId).Select(i => i.RatingImagePath).ToList(),
                    ParentId = rate.ParentId == null ? 0 : (int)rate.ParentId
                })
                .OrderByDescending(i => i.CreateDate)
                .ToListAsync();

            return rate;
        }
        public async Task<List<RateGetModel>> GetAllByParentId(int id)
        {
            var rate = await _DbContext.Rates
                .Where(rate => rate.ParentId == id)
                .Select(rate => new RateGetModel()
                {
                    Id = rate.RateId,
                    ProductName = rate.Product.ProductName,
                    ShopName = rate.Product.Shop.ShopName,
                    Value = (int)rate.RateValue,
                    UserName = rate.User.UserFullName,
                    Comment = rate.Comment,
                    CreateDate = (DateTime)rate.CreateDate,
                    Images = _DbContext.RatingImages.Where(img => img.RateId == rate.RateId).Select(i => i.RatingImagePath).ToList(),
                    LikeCount = rate.Interests.Where(lc => lc.Liked == true).Count(),
                    DislikeCount = rate.Interests.Where(lc => lc.Liked == false).Count()
                })
                .OrderByDescending(i => i.CreateDate)
                .ToListAsync();

            return rate;
        }
        public async Task<List<RateGetModel>> GetAllToDay() 
        {
            var rate = await _DbContext.Rates
                .Where(rate => rate.CreateDate.Value.Date == DateTime.Today.Date)
                .Select(rate => new RateGetModel()
                {
                    Id = rate.RateId,
                    ProductName = rate.Product.ProductName,
                    ShopName = rate.Product.Shop.ShopName,
                    Value = (int)rate.RateValue,
                    UserName = rate.User.UserFullName,
                    Comment = rate.Comment,
                    CreateDate = (DateTime)rate.CreateDate,
                    Images = _DbContext.RatingImages.Where(img => img.RateId == rate.RateId).Select(i => i.RatingImagePath).ToList()
                })
                .OrderByDescending(i => i.CreateDate)
                .ToListAsync();

            return rate;
        }
        public async Task<List<RateGetModel>> GetRatesByProductId(int id, int userId = 0)
        {
            var rate = await _DbContext.Rates
                .Where(rate => rate.ProductId == id && rate.ParentId == null)
                .Select(rate => new RateGetModel(){
                    Id = rate.RateId,
                    Value = (int)rate.RateValue,
                    UserId = rate.User.UserId,
                    UserName = rate.User.UserFullName,
                    Comment = rate.Comment,
                    CreateDate = (DateTime)rate.CreateDate,
                    Images = _DbContext.RatingImages.Where(img => img.RateId == rate.RateId).Select(i => i.RatingImagePath).ToList(),
                    Replies = _DbContext.Rates
                    .Where(reply => reply.ParentId == rate.RateId)
                    .Select(reply => new RateGetModel() { 
                        Id = reply.RateId,
                        UserId = reply.User.UserId,
                        UserName = reply.User.UserFullName,
                        UserRepliedId = reply.UserReplied.UserId,
                        UserRepliedName = reply.UserReplied.UserFullName,
                        IsAdmin = _DbContext.UserRoles
                            .Where(isa => isa.UserId == reply.User.UserId)
                            .Select(isa => isa.Role.RoleName)
                            .ToList()
                            .Contains(RoleName.Admin),
                        Comment = reply.Comment,
                        Liked = _DbContext.Interests
                            .Where(itr => itr.RateId == reply.RateId && itr.Liked == true)
                            .Select(itr => itr.UserId)
                            .ToList()
                            .Contains(userId),
                        LikeCount = reply.Interests.Where(lc => lc.Liked == true).Count(),
                        DislikeCount = reply.Interests.Where(dc => dc.Liked == false).Count(),
                        Disliked = _DbContext.Interests
                            .Where(itr => itr.RateId == reply.RateId && itr.Liked == false)
                            .Select(itr => itr.UserId)
                            .ToList()
                            .Contains(userId),
                        CreateDate = (DateTime)reply.CreateDate,
                        Images = _DbContext.RatingImages.Where(img => img.RateId == reply.RateId).Select(i => i.RatingImagePath).ToList(),
                    })
                    .ToList()
                })
                .ToListAsync();

            return rate;
        }
        public async Task<ApiResponse> ReplyComment(ReplyCommentRequest request)
        {
            try
            {
                if (string.IsNullOrEmpty(request.comment)) return new ApiFailResponse("Nội dung không được để trống");
                // Add comment content
                var comment = new Data.Models.Rate()
                {
                    Comment = request.comment,
                    ProductId = request.productId,
                    UserId = request.userId,
                    UserRepliedId = request.userRepliedId,
                    ParentId = request.parentId,
                    CreateDate = DateTime.Now,
                    RateValue = 5,
                };
                await _DbContext.Rates.AddAsync(comment);
                await _DbContext.SaveChangesAsync();

                // Add image
                if (request.fileNames != null)
                {
                    foreach (var filename in request.fileNames)
                    {
                        var image = new Data.Models.RatingImage()
                        {
                            RateId = comment.RateId,
                            RatingImagePath = filename,
                        };
                        await _DbContext.RatingImages.AddAsync(image);
                    }
                    await _DbContext.SaveChangesAsync();
                }

                return new ApiSuccessResponse("Phản hồi thành công");
            }
            catch
            {
                return new ApiFailResponse("Phản hồi thất bại");
            }
            
        }
        public async Task<Response<LikeAndDislike>> LikeComment(LikeRequest request)
        {
            try
            {
                var currObj = await _DbContext.Interests
                .Where(i => i.UserId == request.userId && i.RateId == request.rateId)
                .FirstOrDefaultAsync();

                int rateId = 0;
                if (currObj == null)
                {
                    var _obj = new Data.Models.Interest
                    {
                        RateId = request.rateId,
                        UserId = request.userId,
                        Liked = request.liked
                    };
                    await _DbContext.Interests.AddAsync(_obj);
                    rateId = _obj.RateId;
                }
                else
                {
                    currObj.Liked = currObj.Liked == request.liked ? null : request.liked;
                    rateId = currObj.RateId;
                }
                await _DbContext.SaveChangesAsync();
                var interest = await this.LikeAndDislikeCount(rateId);

                return new SuccessResponse<LikeAndDislike>(interest);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            
        }
        public async Task<LikeAndDislike> LikeAndDislikeCount(int rateId)
        {
            try
            {
                var interestObj = await _DbContext.Interests
                    .Where(i => i.RateId == rateId)
                    .ToListAsync();

                var result = new LikeAndDislike
                {
                    RateId = rateId,
                    LikeCount = interestObj == null ? 0 : interestObj.Where(i => i.Liked == true).Count(),
                    DislikeCount = interestObj == null ? 0 : interestObj.Where(i => i.Liked == false).Count()
                };
                 
                return result;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public async Task<ApiResponse> postComment(PostCommentRequest request)
        {
            try
            {
                if (string.IsNullOrEmpty(request.comment)) return new ApiFailResponse("Nội dung không được để trống");

                // Check if user haven't any order with this product
                // get all order with productId and userId
                //var productInOrders = await _DbContext.OrderDetails
                //    .Where(i => i.ProductId == request.productId && i.Order.UserId == request.userId)
                //    .Select(i => i.OrderId)
                //    .ToListAsync();
                //var hasProduct = productInOrders.Count > 0;
                //if (!hasProduct) return new ApiFailResponse("Bạn cần mua sản phẩm này để đánh giá");

                // Check if user's shop is selling this product
                // get user's shop by product id
                var shops = await _DbContext.Products
                    .Where(i => i.ProductId == request.productId && i.Shop.UserId == request.userId)
                    .FirstOrDefaultAsync();
                var isOwner = shops != null;
                if (isOwner) return new ApiFailResponse("Bạn không thể đánh giá sản phẩm của mình");

                // Add comment content
                var comment = new Data.Models.Rate()
                {
                    Comment = request.comment,
                    RateValue = request.value,
                    ProductId = request.productId,
                    UserId = request.userId,
                    CreateDate = DateTime.Now,
                };
                await _DbContext.Rates.AddAsync(comment);
                await _DbContext.SaveChangesAsync();

                // Add image
                if (request.fileNames != null)
                {
                    foreach (var filename in request.fileNames)
                    {
                        var image = new Data.Models.RatingImage()
                        {
                            RateId = comment.RateId,
                            RatingImagePath = filename,
                        };
                        await _DbContext.RatingImages.AddAsync(image);
                    }
                    await _DbContext.SaveChangesAsync();

                }
                return new ApiSuccessResponse("Đã đánh giá sản phẩm");
            }
            catch
            {
                return new ApiFailResponse("Đánh giá thất bại");
            }
        }
        public async Task<Response<List<string>>> DeleteComment(int id)
        {
            try
            {
                var imagesStr = await _DbContext.RatingImages
                    .Where(i => i.RateId == id)
                    .Select(i => i.RatingImagePath)
                    .ToListAsync();

                var comments = await _DbContext.Rates.Where(i => i.RateId == id).FirstOrDefaultAsync();
                var commentImages = await _DbContext.RatingImages.Where(i => i.RateId == id).ToListAsync();
                var interests = await _DbContext.Interests.Where(i => i.RateId == id).ToListAsync();

                if (commentImages != null) _DbContext.RatingImages.RemoveRange(commentImages);
                if (interests != null) _DbContext.Interests.RemoveRange(interests);
                if (comments != null) _DbContext.Rates.Remove(comments);

                await _DbContext.SaveChangesAsync();

                return new SuccessResponse<List<string>>("Xóa thành công", imagesStr);
            }
            catch (Exception error)
            {
                return new FailResponse<List<string>>("Xóa không thành công: \n" + error);
            }
        }
        public async Task<ApiResponse> deleteCommentByProductId(int id)
        {
            try
            {
                var comments = await _DbContext.Rates.Where(i => i.ProductId == id).ToListAsync();
                if (comments.Count > 0)
                {
                    var commentIds = comments.Select(i => i.RateId).ToList();
                    if (commentIds.Count > 0)
                    {
                        foreach (var commentId in commentIds)
                        {
                            var images = await _DbContext.RatingImages.Where(i => i.RateId == commentId).ToListAsync();
                            _DbContext.RatingImages.RemoveRange(images);
                        }
                    }
                    _DbContext.Rates.RemoveRange(comments);
                }
                
                await _DbContext.SaveChangesAsync();

                return new ApiSuccessResponse("Xóa thành công");
            }
            catch (Exception error)
            {
                return new ApiFailResponse("Xóa không thành công: " + error);
            }
        }
    }
}
