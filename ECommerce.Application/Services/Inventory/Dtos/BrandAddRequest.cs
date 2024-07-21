using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Application.Services.Inventory.Dtos
{
    public class BrandAddRequest
    {
        public int id { get; set; } = -1;
        public string name { get; set; }
        public string descriptionTitle { get; set; }
        public string description { get; set; }
        public string imagePath { get; set; }
        public List<int> categoryIds { get; set; }
        public bool isHighLight { get; set; }
    }
}
