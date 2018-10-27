using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileSystem.Mobile
{
    public partial class Student_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["user"] = txtlabel.Text;               //this value is passed to order page.

        }

       

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("try.aspx");
        }

        protected void btn_submit_Click1(object sender, EventArgs e)
        {
            string str = null;
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand();
            con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
            con.Open();
            string strnew = "select count(*) from Student_Registration where email='" + txtlabel.Text + "' and password='" + txtpassword.Text + "'";
            cmd = new SqlCommand(strnew, con);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            if (count > 0)
            {

                Response.Redirect("Order.aspx");

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Username/Password is not valid!!');", true);

            }
        }
    }
}