using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Adminlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
   
    
    protected void btnlogin_Click1(object sender, EventArgs e)
    {
        if (txtusername.Text == "Admin" && txtpassword.Text == "admin123")
        {
            Response.Redirect("AdminDetails.aspx");
        }
        else
        {
            Label1.Text = "Username/Password is not Valid.";
        }

    }
    protected void btnback_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}