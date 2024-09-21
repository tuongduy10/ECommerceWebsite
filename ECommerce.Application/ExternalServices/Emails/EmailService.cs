using ECommerce.Application.ExternalServices.Emails.Dtos;
using ECommerce.Utilities.Helpers;
using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.Extensions.Configuration;
using MimeKit;
using System;
using System.IO;
using System.Net;
using System.Threading.Tasks;

namespace ECommerce.Application.ExternalServices.Emails
{
    public class EmailService : IEmailService
    {
        private readonly IConfiguration _configuration;

        public EmailService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task SendEmailAsync(SendMailDto dto)
        {
            string host = HashHelper.Decrypt(_configuration.GetValue<string>("Smtp:Host"));
            int port = _configuration.GetValue<int>("Smtp:Port");
            string emailFrom = HashHelper.Decrypt(_configuration.GetValue<string>("Smtp:Username"));
            string password = HashHelper.Decrypt(_configuration.GetValue<string>("Smtp:Password"));
            bool enableSsl = _configuration.GetValue<bool>("Smtp:EnableSsl");

            // Create a new email message
            var email = new MimeMessage();
            email.From.Add(MailboxAddress.Parse(emailFrom));
            dto.Tos.ForEach(to => { email.To.Add(MailboxAddress.Parse(to)); });
            dto.Ccs.ForEach(cc => { email.To.Add(MailboxAddress.Parse(cc)); });
            email.Subject = dto.Subject;
            email.Body = new TextPart("html")
            {
                Text = dto.Message
            };

            // Send the email
            using (var smtp = new SmtpClient())
            {
                smtp.CheckCertificateRevocation = false;
                smtp.Connect(host, port, SecureSocketOptions.StartTls);
                smtp.Authenticate(emailFrom, password);
                smtp.Send(email);
                smtp.Disconnect(true);
            }
        }
    }
}
