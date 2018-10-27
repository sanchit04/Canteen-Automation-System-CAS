using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class StudentRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["First_Name"] = txtfname.Text;
        Session["Middle_Name"] = txtmname.Text;
        Session["Last_Name"] = txtlname.Text;
        Session["RFNumber"] = txtrfno.Text;
        Session["Email"] = txtemail.Text;
        Session["Password"] = pass_txt.Text;
        Session["Confirm_password"] = confpass_txt.Text;
    }
   
    protected void btnpreview_Click(object sender, EventArgs e)
    {
        Response.Redirect("PagePreview.aspx");
    }
}