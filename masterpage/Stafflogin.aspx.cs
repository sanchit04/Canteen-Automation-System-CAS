
using SmsClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Stafflogin : System.Web.UI.Page
{
    string to;
    string rfnumber;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //Displaying the Data  
            showData();
            //Adding an Attribute to Server Control(i.e. btnDeleteRecord)  
            btnDeleteRecord.Attributes.Add("onclick", "javascript:return DeleteConfirm()");
        }

       
    }
    protected void showData()
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
        con.Open();

        DataTable dt = new DataTable();
        SqlDataAdapter adapt = new SqlDataAdapter("select DISTINCT * from Order_Staff", con);
        adapt.Fill(dt);
        con.Close();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void DeleteRecord(int Transaction_Id)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
        SqlCommand com = new SqlCommand("delete from Order_Staff where Transaction_Id=@ID", con);
        com.Parameters.AddWithValue("@ID", Transaction_Id);
        con.Open();
        com.ExecuteNonQuery();
        con.Close();
    }

    protected void btnDeleteRecord_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow grow in GridView1.Rows)
        {
            //Searching CheckBox("chkDel") in an individual row of Grid  
            CheckBox chkdel = (CheckBox)grow.FindControl("chkDel");
            //If CheckBox is checked than delete the record with particular empid  
            if (chkdel.Checked)
            {
                int Transaction_Id = Convert.ToInt32(grow.Cells[1].Text);
                DeleteRecord(Transaction_Id);
                 rfnumber = grow.Cells[6].Text;

            }
        }
        //Displaying the Data in GridView  
        showData();
        
        String product = "select mobile_no from Student_Registration where rfnumber='"+rfnumber+"'";
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
        con.Open();

        cmd = new SqlCommand(product, con);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
             to = reader["mobile_no"].ToString();

        }
        reader.Close();
        string strUrl = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=sanchit10gawde@gmail.com:sp101897&senderID=TEST SMS&receipientno="+to+"&msgtxt=Your order is ready! API&state=4";
        WebRequest request = HttpWebRequest.Create(strUrl);
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Stream s = (Stream)response.GetResponseStream();
        StreamReader readStream = new StreamReader(s);
        string dataString = readStream.ReadToEnd();
        response.Close();
        s.Close();
        readStream.Close();
    }
    
    


}