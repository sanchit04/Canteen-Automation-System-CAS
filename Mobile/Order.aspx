<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="MobileSystem.Mobile.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Food</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
     
 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }

    span.psw1 {
       display: block;
       float: none;
    }

    .cancelbtn {
       width: 100%;
    }

}

        #id {
            font-family: Arial, Helvetica, sans-serif;
        }

    .content1 {
        position: relative;
     background:  #fff url("Image/food.jpg") center center;
     background-image: linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),url("Image/food.jpg");   
     width: 100%;
        height: 1424px;
        background-size: cover;
        overflow: hidden;
        left: 0px;
        top: 0px;
    }

    .header1 {
         margin-top:50px;
        text-align:center;
        font-size:20px;
        color:white;
        }

    .container {
    padding: 17px;
}

    input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

        .lbltrans {
        color:white;
        font-size:18px;
        }

        .radio1 {
        color:white;
        font-size:18px;
        padding:10px;
        }

        .drop1 {
        padding:5px;
        font-size:18px;
        }

        .button1 {
    background-color: #33CCFF;
    color: black;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    font-size:18px;
}


.button1:hover {
    opacity: 0.8;
}
       

       
        .auto-style1 {
            position: relative;
            background: #fff url('linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),url("Image/food.jpg")') center;
            width: 100%;
            height: 1615px;
            background-size: cover;
            overflow: hidden;
            left: 0px;
            top: 0px;
        }
       

       
    </style>
   
    
</head>
<body style="height: 1678px" runat="server" id="abc">
    <form id="form1" runat="server" controltovalidate="RadioButtonList1">
        <div class="auto-style1" runat="server"> 
           <div class="header1" runat="server">
            <center><h2>Order Food</h2></center> 
            </div> 
                 <div class="container">
                 <asp:Label runat="server" for="transid" CssClass="lbltrans"><b>Transaction ID</b></asp:Label>
                <asp:TextBox ID="txttransid" runat="server" ReadOnly="True" ></asp:TextBox>

                <asp:Label runat="server" for="username" CssClass="lbltrans"><b>Your name</b></asp:Label>
                <asp:TextBox ID="txtusername" runat="server" placeholder="Enter Username" ReadOnly="True"></asp:TextBox>

                <asp:Label runat="server" for="date" CssClass="lbltrans"><b>Ref No.</b></asp:Label>
                <asp:TextBox ID="txtref" runat="server" ReadOnly="True" ></asp:TextBox>

                <asp:Label runat="server" for="time" CssClass="lbltrans"><b>Date</b></asp:Label>
                <asp:TextBox ID="txtdate" runat="server" ReadOnly="True"></asp:TextBox>

                <asp:Label runat="server" for="combo" CssClass="lbltrans"><b>Combo Pack</b></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList1" RepeatLayout="Flow" RepeatDirection="Horizontal" class="radio1" runat="server" AutoPostBack="True"  oncheckedchanged="RadioButtonList1_CheckedChanged" ValidationGroup="Validation" >
                    <asp:ListItem Text="Yes" >Yes</asp:ListItem>
                    <asp:ListItem Text="No">No</asp:ListItem>
                 </asp:RadioButtonList>
                     
                  <br /><br />
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" BackColor="White"></asp:GridView><br /><br />
                     <asp:Label ID="Label2" runat="server" Text="Select Combo you want:" CssClass="lbltrans" Font-Bold="True"></asp:Label>
                     <asp:DropDownList ID="DropDownList3" runat="server" CssClass="drop1" AutoPostBack="True">
                     </asp:DropDownList>
<br /><br /> <asp:Label ID="lbl_comboQuantity" runat="server" Text="Quantity:" CssClass="lbltrans" Font-Bold="true"></asp:Label>
                     <asp:TextBox ID="txt_comboQuantity" runat="server" Placeholder="Enter combo quantity" AutoPostBack="True"  ontextchanged="txt_TextChanged"></asp:TextBox>
                     <asp:Label ID="Label3" runat="server" Text="Do you want any single item?" CssClass="lbltrans" Font-Bold="true"></asp:Label>
                     <asp:RadioButtonList ID="RadioButtonList2" RepeatLayout="Flow" RepeatDirection="Horizontal" class="radio1" runat="server" AutoPostBack="True" ValidationGroup="Validation" >
                   <asp:ListItem Text="Yes" >Yes</asp:ListItem>
                    <asp:ListItem Text="No">No</asp:ListItem>
                 </asp:RadioButtonList><br />
                     <asp:Label ID="lbl_category" runat="server" for="category" CssClass="lbltrans"><b>Category</b></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="drop1" AutoPostBack="True">
                    <asp:ListItem Value="Starter">Starter</asp:ListItem>
                    <asp:ListItem Value="Breakfast">Breakfast</asp:ListItem>
                    <asp:ListItem Value="Lunch">Lunch</asp:ListItem>
                 </asp:DropDownList>

                <br /><br /><asp:Label ID="lbl_food" runat="server" for="foodname" CssClass="lbltrans"><b>Food Name</b></asp:Label>
                     <asp:DropDownList ID="DropDownList2" runat="server" CssClass="drop1"></asp:DropDownList>
                 <br /><br /><asp:Label ID="lbl_quantity" runat="server" for="quantity" CssClass="lbltrans"><b>Quantity</b></asp:Label>
                <asp:TextBox ID="txtquantity" runat="server" placeholder="Enter Item Quantity" AutoPostBack="True" OnTextChanged="txt_TextChanged1"></asp:TextBox>
                <br /><asp:Label runat="server" for="amount" CssClass="lbltrans"><b>Total Amount</b></asp:Label>
                <asp:TextBox ID="txtamount" runat="server"></asp:TextBox>
                <br /><br /><asp:Button ID="btnadd" runat="server" Text="Order" CssClass="button1" OnClick="btnadd_Click"/>
                    
                     
                     
                     </div>
     
    </div>
        
  

</form>
</body>
</html>

