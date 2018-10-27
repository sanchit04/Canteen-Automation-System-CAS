using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileSystem.Mobile
{
    public partial class Succesfull : System.Web.UI.Page
    {
        String rfnumber;
        String mobile;
        String firstname;

        protected void Page_Load(object sender, EventArgs e)
        {
            String id = Request.Form["txnid"];
            GridView1.Visible = false;
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
                con.Open();

                DataTable dt = new DataTable();
                SqlDataAdapter adapt = new SqlDataAdapter("select * from Order_Transaction where Transaction_Id1='" + id + "'", con);
                adapt.Fill(dt);
                con.Close();
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            rfnumber = this.GridView1.Rows[0].Cells[4].Text;
            String product = "select firstname,mobile_no from Student_Registration where rfnumber='" + rfnumber + "'";
            SqlConnection con5 = new SqlConnection();
            SqlCommand cmd5 = new SqlCommand();
            con5.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
            con5.Open();

            cmd5 = new SqlCommand(product, con5);
            SqlDataReader reader1 = cmd5.ExecuteReader();

            while (reader1.Read())
            {
                mobile = reader1["mobile_no"].ToString();
                firstname = reader1["firstname"].ToString();

            }
            con5.Close();
            string order_time = DateTime.Now.ToString("HH:mm");
            DateTime Date = DateTime.Now.Date;
            String date1 = Date.ToString("yyyy/MM/dd");
            SqlConnection con1 = new SqlConnection();
            SqlCommand cmd1 = new SqlCommand();
            con1.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";

            con1.Open();

            for (int index = 0; index < this.GridView1.Rows.Count; index++)
            {
                cmd1.CommandText = "Insert into Order_Admin(Transaction_Id,Username,Food_Name,Price,Time,Order_Date,Mobile_No,Quantity) values( '" + this.GridView1.Rows[index].Cells[0].Text + "','" + firstname + "','" + this.GridView1.Rows[index].Cells[1].Text + "','" + this.GridView1.Rows[index].Cells[3].Text + "','" + order_time + "','" + date1 + "','" + mobile + "','" + this.GridView1.Rows[index].Cells[2].Text + "')";
                cmd1.Connection = con1;
                cmd1.ExecuteNonQuery();
                cmd1.CommandText = "Insert into Order_Staff(Transaction_Id,Username,Food_Name,Quantity,Date,rfnumber) values( '" + this.GridView1.Rows[index].Cells[0].Text + "','" + firstname + "','" + this.GridView1.Rows[index].Cells[1].Text + "','" + this.GridView1.Rows[index].Cells[2].Text + "','" + date1 + "','" + rfnumber + "')";
                cmd1.Connection = con1;
                cmd1.ExecuteNonQuery();

            }
            con1.Close();
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("try.aspx");
        }
    }
}