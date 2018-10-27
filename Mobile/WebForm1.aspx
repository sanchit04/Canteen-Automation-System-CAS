<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MobileSystem.Mobile.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Food</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
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

        body {
            font-family: Arial, Helvetica, sans-serif;
        }

    .auto-style1 {
        position: relative;
      background:  #fff url("Image/food.jpg") center center;
     background-image: linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),url("Image/food.jpg");   
     width: 100%;
        height: 850px;
        background-size: cover;
        overflow: hidden;
        left: 0px;
        top: 0px;
    }

    .header {
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

        label.lbltrans {
        color:white;
        font-size:18px;
        }

        .radio {
        color:white;
        font-size:18px;
        padding:10px;
        }

        .drop {
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
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1"> 
           <div class="header">
            <center><h2>Order Food</h2></center> 
            </div> 
            <div class="container">
                 <label for="transid" class="lbltrans"><b>Transaction ID</b></label>
                <asp:TextBox ID="txttransid" runat="server" ></asp:TextBox>

                <label for="username" class="lbltrans"><b>Username</b></label>
                <asp:TextBox ID="txtusername" runat="server" placeholder="Enter Username"></asp:TextBox>

                <label for="date" class="lbltrans"><b>Date</b></label>
                <asp:TextBox ID="txtdate" runat="server" ></asp:TextBox>

                <label for="time" class="lbltrans"><b>Time</b></label>
                <asp:TextBox ID="txttime" runat="server"></asp:TextBox>

                <label for="combo" class="lbltrans"><b>Combo Pack</b></label>
                <asp:RadioButtonList ID="RadioButtonList1" RepeatLayout="Flow" RepeatDirection="Horizontal" class="radio" runat="server" AutoPostBack="True" >
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                 </asp:RadioButtonList>

                <br /><br /><label for="category" class="lbltrans"><b>Category</b></label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="drop" AutoPostBack="True">
                    <asp:ListItem Value="1">Starter</asp:ListItem>
                    <asp:ListItem Value="2">Breakfast</asp:ListItem>
                    <asp:ListItem Value="3">Lunch</asp:ListItem>
                 </asp:DropDownList>

                <br /><br /><label for="foodname" class="lbltrans"><b>Food Name</b></label>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="drop" AutoPostBack="True">
                    <asp:ListItem Value="1">Dal Rice</asp:ListItem>
                    <asp:ListItem Value="2">Pav Bhaji</asp:ListItem>
                    <asp:ListItem Value="3">Masala Dosa</asp:ListItem>
                 </asp:DropDownList>

                <br /><br /><label for="quantity" class="lbltrans"><b>Quantity</b></label>
                <asp:TextBox ID="txtquantity" runat="server" placeholder="Enter Quantity"></asp:TextBox>

                <br /><label for="amount" class="lbltrans"><b>Total Amount</b></label>
                <asp:TextBox ID="txtamount" runat="server"></asp:TextBox>

               <br /><br /><asp:Button ID="btnadd" runat="server" Text="Order" CssClass="button1"/>
            </div>
        </div>  
    
        
  

</form>
</body>
</html>

