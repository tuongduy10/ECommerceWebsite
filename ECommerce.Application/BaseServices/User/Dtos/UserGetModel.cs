﻿using System;
using System.Collections.Generic;

namespace ECommerce.Application.BaseServices.User.Dtos
{
    public class UserGetModel
    {
        public int UserId { get; set; }
        public string UserMail { get; set; }
        public string UserFullName { get; set; }
        public DateTime UserJoinDate { get; set; }
        public string UserAddress { get; set; }
        public string UserWardCode { get; set; }
        public string UserDistrictCode { get; set; }
        public string UserCityCode { get; set; }
        public string UserPhone { get; set; }
        public List<string> UserRoles { get; set; }
        public bool Status { get; set; }
        public bool isSystemAccount { get; set; }
        public bool IsOnline { get; set; }
        public DateTime LastOnline { get; set; }
        public string LastOnlineLabel { get; set; }
    }
}
