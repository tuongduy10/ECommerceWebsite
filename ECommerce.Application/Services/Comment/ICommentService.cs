﻿using ECommerce.Application.Common;
using ECommerce.Application.Repositories;
using ECommerce.Application.Services.Comment.Request;
using ECommerce.Application.BaseServices.Rate.Dtos;
using ECommerce.Application.BaseServices.Rate.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Utilities.Shared.Responses;

namespace ECommerce.Application.Services.Comment
{
    public interface ICommentService
    {
        Task<Response<bool>> postComment(PostCommentRequest request);
        Task<Response<LikeAndDislike>> LikeComment(LikeAndDislikeCount request);
        Task<Response<List<string>>> ReplyCommentAsync(ReplyCommentRequest request);
        Task<Response<List<string>>> UpdateComment(UpdateCommentRequest request);
        Task<Response<List<RateGetModel>>> getRates(RateGetRequest request);
        Task<Response<List<string>>> GetUsersFavor(UserFavorRequest request);
        Task<Response<List<string>>> DeleteByProductId(int _productId);
        Task<Response<List<string>>> DeleteByUserId(int _userId);
    }
}
