using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class UpdateDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String product = "select productname from Inventory_details;";
            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
            con.Open();

            cmd = new SqlCommand(product, con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                DropDownList1.Items.Add(new ListItem(reader[0].ToString(), reader[0].ToString()));

            }
            reader.Close();
        }
    }
    protected void btnupsubmit_Click(object sender, EventArgs e)
    {
        int new2 = Convert.ToInt32(txtactual.Text);
       
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
        
        cmd.CommandText = "UPDATE Inventory_details SET quantity= '" + new2 + "'where Inventory_details.productname='" + DropDownList1.SelectedValue.ToString() + "'";
        con.Open();
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        clear1();
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Quantity Updated !!');", true);
    }
    void clear1()
    {
        txtavl.Text = "";
        txtactual.Text = "";
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
        con.Open();
        cmd.CommandText = "Select quantity from Inventory_details where productname='" + DropDownList1.SelectedItem.ToString() + "'";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            txtavl.Text = dr["quantity"].ToString();

        }
        con.Close(); 
    }
}