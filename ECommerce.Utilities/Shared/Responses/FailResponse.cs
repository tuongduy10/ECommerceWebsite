using ECommerce.Utilities.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Utilities.Shared.Responses
{
    public class FailResponse<T> : Response<T>
    {
        public FailResponse(string message = "")
        {
            isSucceed = false;
            Status = StatusConstant.FAIL;
            Message = !string.IsNullOrEmpty(message) ? message : MessageConstant.ERROR;
        }
    }
}
