<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" %>

<%-- Add content controls here --%>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Report
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
.content{
    text-align:center !important
}
.dropdown1{
    width:200px;
} 
#Label2{
    position:relative;
}
.label{
    position:relative;
}
#Label4{
    color:red;
}
#Label5{
    color:green;
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
        <div class="content">
    <h2>Report</h2><br />
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown1" AutoPostBack="True">
    <asp:ListItem></asp:ListItem>
    <asp:ListItem>Product Report</asp:ListItem>
    <asp:ListItem>Monthly Report</asp:ListItem>
    <asp:ListItem>Yearly Report</asp:ListItem>
        </asp:DropDownList>
        <br /><br />
     
            <asp:Label ID="lbl_fromDate" runat="server" Text="From(Date):"></asp:Label>
            <asp:TextBox ID="txt_fromDate" runat="server" TextMode="Date"></asp:TextBox>
&nbsp;
            <asp:Label ID="lbl_toDate" runat="server" Text="To(Date):"></asp:Label>
            <asp:TextBox ID="txt_toDate" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
        <asp:Label ID="lbl_foodName" runat="server" Text="Enter Food Name:"></asp:Label>
        <asp:TextBox ID="txt_foodName" runat="server" ></asp:TextBox>
        <asp:Label ID="lbl_month" runat="server" Text="Select Month:"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>January</asp:ListItem>
                <asp:ListItem>February</asp:ListItem>
                <asp:ListItem>March</asp:ListItem>
                <asp:ListItem>April</asp:ListItem>
                <asp:ListItem>May</asp:ListItem>
                <asp:ListItem>June</asp:ListItem>
                <asp:ListItem>July</asp:ListItem>
                <asp:ListItem>August</asp:ListItem>
                <asp:ListItem>September</asp:ListItem>
                <asp:ListItem>October</asp:ListItem>
                <asp:ListItem>November</asp:ListItem>
                <asp:ListItem>December</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lbl_year" runat="server" Text="Enter Year:"></asp:Label>
            <asp:DropDownList ID="DropDownList3" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:Button ID="btn_report" runat="server" OnClick="btn_report_Click" Text="Analyze" />
            <br />
            <div>
            <br />
           <mark> <asp:Label ID="Label2" runat="server"  CssClass="label"></asp:Label></mark>
            <br />
           <div> <asp:GridView ID="GridView1" runat="server" CssClass="auto-style3" HorizontalAlign="Center">
            </asp:GridView> 
               <br />
             <mark>  <asp:Label ID="Label3" runat="server"  ></asp:Label></mark>
               <br />
               <asp:GridView ID="GridView2" runat="server" CssClass="auto-style2" HorizontalAlign="Center">
            </asp:GridView></div>
            </div><br />
           <mark> <asp:Label ID="Label6" runat="server" ></asp:Label></mark>
            <br />
            <asp:Label ID="Label1" runat="server" ></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="Label5" runat="server"  ForeColor="Green"></asp:Label>
            <br />
            <br />

    </div> 

    
    <br />

    
</asp:Content>   
