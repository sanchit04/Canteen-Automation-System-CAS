<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="MobileSystem.Mobile.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <style>
         .container {
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
         h2{
           color:white;
         }
    </style>
</head>
<body>
<form runat="server">
<div class="container">
 <center><h2>Menu Card</h2></center> 
              
  
      <asp:GridView ID="GridView1" runat="server" class="table table-dark table-hover" AutoGenerateColumns="false" >
          <Columns >
                 <asp:BoundField DataField="category" HeaderText="Category" ItemStyle-Width="140" ControlStyle-CssClass="thead-dark" />
    <asp:BoundField DataField="foodname" HeaderText="Food Name" ItemStyle-Width="140" ControlStyle-CssClass="thead-dark"/>
    <asp:BoundField DataField="amount" HeaderText="Amount" ItemStyle-Width="140" ControlStyle-CssClass="thead-dark" />
   
        </Columns>
      </asp:GridView>
    
</div>
</form>
</body>
</html>
