﻿using System;
using System.Collections.Generic;
using ECommerce.Data.Entities.ProductSchema;

#nullable disable

namespace ECommerce.Data.Entities.UserSchema
{
    public partial class User
    {
        public User()
        {
            Interests = new HashSet<Interest>();
            NotificationReceivers = new HashSet<Notification>();
            NotificationSenders = new HashSet<Notification>();
            RateUserReplieds = new HashSet<Rate>();
            RateUsers = new HashSet<Rate>();
            Shops = new HashSet<Shop>();
            UserRoles = new HashSet<UserRole>();
        }

        public int UserId { get; set; }
        public string UserMail { get; set; }
        public string UserFullName { get; set; }
        public DateTime? UserJoinDate { get; set; }
        public string UserAddress { get; set; }
        public string UserWardCode { get; set; }
        public string UserDistrictCode { get; set; }
        public string UserCityCode { get; set; }
        public string UserWardName { get; set; }
        public string UserDistrictName { get; set; }
        public string UserCityName { get; set; }
        public string UserPhone { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool? Status { get; set; }
        public bool? IsSystemAccount { get; set; }
        public bool? IsOnline { get; set; }
        public DateTime? LastOnline { get; set; }

        public virtual ICollection<Interest> Interests { get; set; }
        public virtual ICollection<Notification> NotificationReceivers { get; set; }
        public virtual ICollection<Notification> NotificationSenders { get; set; }
        public virtual ICollection<Rate> RateUserReplieds { get; set; }
        public virtual ICollection<Rate> RateUsers { get; set; }
        public virtual ICollection<Shop> Shops { get; set; }
        public virtual ICollection<UserRole> UserRoles { get; set; }
    }
}
