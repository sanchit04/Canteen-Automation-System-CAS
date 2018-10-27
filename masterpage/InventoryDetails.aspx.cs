using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class InventoryDetails : System.Web.UI.Page
{
    String productID = "Product";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            GenerateAutoID();
        }
    }
    private void GenerateAutoID()
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
        con.Open();
        SqlCommand cmd = new SqlCommand("select Count(productid) from Inventory_details",con);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        i++;
        txtproid.Text = productID + i.ToString();
    }
    protected void btnprosubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
        con.Open();
        cmd.CommandText = "Insert into Inventory_details(productid,productname,quantity) values('" + txtproid.Text + "','" + txtproname.Text + "','" + txtqnty.Text + "')";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        GenerateAutoID();
        ClearTextBox();
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Data Added !!');", true);
    }
    private void ClearTextBox()
    {
        txtproname.Text = "";
        txtqnty.Text = "";
    }
}