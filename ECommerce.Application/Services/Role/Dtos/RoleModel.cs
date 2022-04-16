﻿using ECommerce.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Role.Dtos
{
    public class RoleModel
    {
        public int RoleId { get; set; }
        public string RoleName { get; set; }

        public virtual List<UserRole> UserRoles { get; set; }
    }
}
