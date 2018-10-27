<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order_Confirm.aspx.cs" Inherits="MobileSystem.Mobile.Order_Confirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" lang="en">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  
    
<script type="text/javascript">  

    function DeleteConfirm() {
        var Ans = confirm("Do you really want to remove this item?");
        if (Ans) {
            return true;
        }
        else {
            return false;
        }
      
        
    }  
</script>  
<style>
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
   .btn-space {
    margin-right: 5px;
}
   .nospace{
       margin:0;
   }
    .auto-style2 {
        width: 625px;
    }
    .auto-style3 {
        width: 539px;
    }
    .highlighted 
  {
     border:none;
     
  }
    .auto-style4 {
      
        text-align:right;
        width: 666px;
    }
    
    </style>
</head>

    
 <body>
    <form id="form1" runat="server">
        <input type="hidden" runat="server" id="key" name="key" value="rjQUPktU" />
      <input type="hidden" runat="server" id="hash" name="hash"  />
            <input type="hidden" runat="server" id="txnid" name="txnid" />
        <input type="hidden" runat="server" id="salt" name="salt" value="e5iIg1jwi8" />
<div class="container">

	<h1>Food Cart</h1><hr>
	
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  CssClass="table table-striped table-bordered table-hover " style="margin-bottom: 1px">
        <Columns>
             
    <asp:BoundField DataField="Food_Name" HeaderText="Name" ItemStyle-Width="140" />
    <asp:BoundField DataField="Quantity" HeaderText="Quantiy" ItemStyle-Width="140" />
    <asp:BoundField DataField="Unit_Price" HeaderText="Unit Price" ItemStyle-Width="140" />
    <asp:BoundField DataField="Total_Price" HeaderText="Total Price" ItemStyle-Width="140" />
   <asp:BoundField DataField="Transaction_Id" HeaderText="Trans. Id" ItemStyle-Width="140"  />
    <asp:TemplateField ItemStyle-Width="140">  
                    <ItemTemplate >  
                        
                        <asp:CheckBox ID="chkDel" runat="server"  CssClass="pull-right"  />  
                    </ItemTemplate>  
                </asp:TemplateField> 

</Columns>
</asp:GridView>
    <table class="table table-hover table-bordered " style="margin-bottom: 1px">
        <tbody>
            <tr>
                <th  class="auto-style4"><span class="pull-right"><strong>
                    <asp:Label ID="Label1" runat="server" Text="TOTAL:" ></asp:Label></strong></span></th>
                <th><strong>
               
                    <asp:Label ID="lbl_total" runat="server"  ></asp:Label>
                    </strong></th>
            </tr>
        </tbody>
        
        
    </table>
<table class="table table-striped table-hover table-bordered ">
      <tbody>
        
        <tr>
           <td class="auto-style3"><asp:Button ID="Button1" runat="server" Text="More?" CssClass="btn btn-primary" OnClick="Button1_Click" /></td>
           <td><asp:Button ID="btnDeleteRecord" runat="server" Text="X REMOVE" CssClass="pull-right btn-danger btn" OnClick="btnDeleteRecord_Click" Font-Bold="true" /></td>
            <td class="auto-style2"> <asp:Button ID="btn_submit" runat="server" Text="Checkout" CssClass="pull-right btn btn-success " OnClick="btn_submit_Click" /></td>
            
            </tr> 
          </tbody>
    </table>
     </div>
    
        </form>
</body>
</html>
