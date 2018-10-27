using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MobileSystem.Mobile
{
    public partial class Order_Confirm : System.Web.UI.Page
    {
        String rf;
        DataTable dt;
        int r;
        string trans_id;
        String username;
        String mobile;
        String email;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            rf = Session["rfnumber"].ToString();
            r = (new Random()).Next(100, 1000);
            txnid.Value = r.ToString();
            txnid.Value = "Canteen" + txnid.Value.ToString();
            trans_id = "Canteen" + r.ToString();
            if (!IsPostBack)
            {
                r = (new Random()).Next(100, 1000);
                txnid.Value = r.ToString();
                txnid.Value = "Canteen" + txnid.Value.ToString();
                trans_id = "Canteen" + r.ToString();
                showData();
                //Adding an Attribute to Server Control(i.e. btnDeleteRecord)  
                btnDeleteRecord.Attributes.Add("onclick", "javascript:return DeleteConfirm()");
               
            }
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
            lbl_total.Text = sum.ToString();
        }
        protected void showData()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
            con.Open();

            DataTable dt = new DataTable();
            SqlDataAdapter adapt = new SqlDataAdapter("select * from Order_Temp where rfnumber='"+rf+"'", con);
            adapt.Fill(dt);
            con.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void DeleteRecord(int Transaction_Id)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
            SqlCommand com = new SqlCommand("delete from Order_Temp where Transaction_Id=@ID", con);
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
                    int Transaction_Id = Convert.ToInt32(grow.Cells[4].Text);
                    DeleteRecord(Transaction_Id);
                    

                }
            }
            //Displaying the Data in GridView  
            showData();
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
            lbl_total.Text = sum.ToString();

        }




            protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Order.aspx");
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            username = Session["username"].ToString();
            email = Session["email"].ToString();
            mobile = Session["mobile"].ToString();
            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
            
            con.Open();
            
            for (int index = 0; index < this.GridView1.Rows.Count; index++)
            {
                cmd.CommandText = "Insert into Order_Transaction(Transaction_Id1,Transaction_Id2,Food_Name,Quantity,Unit_Price,Total_Price,rfnumber) values( '" + trans_id + "','" + this.GridView1.Rows[index].Cells[4].Text + "','" + this.GridView1.Rows[index].Cells[0].Text + "','" + this.GridView1.Rows[index].Cells[1].Text + "','" + this.GridView1.Rows[index].Cells[2].Text + "','" + this.GridView1.Rows[index].Cells[3].Text + "','"+rf+"')";
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
            }
            con.Close();
            String text = key.Value.ToString() + "|" + txnid.Value.ToString() + "|" + lbl_total.Text + "|" + "Food Items" + "|" + username + "|" + email + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "||||||" + salt.Value.ToString();
            byte[] message = Encoding.UTF8.GetBytes(text);
            UnicodeEncoding UE = new UnicodeEncoding();
            byte[] hashValue;
            SHA512Managed hashString = new SHA512Managed();
            string hex = "";
            hashValue = hashString.ComputeHash(message);
            foreach(byte x in hashValue)
            {
                hex += String.Format("{0:x2}", x);
            }
            hash.Value = hex;
            System.Collections.Hashtable data = new System.Collections.Hashtable();
            data.Add("hash", hex.ToString());
            data.Add("txnid", txnid.Value);
            data.Add("key", key.Value);
            data.Add("amount", lbl_total.Text.Trim());
            data.Add("firstname", username);
            data.Add("email", email);
            data.Add("phone", mobile);
            data.Add("productinfo", "Food Items");
            data.Add("udf1", "1");
            data.Add("udf2", "1");
            data.Add("udf3", "1");
            data.Add("udf4", "1");
            data.Add("udf5", "1");
            data.Add("surl", "http://localhost:1220/Succesfull.aspx");
            data.Add("furl", "http://localhost:1220/Failure.aspx");
            data.Add("service_provider", "payu_paisa");
            string strForm = PreparePOSTForm("https://test.payu.in/_payment", data);  //preparepostform will redirect to given site and also submits the data.
            Page.Controls.Add(new LiteralControl(strForm));
        }
        private string PreparePOSTForm(string url,System.Collections.Hashtable data)
        {
            string formID = "PostForm";
            StringBuilder strForm = new StringBuilder();
            strForm.Append("<form id=\"" + formID + "\"name=\"" + formID + "\"action=\"" + url + "\"method=\"POST\">");
            foreach(System.Collections.DictionaryEntry key in data)
            {
                strForm.Append("<input type=\"hidden\"name=\"" + key.Key + "\"value=\"" + key.Value + "\">");
            }
            strForm.Append("</form>");
            StringBuilder strScript = new StringBuilder();
            strScript.Append("<script language='javascript'>");
            strScript.Append("var v" + formID + "=document." + formID + ";");
            strScript.Append("v" + formID + ".submit();");
            strScript.Append("</script>");
            return strForm.ToString() + strScript.ToString();
        }
    }
}