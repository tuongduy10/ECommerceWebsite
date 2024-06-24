using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Infrastructure.Authentications
{
    public class HasPermissionAttribute : AuthorizeAttribute
    {
        public HasPermissionAttribute(string permission) 
            : base(policy: permission) 
        { 
            
        }
    }
}
