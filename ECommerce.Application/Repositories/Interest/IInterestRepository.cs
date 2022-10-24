﻿using ECommerce.Application.Services.Rate.Dtos;
using ECommerce.Application.Services.Rate.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Repositories.Interest
{
    public interface IInterestRepository
    {
        Task<LikeAndDislike> LikeAndDislikeCount(int rateId);
        Task<LikeAndDislike> LikeComment(LikeRequest request);
    }
}
