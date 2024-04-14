using ECommerce.Data.Abstractions;
using ECommerce.Data.Entities.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ECommerce.Data.Entities.OmsSchema
{
    [Table("Orders", Schema = "oms")]
    public class Order : GenericAuditEntity<Guid>
    {
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Remark { get; set; }
        public int CityId { get; set; }
        public virtual Province City { get; set; }
        public int DistrictId { get;    set; }
        public virtual District District { get; set; }
        public int WardId { get; set; }
        public virtual Ward Ward { get; set; }
    }
}
