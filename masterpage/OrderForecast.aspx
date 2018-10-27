<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderForecast.aspx.cs" Inherits="OrderForecast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Order Forecasting
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style>
.dropbtn {
    background-color: rgb(10, 110, 178);
    color: white;
    padding: 12px;
    font-size: 13px;
    font-weight: bold;
    border: none;
    border-radius: 5px 5px 5px 5px;
    height: 40px;
    width: 100%;
   
}

.dropdown {
    position: relative;
    display: inline-block;
    float:left;
    
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 100px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ddd}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: rgb(14, 79, 114);
}



.forecast {
text-align: center;
    font-size: 17px;        
}
.label{
    font-size:large;
}


</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" Runat="Server">
    
    <div class="dropdown">
  <button class="dropbtn">Add Details</button>
  <div class="dropdown-content">
    <a href="InventoryDetails.aspx">Inventory Details</a>
    <a href="AddFood.aspx">Add Food</a>
    <a href="AddOffers.aspx">Add Offers</a>
  </div>
</div>
    
    <div class="Menu">
        <ul>
                      
                     <li><a href="RemoveFood.aspx">Remove Food</a></li>  
                    <li><a href="UpdateDetails.aspx">Update Inventory Details</a></li>
                    
                    <li><a href="OrderForecast.aspx">Order Forecasting</a></li>
                    <li><a href="Report.aspx">Report</a></li>
                    <li><a href="Logout.aspx">Logout</a></li>
        </ul>
    </div>
    <div class="forecast">
    <h2>Order Forecasting</h2><br />
    </div> 
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbltime" runat="server" Text="From Time:" Font-Size="Medium"></asp:Label>
    <asp:TextBox ID="txtfromtime" runat="server" TextMode="Time" OnTextChanged="txtfromtime_TextChanged"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbltotime" runat="server" Text="To Time:" Font-Size="Medium"></asp:Label>
    <asp:TextBox ID="txttotime" runat="server" TextMode="Time"></asp:TextBox>
    <br />
    <br />
    <br />
    <br />
    <center><asp:Button ID="btnpredict" runat="server" Text="Predict" Height="35px" Width="70px" OnClick="btnpredict_Click"/>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
    <asp:Label ID="Label1" runat="server" Text="TOTAL PRICE:" CssClass="label"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Label" CssClass="label"></asp:Label>
        <br />
        <br />
        <br />
    </center>
</asp:Content>    
