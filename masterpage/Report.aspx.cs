using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report : System.Web.UI.Page
{
    String dropdown1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList3.Items.Clear();
            DropDownList3.Items.Add("--Year--");
            var currentYear = DateTime.Today.Year;
            for (int i = 3; i >= 0; i--)
            {

                DropDownList3.Items.Add((currentYear - i).ToString());

            }

        }
      
        Label1.Text = "";
        Label2.Text = "";
        Label3.Text = "";
        Label4.Text = "";
        Label5.Text = "";
        Label6.Text = "";
      
        lbl_fromDate.Visible = false;
        lbl_toDate.Visible = false;
        txt_fromDate.Visible = false;
        txt_toDate.Visible = false;
        lbl_foodName.Visible = false;
        txt_foodName.Visible = false;
        lbl_month.Visible = false;
        DropDownList2.Visible = false;
        DropDownList3.Visible = false;
        GridView1.Visible = false;
        GridView2.Visible = false;
        lbl_year.Visible = false;
        if (IsPostBack)
        {
        
            
           
            dropdown1 = DropDownList1.SelectedValue.ToString();

        
            if (dropdown1 == "Product Report")
            {
                
                lbl_foodName.Visible = true;
                txt_foodName.Visible = true;
                lbl_toDate.Visible = true;
                lbl_fromDate.Visible = true;
                txt_toDate.Visible = true;
                txt_fromDate.Visible = true;
            }
            if (dropdown1 == "Monthly Report")
            {
                
                lbl_month.Visible = true;
                DropDownList2.Visible = true;
            }
            if (dropdown1 == "Yearly Report")
            {
                
                
                lbl_year.Visible = true;
                
                DropDownList3.Visible = true;
            }

        }
    }



    protected void btn_report_Click(object sender, EventArgs e)
    {
        

       

        if (dropdown1 == "Product Report")
        {
            GridView1.Visible = true;
            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter sdt;
            con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
            con.Open();
            sdt = new SqlDataAdapter("select DISTINCT * from Order_Admin where Food_Name='" + txt_foodName.Text.Trim() + "' and Order_Date between('" + txt_fromDate.Text + "') and ('" + txt_toDate.Text + "') ", con);
           //   sdt = new SqlDataAdapter("select * from Order_Admin where Food_Name='" + txt_foodName.Text + "'", con);
            DataSet ds = new DataSet();
            sdt.Fill(ds, "Order_Admin");
            GridView1.DataSource = ds.Tables["Order_Admin"];
            GridView1.DataBind();
            
            int count = GridView1.Rows.Count;
            if (count == 0)
            {
                Label6.Text = txt_foodName.Text + " was not ordered in the specified dates.";
            }
            else
            {
                Label6.Text = txt_foodName.Text + " was ordered " + count + " times in the specified dates.";
            }
        }

        if (dropdown1 == "Monthly Report")
        {
            GridView1.Visible = true;
            String month = DropDownList2.SelectedValue.ToString();
            string str = month.Substring(0, 3);
            int monthInDigit = DateTime.ParseExact(str, "MMM", CultureInfo.InvariantCulture).Month;   //cultureInfo assigns number to the month
            String month1 = monthInDigit.ToString("00");

            String year = DateTime.Now.Year.ToString();
            int year1 = DateTime.Now.Year;
            String start_date = year + "-" + month1 + "-01";
            int days = DateTime.DaysInMonth(year1, monthInDigit);
            String to_date = year + "-" + month1 + "-" + days;
            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter sdt = null;
            con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
            con.Open();
            sdt = new SqlDataAdapter("select DISTINCT * from Order_Admin where Order_Date between('" + start_date + "') and ('" + to_date + "') ", con);
            //  sdt = new SqlDataAdapter("select * from Order_Admin where Food_Name='" + txt_foodName.Text + "'", con);
            DataSet ds = new DataSet();
            sdt.Fill(ds, "Order_Admin");
            GridView1.DataSource = ds.Tables["Order_Admin"];
            GridView1.DataBind();
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
            string sum1 = Convert.ToString(sum);
            Label6.Text = "Total Earnings in month of " + month + " is: " + sum1;



        }
        if (dropdown1 == "Yearly Report")
        {
            GridView1.Visible = true;
            GridView2.Visible = true;
            int year1 = DateTime.Now.Year;
            String start_date = year1 + "-01-01";

            int mon = DateTime.Now.Month;
            String month1 = mon.ToString("00");
            String year = DateTime.Now.Year.ToString();

            int days = DateTime.Now.Day;
            String to_date = year + "-" + month1 + "-" + days;


            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter sdt = null;
            con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
            con.Open();
            sdt = new SqlDataAdapter("select DISTINCT * from Order_Admin where Order_Date between('" + start_date + "') and ('" + to_date + "') ", con);
            //  sdt = new SqlDataAdapter("select * from Order_Admin where Food_Name='" + txt_foodName.Text + "'", con);
            DataSet ds = new DataSet();
            sdt.Fill(ds, "Order_Admin");
            GridView2.DataSource = ds.Tables["Order_Admin"];
            GridView2.DataBind();
            con.Close();

            String year2 = DropDownList3.SelectedValue.ToString();
            String start_date1 = year2 + "-01-01";
            String to_date1 = year2 + "-" + month1 + "-" + days;
            SqlConnection con1 = new SqlConnection();
            SqlCommand cmd1 = new SqlCommand();
            SqlDataAdapter sdt1 = null;
            con1.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
            con1.Open();
            sdt1 = new SqlDataAdapter("select DISTINCT * from Order_Admin where Order_Date between('" + start_date1 + "') and ('" + to_date1 + "') ", con1);
            //  sdt = new SqlDataAdapter("select * from Order_Admin where Food_Name='" + txt_foodName.Text + "'", con);
            DataSet ds1 = new DataSet();
            sdt1.Fill(ds1, "Order_Admin");
            GridView1.DataSource = ds1.Tables["Order_Admin"];
            GridView1.DataBind();
            Label2.Text = year2;
            Label3.Text = year;
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

            String[] values1 = new String[this.GridView2.Rows.Count];
            for (int index = 0; index < this.GridView2.Rows.Count; index++)
            {
                values1[index] = this.GridView2.Rows[index].Cells[3].Text;
            }
            int[] asIntegers1 = values1.Select(s => int.Parse(s)).ToArray();
            int sum1 = 0;
            for (int i = 0; i < asIntegers1.Length; i++)
            {
                sum1 += asIntegers1[i];
            }
            if (sum > sum1)
            {
                float total = sum1 + sum;
                float difference = sum - sum1;
                float final = (difference / total) * 100;
                int final1 = Convert.ToInt32(final);
                Label1.Text = "Compared to " + year2 + " the income till date was Rs." + difference + " i.e. " + final1 + " % higher than this year.";
                Label4.Text = "We need to attract more customers as the report is not so good till date compared to " + year2;
            }
            if (sum == sum1)
            {
                Label5.Text = "Great work the income till date is same as that of" + year2;
            }
            if (sum < sum1)
            {
                float total = sum1 + sum;
                float difference = sum1 - sum;
                float final = (difference / total) * 100;
                int final1 = Convert.ToInt32(final);
                Label1.Text = "Compared to " + year2 + " ,the income till date was Rs. " + difference + " i.e. " + final1 + "% lesser than this year.";
                Label5.Text = "This means,till date there is a quite impressive progress than " + year2;
            }

        }



    }

    
}