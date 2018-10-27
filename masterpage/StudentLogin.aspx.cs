using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string str = null;
        SqlConnection con = new SqlConnection(str);
        SqlCommand cmd = new SqlCommand();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
        con.Open();
        string strnew = "select count(*) from Student_Registration where email='"+ txtlabel.Text+"' and password='"+txtpassword.Text+"'";
        cmd = new SqlCommand(strnew, con);
        int count = Convert.ToInt32(cmd.ExecuteScalar());
        if (count > 0)
        {

            Response.Redirect("student_welcome.aspx");

        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Username/Password is not valid!!');", true);

        }
    }
}