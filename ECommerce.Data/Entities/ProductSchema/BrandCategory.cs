using System;
using System.Collections.Generic;
using ECommerce.Data.Entities.Inventory;

namespace ECommerce.Data.Entities.ProductSchema
{
    public partial class BrandCategory
    {
        public int BrandId { get; set; }
        public int CategoryId { get; set; }

        public virtual Brand Brand { get; set; }
        public virtual Category Category { get; set; }
    }
}
