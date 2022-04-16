﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Blog.Dtos
{
    public class BlogCreateRequest
    {
        public byte? BlogPosition { get; set; }
        public string BlogTitle { get; set; }
        public string BlogContent { get; set; }
        public byte? Status { get; set; }

    }
}