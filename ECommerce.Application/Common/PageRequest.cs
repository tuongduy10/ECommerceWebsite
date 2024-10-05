﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Common
{
    public class PageRequest
    {
        public string? Keyword { get; set; }
        public int PageIndex { get; set; }
        public int PageSize = 30;
        public PageRequest()
        {
            PageIndex = 1;
        }
    }
}
