using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Infrastructure.Authentications
{
    public class PermissionRequirement : IAuthorizationRequirement
    {
        public string permission { get; }
        public PermissionRequirement(string permission) 
        { 
            this.permission = permission;
        }
    }
}
