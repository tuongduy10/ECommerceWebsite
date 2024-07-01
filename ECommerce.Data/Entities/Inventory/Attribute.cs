using System;
using System.Collections.Generic;
using ECommerce.Data.Entities.ProductSchema;

#nullable disable

namespace ECommerce.Data.Entities.Inventory
{
    public partial class Attribute
    {
        public Attribute()
        {
            ProductAttributes = new HashSet<ProductAttribute>();
            SubCategoryAttributes = new HashSet<SubCategoryAttribute>();
        }

        public bool IsDeleted { get; set; }
        public int AttributeId { get; set; }
        public string AttributeName { get; set; }

        public virtual ICollection<ProductAttribute> ProductAttributes { get; set; }
        public virtual ICollection<SubCategoryAttribute> SubCategoryAttributes { get; set; }
    }
}
