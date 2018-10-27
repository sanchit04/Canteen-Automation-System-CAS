using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderForecast : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        Label2.Visible = false;

    }

    protected void txtfromtime_TextChanged(object sender, EventArgs e)
    {
        
    }

    protected void btnpredict_Click(object sender, EventArgs e)
    {
        DateTime Date = DateTime.Now.Date;
        String date1 = Date.ToString("yyyy/MM/dd");
        Label1.Visible = true;
        Label2.Visible = true;
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter sdt = null;
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
        con.Open();
        sdt = new SqlDataAdapter("select DISTINCT * from Order_Admin where Time Between ('"+txtfromtime.Text+"') and ('"+txttotime.Text+"') and Order_Date='"+date1+"' ", con);
        DataSet ds = new DataSet();
        sdt.Fill(ds, "Order_Admin");
        GridView1.DataSource = ds.Tables["Order_Admin"];
        GridView1.DataBind();
        //To count total price:
         String[] values = new String[this.GridView1.Rows.Count];
        for (int index = 0; index < this.GridView1.Rows.Count; index++)
        {
            values[index] = this.GridView1.Rows[index].Cells[3].Text;
        }
        int[] asIntegers = values.Select(s => int.Parse(s)).ToArray();
        int sum = 0;
         for (int i = 0; i < asIntegers.Length; i++)
         {
             sum += asIntegers[i];
         }
         Label2.Text = Convert.ToString(sum);


    }

}
