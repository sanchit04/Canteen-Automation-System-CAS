using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AddFood : System.Web.UI.Page
{
    String foodID = "10";
    
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
            GenerateAutoID();
        }
    }
    private void GenerateAutoID()
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
        con.Open();
        SqlCommand cmd = new SqlCommand("select Count(fooditemno) from addfood", con);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        i++;
        txtfoodno.Text = foodID + i.ToString();
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
        cmd.CommandText = "Insert into addfood(fooditemno,category,foodname,amount,productname,productid,quantity) values('" + txtfoodno.Text + "','" + txtcategory.Text + "','" + txtname.Text + "','" + txtamnt.Text + "','" + DropDownList1.Text + "','" + txtId.Text + "','" + txtquant.Text + "')";
        con.Open();
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        GenerateAutoID();
        
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product Added !!');", true);

        
       
        

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int new2 = Convert.ToInt32(txtquant.Text);
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Data Updated !!');", true);
        // string selected = DropDownList1.SelectedItem.ToString();

        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
        // String sub = "select quantity from Inventory_details where productname=" + DropDownList1.SelectedItem;
        cmd.CommandText = "UPDATE Inventory_details SET quantity= quantity-'" + new2 + "'where Inventory_details.productname='" + DropDownList1.SelectedValue.ToString() + "'";
        con.Open();
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        clear1();

        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Data Submitted !!');", true);
       
    }
   
    void clear1()
    {
        txtfoodno.Text = "";
        txtcategory.Text = "";
        txtname.Text = "";
        txtamnt.Text = "";
        txtquant.Text = "";
      
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
        con.Open();
        cmd.CommandText = "Select productid from Inventory_details where productname='"+DropDownList1.SelectedItem.ToString()+"'";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            txtId.Text = dr["productid"].ToString();
            
        }
        con.Close();  
    }


   
}
