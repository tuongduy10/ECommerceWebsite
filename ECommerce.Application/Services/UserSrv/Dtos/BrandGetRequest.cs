using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Application.Services.UserSrv.Dtos
{
    public class BrandGetRequest
    {
        public int shopId { get; set; }
        public int categoryId { get; set; }
        public BrandGetRequest()
        {
            shopId = -1;
            categoryId = -1;
        }
    }
}
