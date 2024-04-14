﻿using ECommerce.Data.Context;
using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Application.Repositories.OnlineHistory
{
    public class OnlineHistoryRepository : RepositoryBase<Data.Entities.UserSchema.OnlineHistory> ,IOnlineHistoryRepository
    {
        public OnlineHistoryRepository(ECommerceContext DbContext) : base(DbContext)
        {

        }
    }
}
