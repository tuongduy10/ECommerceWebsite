using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Utilities.Shared
{
    public class PagedRequest
    {
        public int PageIndex { get; set; } = 1;
        public int PageSize { get; set; } = 10;
        public string SearchKey { get; set; }
    }
}
