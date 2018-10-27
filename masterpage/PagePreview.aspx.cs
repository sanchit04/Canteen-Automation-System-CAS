using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class PagePreview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        pre_txtfname.Text = Session["First_Name"].ToString();
        pre_txtmname.Text = Session["Middle_Name"].ToString();
        pre_txtlname.Text = Session["Last_Name"].ToString();
        pre_txtrfno.Text = Session["RFNumber"].ToString();
        pre_txtemail.Text = Session["Email"].ToString();
        pre_pass_txt.Text = Session["Password"].ToString();
        pre_confpass_txt.Text = Session["Confirm_password"].ToString();
    }
    protected void btnedit_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentRegistration.aspx");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
         rfcheck();
        /*SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
        con.Open();
        cmd.CommandText = "insert into Student_Registration(firstname,middlename,lastname,rfnumber,email,password,confirm_password) values('" + pre_txtfname.Text + "','" + pre_txtmname.Text + "','" + pre_txtlname.Text + "','" + pre_txtrfno.Text + "','" + pre_txtemail.Text + "','" + pre_pass_txt.Text + "','" + pre_confpass_txt.Text + "');";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registration Completed Successfully!!');", true);
        clearTextbox();*/

        
    }
    private void clearTextbox()
    {
        pre_txtfname.Text = "";
        pre_txtmname.Text = "";
        pre_txtlname.Text = "";
        pre_txtrfno.Text = "";
        pre_txtemail.Text = "";
        pre_pass_txt.Text = "";
        pre_confpass_txt.Text = "";
    }
    public void rfcheck()
    {
        string str = null;
        SqlConnection con = new SqlConnection(str);
        SqlCommand cmd = new SqlCommand();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
        con.Open();
        string strnew = "select count(*) from college1 where rfnumber ='" + pre_txtrfno.Text + "'";
        cmd = new SqlCommand(strnew, con);
        int count = Convert.ToInt32(cmd.ExecuteScalar());
        if (count > 0)
        {
            SqlConnection con1 = new SqlConnection(str);
            SqlCommand cmd1 = new SqlCommand();
            con1.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
            con1.Open();
            cmd1.CommandText = "insert into Student_Registration(firstname,lastname,rfnumber,email,password,mobile_no) values('" + pre_txtfname.Text + "','" + pre_txtmname.Text + "','" + pre_txtlname.Text + "','" + pre_txtrfno.Text + "','" + pre_txtemail.Text + "','" + pre_pass_txt.Text + "');";
            cmd1.Connection = con1;
            cmd1.ExecuteNonQuery();
            con1.Close();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registration Completed Successfully!!');", true);
           
            var username = pre_txtemail.Text;
            var password = pre_pass_txt.Text;

            MailMessage message = new MailMessage();
            message.Subject = "Registration Sucessfull!";
            message.Body = "Hello,This is to inform you that you have been sucessfully registered for canteen login and your unique username is: "+username+" and your password is:"+password+"\n Regards,\nRuparel College.";
            message.From = new MailAddress("email@gmail.com");

            // Email Address from where you send the mail
            var fromAddress = "ruparel1097@gmail.com";

            //Password of your mail address
            const string fromPassword = "mdgwygoznmeqyoqf";
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }


            var to = pre_txtemail.Text;
                message.To.Add(to);

            

            // Passing values to smtp object        
            smtp.Send(message);

           

        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('RF-Number is not valid!!');", true);

        }
        //  clear();
        con.Close();

    }
}