using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
namespace SEP_ASS3.Models
{
    public class MailService
    {
        private static readonly string HOST = "";
        private static readonly string USER ="";
        private static readonly string PASSWORD="";

        /**
         * Send email including subject address and content.
         * */
        public static void SendEmail(string Subject, string Recipitent, string Content)
        {
            SmtpClient Client = new SmtpClient();
            Client.Port = 587;
            Client.Host = HOST;
            Client.Credentials = new System.Net.NetworkCredential(USER, PASSWORD);
            Client.EnableSsl = true;
            Client.Send(GetMessage(Subject,Recipitent, Content));  
        }
        //create email content body
        private static MailMessage GetMessage(string Subject, string Recipitent, string Content)
        {
            MailMessage Msg = new MailMessage();
            Msg.To.Add(Recipitent);
            //because we use third party smtp service, the following code has no functionality but is still required
            Msg.From = new MailAddress("sep_coogee@test.com", "alex");
            Msg.Subject = Subject;
            Msg.Body =  Content;
            Msg.IsBodyHtml = false;
            return Msg;
        }
    }
}