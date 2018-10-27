using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileSystem.Mobile
{
    public partial class Student_Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["RFNumber"] = txtfname.Text;
            Session["First_Name"] = txtlname.Text;
            Session["Email"] = txtrfno.Text;
            Session["Last_Name"] = txtemail.Text;
            Session["Mobile"] = txtmobile.Text;
            Session["Password"] = pass_txt.Text;
            Session["Confirm_password"] = confpass_txt.Text;

        }

        protected void btnpreview_Click(object sender, EventArgs e)
        {
            if (txtmobile.Text != "")
            {
                if (txtmobile.Text.All(char.IsDigit) == true)
                {
                    if (txtmobile.Text.Length == 10)
                    {
                        if (pass_txt.Text != "")
                        {
                            if (pass_txt.Text == confpass_txt.Text)
                            {
                                Response.Redirect("Preview.aspx");
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password did not match');", true);
                            }



                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password field cannot be empty');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mobile number has to be 10 digits');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mobile number has to be in digits');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mobile number cannot be empty');", true);
            }
           
        }

        protected void txtfname_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
            con.Open();
            string strnew = "select count(*) from college1 where rfnumber='"+txtfname.Text+ "'";
            cmd = new SqlCommand(strnew, con);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            if (count > 0)
            {

                SqlConnection con1 = new SqlConnection();
                SqlCommand cmd1 = new SqlCommand();
                con1.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
                con1.Open();
                String name = "select firstname,lastname,email from college1 where rfnumber='" + txtfname.Text + "'";
                cmd1 = new SqlCommand(name, con);

                SqlDataReader reader = cmd1.ExecuteReader();

                while (reader.Read())
                {

                    var firstname = reader["firstname"].ToString();
                    txtlname.Text = firstname;
                    

                    var lastname = reader["lastname"].ToString();
                    txtemail.Text = lastname;
                    

                    var email = reader["email"].ToString();
                    txtrfno.Text = email;

                   

                }
                reader.Close();
                con.Close();

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Rf-Number is not valid!!Type as it is on the ID without any spaces');", true);
                txtfname.Text = "";
                txtlname.Text = "";
                txtemail.Text = "";
                txtrfno.Text = "";
            }
        }
    }
}