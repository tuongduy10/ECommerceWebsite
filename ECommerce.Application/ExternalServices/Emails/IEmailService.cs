using ECommerce.Application.ExternalServices.Emails.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.ExternalServices.Emails
{
    public interface IEmailService
    {
        Task SendEmailAsync(SendMailDto dto);
    }
}
