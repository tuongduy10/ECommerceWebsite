using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ECommerce.Data.Entities.ProductSchema
{
    [Table("ShopUsers", Schema = "dbo")]
    public partial class ShopUser
    {
        public int ShopId { get; set; }
        public int UserId { get; set; }

        public virtual Shop Shop { get; set; }
        public virtual UserSchema.User User { get; set; }
    }
}
