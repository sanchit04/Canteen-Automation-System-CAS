<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Stafflogin.aspx.cs" Inherits="Stafflogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="refresh" content="10">
    <title></title>
<script type="text/javascript">  

        function DeleteConfirm() 
        {  
            var Ans = confirm("Are you sure the order is ready?");  
            if (Ans)
            {  
                return true;  
            }  
            else 
            {  
                return false;  
            }  
        }  
</script>  
    <style>
        .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}



.button2 {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
    text-align:center;
}

.button2:hover {
    background-color: #008CBA;
    color: white;
}

       body  {
        background-image: url('Image/spoon.jpg');
       
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
         <center>   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4">  
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:CheckBox ID="chkDel" runat="server" />  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:BoundField DataField="Transaction_Id" HeaderText="Transaction Id" />  
                <asp:BoundField DataField="Username" HeaderText="Username" />  
                <asp:BoundField DataField="Food_Name" HeaderText="Food Name" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="Date" HeaderText="Date" />  
                <asp:BoundField DataField="rfnumber" HeaderText="ID" />
            </Columns>  
           <HeaderStyle BackColor="Black" ForeColor="#ffffff" />  
            <RowStyle BackColor="white" /> 
        </asp:GridView> </center>
        <br />  
      <center>  <asp:Button ID="btnDeleteRecord" runat="server" BackColor="#E7CEB6" Height="55px" OnClick="btnDeleteRecord_Click" Text="READY" Width="128px" CssClass="button button2" /> </center> 
        <br /> 
            
        </div>
    </form>
</body>
</html>
