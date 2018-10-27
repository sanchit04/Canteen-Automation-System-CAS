using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class RemoveFood : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }
        protected void btndel_Click(object sender, EventArgs e)
        {
           
        
                SqlConnection con = new SqlConnection();
                SqlCommand cmd = new SqlCommand();
                con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
                con.Open();
                cmd.CommandText = "DELETE FROM addfood where foodname='" + DropDownList2.SelectedValue.ToString() + "'";
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Data Deleted !!');", true);

            
        }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
        con.Open();
        String item = "select foodname from addfood where category='" + DropDownList1.SelectedValue.ToString() + "'";
        cmd = new SqlCommand(item, con);
        SqlDataReader reader1 = cmd.ExecuteReader();
        DropDownList2.Items.Clear();
        while (reader1.Read())
        {

            DropDownList2.Items.Add(new ListItem(reader1[0].ToString(), reader1[0].ToString()));

        }
        reader1.Close();

    }
}