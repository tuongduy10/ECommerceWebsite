using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Application.Services.Inventory.Dtos
{
    public class SizeGuideModel
    {
        public int id { get; set; } = -1;
        public string content { get; set; }
        public bool isBase { get; set; }
        public int subCategoryId { get; set; } = -1;
        public List<SubCategoryModel> subCategories { get; set; }
    }
}
