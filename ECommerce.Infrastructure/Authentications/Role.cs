using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Infrastructure.Authentications
{
    public enum RoleEnum
    {
        Admin = 1,
        Seller = 2,
        Buyer = 3,
    }
    public class RoleName
    {
        public const string Admin = "Admin";
        public const string Seller = "Seller";
        public const string Buyer = "Buyer";
    }
}
