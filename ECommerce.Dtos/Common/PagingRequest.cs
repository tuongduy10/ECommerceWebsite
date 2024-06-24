using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Dtos.Common
{
    public class PagingRequest
    {
        public int pageIndex { get; set; }
        public int pageSize { get; set; }
        public string keyword { get; set; }
    }
}
