using ECommerce.Utilities.Constants;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Utilities.Shared.Responses
{
    public class SuccessResponse<T> : Response<T>
    {
        public SuccessResponse(string message = "success")
        {
            isSucceed = true;
            Status = StatusConstant.SUCCESS;
            Message = message;
        }
        public SuccessResponse(T data)
        {
            isSucceed = true;
            Status = StatusConstant.SUCCESS;
            Message = MessageConstant.SUCCESS;
            Data = data;
        }
        public SuccessResponse(string message, T data)
        {
            isSucceed = true;
            Status = StatusConstant.SUCCESS;
            Message = message;
            Data = data;
        }
    }
}
