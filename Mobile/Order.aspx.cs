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
    
    public partial class Order : System.Web.UI.Page
    {
        int r;
        String username;
        int comboCost;
        int singleCost;
        String quantity;
        String comboQuantity;
        //int amount;
        string abc2;
        string abc1;
        String checked1;
        String checked2;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["selected"] = DropDownList3.SelectedValue.ToString(); 
            txtquantity.Visible = true;
            lbl_quantity.Visible = true;
            lbl_comboQuantity.Visible = false;
            txt_comboQuantity.Visible = false;
            quantity =txtquantity.Text;
            String item = "select foodname,amount from addfood where category='" + DropDownList1.SelectedValue.ToString()+ "'";
          
            SqlConnection con2 = new SqlConnection();

            SqlCommand cmd2 = new SqlCommand();
            con2.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
            con2.Open();

            cmd2 = new SqlCommand(item, con2);
             DropDownList2.DataSource = cmd2.ExecuteReader();
            DropDownList2.DataTextField = "foodname";
            DropDownList2.DataValueField = "foodname";

            String item1 = "select amount from addfood where foodname='" + DropDownList2.SelectedValue.ToString() + "'";
            
            SqlConnection con3 = new SqlConnection();

            SqlCommand cmd3 = new SqlCommand();
            con3.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
            con3.Open();

            cmd3 = new SqlCommand(item, con3);
            SqlDataReader reader3 = cmd3.ExecuteReader();
            while (reader3.Read())
            {

                 singleCost = Convert.ToInt32(reader3["amount"]);
               
            }
                DropDownList2.DataBind();
           
            con3.Close();


            DropDownList1.Visible = true;
           DropDownList2.Visible = true;
            lbl_category.Visible = true;
            lbl_food.Visible = true;
            RadioButtonList2.Visible = false;
            Label3.Visible = false;
            Label2.Visible = false;
            DropDownList3.Visible = false;
            username = Session["user"].ToString();
            SqlConnection con = new SqlConnection();
            SqlCommand cmd1 = new SqlCommand();
            con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
            con.Open();
            String name = "select firstname,rfnumber,email,mobile_no from Student_Registration where email='" + username + "'";
            cmd1 = new SqlCommand(name, con);

            SqlDataReader reader = cmd1.ExecuteReader();

            while (reader.Read())
            {

                var firstname = reader["firstname"].ToString();
                txtusername.Text = firstname;
                Session["username"] = username.ToString();

                var rf = reader["rfnumber"].ToString();
                txtref.Text = rf;
                Session["rfnumber"] = rf.ToString();

                var email = reader["email"].ToString();
                Session["email"] = email.ToString();

                var mobile = reader["mobile_no"].ToString();
                Session["mobile"] = mobile.ToString();

            }
            reader.Close();
            con.Close();
            DateTime dateAndTime = DateTime.Now;
            txtdate.Text = dateAndTime.ToString("dd/MM/yyyy");
            if (!IsPostBack)
            {
                 r = (new Random()).Next(100, 1000);
                txttransid.Text = r.ToString();
                Session["transaction_id"] = txttransid.Text;
            }
           // if (IsPostBack)
           // {
          //      r = (new Random()).Next(100, 1000);
           //     txttransid.Text = r.ToString();
           // }

            checked1 = RadioButtonList1.SelectedValue.ToString();
            if (checked1 == "Yes")
            {
                txtquantity.Visible = false;
                lbl_quantity.Visible = false;
                lbl_comboQuantity.Visible = true;
                txt_comboQuantity.Visible = true;
                DropDownList1.Visible = false;
               DropDownList2.Visible = false;
                lbl_category.Visible = false;
                lbl_food.Visible = false;
                Label3.Visible = true;
                RadioButtonList2.Visible = true;
                GridView1.Visible = true;
                DropDownList3.Visible = true;
                Label2.Visible = true;
                SqlConnection con1 = new SqlConnection();
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter sdt = null;
                con.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
                con.Open();
                sdt = new SqlDataAdapter("select comboname,category,foodname,cost from AddOffers1", con);
                //  sdt = new SqlDataAdapter("select * from Order_Admin where Food_Name='" + txt_foodName.Text + "'", con);
                DataSet ds = new DataSet();
                sdt.Fill(ds, "Order_Admin");
                GridView1.DataSource = ds.Tables["Order_Admin"];
                GridView1.DataBind();
                con.Close();

                String product = "select comboname,cost from AddOffers1";
                SqlConnection con5 = new SqlConnection();
                SqlCommand cmd5 = new SqlCommand();
                con5.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
                con5.Open();

                cmd5 = new SqlCommand(product, con5);
                SqlDataReader reader1 = cmd5.ExecuteReader();

                if (DropDownList3.Items.Count == 0)
                {
                    while (reader1.Read())
                    {


                        DropDownList3.Items.Add(new ListItem(reader1[0].ToString(), reader1[0].ToString()));
                        DropDownList3.DataBind();

                    }
                }

                reader1.Close();
                String product1 = "select cost from AddOffers1 where comboname='" + DropDownList3.SelectedValue.ToString() + "'";
                SqlConnection con4 = new SqlConnection();
                SqlCommand cmd4 = new SqlCommand();
                con4.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True ";
                con4.Open();

                cmd4 = new SqlCommand(product1, con4);
                SqlDataReader reader4 = cmd4.ExecuteReader();
                while (reader4.Read())
                {

                    comboCost = Convert.ToInt32(reader4["cost"].ToString());

                }

                reader4.Close();

            }
            if (checked1 == "No")
            {
                lbl_quantity.Visible = true;
                txtquantity.Visible = true;
                txt_comboQuantity.Visible = false;
                lbl_comboQuantity.Visible = false;
                DropDownList1.Visible = true;
               DropDownList2.Visible = true;
                lbl_category.Visible = true;
                lbl_food.Visible = true;
                DropDownList3.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;
                RadioButtonList2.Visible = false;
                GridView1.Visible = false;
            }
             checked2 = RadioButtonList2.SelectedValue.ToString();
            if (checked2 == "Yes")
            {
                lbl_quantity.Visible = true;
                txtquantity.Visible = true;
                DropDownList2.Visible = true;
                DropDownList1.Visible = true;
                lbl_category.Visible = true;
                lbl_food.Visible = true;

            }
            if (checked2 == "No")
            {
                lbl_quantity.Visible = false;
                txtquantity.Visible = false;
                DropDownList1.Visible = false;
               DropDownList2.Visible = false;
                lbl_category.Visible = false;
                lbl_food.Visible = false;
            }
            comboQuantity = txt_comboQuantity.Text;
            int num1 = Convert.ToInt32(abc2);
            int num2 = Convert.ToInt32(abc1);
            
            Session["comboItem"] = DropDownList3.SelectedValue.ToString();
            Session["amount"] = txtamount.Text;
            Session["combQuantity"] = txt_comboQuantity.Text;
            Session["singleQuantity"] = txtquantity.Text;
            Session["singleItem"] = DropDownList2.SelectedValue.ToString();
            Session["comboCost"] = comboCost.ToString();
            Session["singleCost"] = singleCost.ToString();
        }

        

       

       

        protected void txt_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txt_comboQuantity.Text))
            {
                if (abc2 == null)
                {
                    abc2 = (Convert.ToInt32(txt_comboQuantity.Text) * comboCost).ToString();
                    Session["abc2"] = abc2;
                }
                if (checked1 == "Yes")
                {
                    Session["num"] = abc2;

                    txtamount.Text = (Convert.ToInt32(Session["num"]) + Convert.ToInt32(abc1)).ToString();
                }
                if(checked2=="No")
                {
                    txtamount.Text = abc2;
                }
            }


        }
        protected void txt_TextChanged1(object sender, EventArgs e)
        {
           
            if (!string.IsNullOrEmpty(txtquantity.Text))
            {
                if (abc1 == null)
                {
                    abc1 = (Convert.ToInt32(txtquantity.Text) * singleCost).ToString();
                    Session["abc1"] = abc1;
                }
                if (checked1 == "Yes")
                {
                    txtamount.Text = (Convert.ToInt32(Session["num"]) + Convert.ToInt32(abc1)).ToString();
                }
                if(checked1=="No")
                {
                    txtamount.Text = abc1;
                }
            }
             
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex > -1 && checked1=="Yes")
            {
                if (txt_comboQuantity.Text != "")
                {
                    if (txt_comboQuantity.Text.All(char.IsDigit) == true)
                    {
                        if (RadioButtonList2.SelectedIndex > -1)
                        {
                            if (txtquantity.Text != "")
                            {
                                if (txtquantity.Text.All(char.IsDigit) == true)
                                {
                                    SqlConnection con1 = new SqlConnection();
                                    SqlCommand cmd1 = new SqlCommand();
                                    con1.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
                                    con1.Open();
                                    if (checked1 == "Yes" && checked2 == "No")
                                    {
                                        cmd1.CommandText = "insert into Order_Temp(Food_Name,Quantity,Unit_Price,Total_Price,Transaction_Id,rfnumber) values('" + DropDownList3.SelectedValue.ToString() + "','" + txt_comboQuantity.Text + "','" + comboCost.ToString() + "','" + txtamount.Text + "','" + Session["transaction_id"].ToString() + "','" + Session["rfnumber"].ToString() + "');";
                                        cmd1.Connection = con1;
                                        cmd1.ExecuteNonQuery();
                                    }
                                    if (checked1 == "No")
                                    {
                                        cmd1.CommandText = "insert into Order_Temp(Food_Name,Quantity,Unit_Price,Total_Price,Transaction_Id,rfnumber) values('" + DropDownList2.SelectedValue.ToString() + "','" + txtquantity.Text + "','" + singleCost.ToString() + "','" + txtamount.Text + "','" + Session["transaction_id"].ToString() + "','" + Session["rfnumber"].ToString() + "');";
                                        cmd1.Connection = con1;
                                        cmd1.ExecuteNonQuery();


                                    }
                                    if (checked2 == "Yes" && checked1 == "Yes")
                                    {
                                        cmd1.CommandText = "insert into Order_Temp(Food_Name,Quantity,Unit_Price,Total_Price,Transaction_Id,rfnumber) values('" + DropDownList2.SelectedValue.ToString() + "','" + txtquantity.Text + "','" + singleCost.ToString() + "','" + Session["abc1"].ToString() + "','" + Session["transaction_id"].ToString() + "','" + Session["rfnumber"].ToString() + "');";
                                        cmd1.Connection = con1;
                                        cmd1.ExecuteNonQuery();
                                       int r1 = (new Random()).Next(100, 1000);
                                        String trans = r1.ToString();
                                        cmd1.CommandText = "insert into Order_Temp(Food_Name,Quantity,Unit_Price,Total_Price,Transaction_Id,rfnumber) values('" + DropDownList3.SelectedValue.ToString() + "','" + txt_comboQuantity.Text + "','" + comboCost.ToString() + "','" + Session["abc2"].ToString() + "','" + trans + "','" + Session["rfnumber"].ToString() + "');";
                                        cmd1.Connection = con1;
                                        cmd1.ExecuteNonQuery();

                                    }
                                    con1.Close();

                                    Response.Redirect("Order_Confirm.aspx");
                                }
                                
                            }
                            else
                            {
                                SqlConnection con1 = new SqlConnection();
                                SqlCommand cmd1 = new SqlCommand();
                                con1.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
                                con1.Open();
                                if (checked1 == "Yes" && checked2 == "No")
                                {
                                    cmd1.CommandText = "insert into Order_Temp(Food_Name,Quantity,Unit_Price,Total_Price,Transaction_Id,rfnumber) values('" + DropDownList3.SelectedValue.ToString() + "','" + txt_comboQuantity.Text + "','" + comboCost.ToString() + "','" + txtamount.Text + "','" + Session["transaction_id"].ToString() + "','" + Session["rfnumber"].ToString() + "');";
                                    cmd1.Connection = con1;
                                    cmd1.ExecuteNonQuery();
                                }
                                if (checked1 == "No")
                                {
                                    cmd1.CommandText = "insert into Order_Temp(Food_Name,Quantity,Unit_Price,Total_Price,Transaction_Id,rfnumber) values('" + DropDownList2.SelectedValue.ToString() + "','" + txtquantity.Text + "','" + singleCost.ToString() + "','" + txtamount.Text + "','" + Session["transaction_id"].ToString() + "','" + Session["rfnumber"].ToString() + "');";
                                    cmd1.Connection = con1;
                                    cmd1.ExecuteNonQuery();


                                }
                                if (checked2 == "Yes" && checked1 == "Yes")
                                {
                                    cmd1.CommandText = "insert into Order_Temp(Food_Name,Quantity,Unit_Price,Total_Price,Transaction_Id,rfnumber) values('" + DropDownList2.SelectedValue.ToString() + "','" + txtquantity.Text + "','" + singleCost.ToString() + "','" + Session["abc1"].ToString() + "','" + Session["transaction_id"].ToString() + "','" + Session["rfnumber"].ToString() + "');";
                                    cmd1.Connection = con1;
                                    cmd1.ExecuteNonQuery();
                                    int r1 = (new Random()).Next(100, 1000);
                                    String trans = r1.ToString();
                                    cmd1.CommandText = "insert into Order_Temp(Food_Name,Quantity,Unit_Price,Total_Price,Transaction_Id,rfnumber) values('" + DropDownList3.SelectedValue.ToString() + "','" + txt_comboQuantity.Text + "','" + comboCost.ToString() + "','" + Session["abc2"].ToString() + "','" + trans + "','" + Session["rfnumber"].ToString() + "');";
                                    cmd1.Connection = con1;
                                    cmd1.ExecuteNonQuery();

                                }
                                con1.Close();
                                Response.Redirect("Order_Confirm.aspx");

                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Select an option for single item');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Combo Quantity should be entered in digits');", true);
                    }


                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Combo Quantity cannot be empty');", true);
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Select an option for combo pack');", true);
            }
            if (RadioButtonList1.SelectedIndex > -1 && checked1 == "No")
            {
                if(txtquantity.Text!="")
                {
                    if (txtquantity.Text.All(char.IsDigit) == true)
                    {
                        SqlConnection con1 = new SqlConnection();
                        SqlCommand cmd1 = new SqlCommand();
                        con1.ConnectionString = "Data Source=DESKTOP-L2T1FTP\\SQLEXPRESS;Initial Catalog=canteen;Integrated Security=True";
                        con1.Open();
                        if (checked1 == "Yes" && checked2 == "No")
                        {
                            cmd1.CommandText = "insert into Order_Temp(Food_Name,Quantity,Unit_Price,Total_Price,Transaction_Id,rfnumber) values('" + DropDownList3.SelectedValue.ToString() + "','" + txt_comboQuantity.Text + "','" + comboCost.ToString() + "','" + txtamount.Text + "','" + Session["transaction_id"].ToString() + "','" + Session["rfnumber"].ToString() + "');";
                            cmd1.Connection = con1;
                            cmd1.ExecuteNonQuery();
                        }
                        if (checked1 == "No")
                        {
                            cmd1.CommandText = "insert into Order_Temp(Food_Name,Quantity,Unit_Price,Total_Price,Transaction_Id,rfnumber) values('" + DropDownList2.SelectedValue.ToString() + "','" + txtquantity.Text + "','" + singleCost.ToString() + "','" + txtamount.Text + "','" + Session["transaction_id"].ToString() + "','" + Session["rfnumber"].ToString() + "');";
                            cmd1.Connection = con1;
                            cmd1.ExecuteNonQuery();


                        }
                        if (checked2 == "Yes" && checked1 == "Yes")
                        {
                            cmd1.CommandText = "insert into Order_Temp(Food_Name,Quantity,Unit_Price,Total_Price,Transaction_Id,rfnumber) values('" + DropDownList2.SelectedValue.ToString() + "','" + txtquantity.Text + "','" + singleCost.ToString() + "','" + Session["abc1"].ToString() + "','" + Session["transaction_id"].ToString() + "','" + Session["rfnumber"].ToString() + "');";
                            cmd1.Connection = con1;
                            cmd1.ExecuteNonQuery();
                            int r1 = (new Random()).Next(100, 1000);
                            String trans = r1.ToString();
                            cmd1.CommandText = "insert into Order_Temp(Food_Name,Quantity,Unit_Price,Total_Price,Transaction_Id,rfnumber) values('" + DropDownList3.SelectedValue.ToString() + "','" + txt_comboQuantity.Text + "','" + comboCost.ToString() + "','" + Session["abc2"].ToString() + "','" + trans + "','" + Session["rfnumber"].ToString() + "');";
                            cmd1.Connection = con1;
                            cmd1.ExecuteNonQuery();

                        }
                        con1.Close();

                        Response.Redirect("Order_Confirm.aspx");

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Quantity should be in digits');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Quantity cannot be empty');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Select combo pack!');", true);
            }

        }
               
          
      
    }
}