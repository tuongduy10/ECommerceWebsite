﻿using ECommerce.Application.Services.Configurations.Dtos.Footer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Models.Configurations.Footer
{
    public class ManageFooterViewModel
    {
        public List<BlogModel> listBlog { get; set; }
        public List<SocialModel> listSocial { get; set; }
    }
}
