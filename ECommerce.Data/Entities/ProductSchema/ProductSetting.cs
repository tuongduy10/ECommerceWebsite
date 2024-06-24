using ECommerce.Data.Abstractions;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ECommerce.Data.Entities.ProductSchema
{
    [Table("ProductSetting", Schema = "dbo")]
    public class ProductSetting : GenericAuditEntity<Guid>
    {
        public int NewPeriod { get; set; }
    }
}
