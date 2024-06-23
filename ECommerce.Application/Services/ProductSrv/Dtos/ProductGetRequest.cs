using ECommerce.Application.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Application.Services.ProductSrv.Dtos
{
    public class ProductGetRequest : PageRequest
    {
        public int id { get; set; } = -1;
        public List<int> ids { get; set; }
        public string keyword { get; set; }
        public int? shopId { get; set; }
        public int brandId { get; set; }    
        public int subCategoryId { get; set; }
        public int categoryId { get; set; }
        public string orderBy { get; set; } = ""; // asc | desc
        public string filterBy { get; set; } = ""; // price, newest, discount, ...
        public bool isHotSale { get; set; } = false;
        public bool isNew { get; set; } = false;
        public bool isAvailable { get; set; } = false;
        public bool isPreOrder { get; set; } = false;
        public List<int> optionValueIds { get; set; }
        public string getBy { get; set; }

        public ProductGetRequest()
        {
            keyword = "";
            id = -1;
            ids = new List<int>();
            brandId = -1;
            subCategoryId = -1;
            categoryId = -1;
            shopId = -1;
            orderBy = "";
        }
    }
}
