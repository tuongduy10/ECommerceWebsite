﻿using System;
using System.Collections.Generic;

namespace ECommerce.Data.Entities.UserSchema
{
    public partial class OnlineHistory
    {
        public int Id { get; set; }
        public DateTime? AccessDate { get; set; }
        public int UserId { get; set; }
        public int? Duration { get; set; }
    }
}
