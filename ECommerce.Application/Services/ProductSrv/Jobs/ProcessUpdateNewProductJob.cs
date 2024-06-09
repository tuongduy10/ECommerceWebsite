using Quartz;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.ProductSrv.Jobs
{
    [DisallowConcurrentExecution]
    public class ProcessUpdateNewProductJob : IJob
    {
        private readonly IProductService _productService;
        public ProcessUpdateNewProductJob(IProductService productService)
        {
            _productService = productService;
        }
        public async Task Execute(IJobExecutionContext context)
        {
            await _productService.processUpdateNewProduct();
        }
    }
}
