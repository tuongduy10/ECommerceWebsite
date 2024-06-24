using ECommerce.Utilities.Shared;
using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Dtos.Oms.Request
{
    public class OrderPagingRequest : PagedRequest
    {
        public string status { get; set; } // status code || status id
    }
}
