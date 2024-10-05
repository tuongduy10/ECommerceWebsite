using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Application.Services.UserSrv.Dtos
{
    public class UserUpdateRequest
    {
        public int id { get; set; }
        public bool IsActived { get; set; } // true: enable, false: disable
    }
}
