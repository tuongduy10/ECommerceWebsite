using ECommerce.Application.BaseServices.User.Dtos;
using ECommerce.Application.BaseServices.User.Enums;
using ECommerce.Data.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Repositories.User
{
    public class UserRepository : RepositoryBase<Data.Entities.UserSchema.User>,IUserRepository
    {
        public UserRepository(ECommerceContext DbContext) : base(DbContext)
        {

        }
    }
}
