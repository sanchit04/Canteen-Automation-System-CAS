using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileSystem.Mobile
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            MailMessage message = new MailMessage();
            message.Subject = "Feedback";
            message.Body = "Username:"+TextBox1.Text+"\n"+subject.Value.ToString()+"";
            message.From = new MailAddress("email@gmail.com");

            // Email Address from where you send the mail
            var fromAddress = "ruparelfeedback@gmail.com";

            //Password of your mail address
            const string fromPassword = "lyobnpgsqxffglpp";
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }


            var to = "ruparelcafe@gmail.com";
            message.To.Add(to);



            // Passing values to smtp object        
            smtp.Send(message);


        }
    }
}