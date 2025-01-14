﻿using System;
using System.Collections.Generic;

namespace ECommerce.Data.Entities.UserSchema
{
    public partial class Notification
    {
        public int Id { get; set; }
        public bool? IsRead { get; set; }
        public string TextContent { get; set; }
        public DateTime? CreateDate { get; set; }
        public string JsLink { get; set; }
        public string TypeCode { get; set; }
        public int? ReceiverId { get; set; }
        public int? SenderId { get; set; }
        public int? InfoId { get; set; }

        public virtual User Receiver { get; set; }
        public virtual User Sender { get; set; }
    }
}
