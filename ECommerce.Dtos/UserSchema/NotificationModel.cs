using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Dtos.UserSchema
{
    public class NotificationModel
    {
        public int Id { get; set; }
        public string TextContent { get; set; }
        public string JsLink { get; set; }
        public bool IsRead { get; set; }
        public DateTime CreateDate { get; set; }
        public string TypeCode { get; set; }
        public int ReceiverId { get; set; }
        public string SenderName { get; set; }
        public int SenderId { get; set; }
        public bool SenderIsAdmin { get; set; }
        public bool ReceiverIsAmin { get; set; }
    }
}
