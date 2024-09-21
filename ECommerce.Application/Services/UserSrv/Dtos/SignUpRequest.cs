﻿using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Application.Services.UserSrv.Dtos
{
    public class SignUpRequest
    {
        public string UserMail { get; set; }
        public string UserFullName { get; set; }
        public string UserAddress { get; set; }
        public string UserWardCode { get; set; }
        public string UserDistrictCode { get; set; }
        public string UserCityCode { get; set; }
        public string UserPhone { get; set; }

        public string Password { get; set; }
        public string RePassword { get; set; }

        public bool isSystemAccount { get; set; }
        public int RoleId { get; set; }
        public List<int> shopIds { get; set; }
    }
}
