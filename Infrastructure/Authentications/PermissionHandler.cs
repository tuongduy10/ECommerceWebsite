using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Infrastructure.Authentications
{
    public class PermissionHandler : AuthorizationHandler<PermissionRequirement>
    {
        protected override async Task HandleRequirementAsync(AuthorizationHandlerContext context, PermissionRequirement requirement)
        {
            var permissions = context.User.Claims.Where(_ => _.Type == "permission").Select(_ => _?.Value).ToList();
            if (permissions.Count == 0)
                return;

            if (permissions.Contains(requirement.permission))
            {
                context.Succeed(requirement);
            }
        }
    }
}
