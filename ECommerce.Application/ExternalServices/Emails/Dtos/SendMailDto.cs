using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Application.ExternalServices.Emails.Dtos
{
    public class SendMailDto
    {
        public List<string> Tos { get; set; } = new List<string>();
        public List<string> Ccs { get; set; } = new List<string>();
        public string? Subject { get; set; }
        public string? Message { get; set; }
    }
}
