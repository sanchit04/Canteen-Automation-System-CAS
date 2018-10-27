<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PagePreview.aspx.cs" Inherits="PagePreview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Preview Page</title>
    <link href="Styles/main2.css" rel="stylesheet" />
</head>
<body style="background-image:linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)),url('Image/back3.jpg')">
    <form id="form1" runat="server">
        <center>    
            <br />
            <br />
            <br />
            <br />
         <div class="Panel"></div>
        </center>
    <div>
    <h1>Registration</h1>
        <div style="position:relative; z-index:1;" id="layer1">
            <b><label for="fname" class="fname_label">First Name</label></b>
            <asp:TextBox ID="pre_txtfname" runat="server" Class="fname_txt" ReadOnly="true" placeholder="Enter First Name"></asp:TextBox>

            <b><label for="mname" class="mname_label">Middle Name</label></b>
            <asp:TextBox ID="pre_txtmname" runat="server" class="mname_txt" ReadOnly="true" placeholder="Enter Middle Name"></asp:TextBox>
           

            <b><label for="lname" class="lname_label">Last Name</label></b>
            <asp:TextBox ID="pre_txtlname" runat="server" class="lname_txt" ReadOnly="true" placeholder="Enter Last Name"></asp:TextBox>
            

            <b><label for="rfnolabel" class="rfno_label">R.F.Number</label></b>
            <asp:TextBox ID="pre_txtrfno" runat="server" class="rfno_txt" ReadOnly="true" placeholder="Enter R.F.Number"></asp:TextBox>
            

            <b><label for="emaillabel" class="email_label">Email-ID</label></b>
            <asp:TextBox ID="pre_txtemail" runat="server" class="email_txt" ReadOnly="true" placeholder="Enter Email-ID" TextMode="Email"></asp:TextBox>
            

            <b><label for="password" class="pass_label">Password</label></b>
            <asp:TextBox ID="pre_pass_txt" runat="server" class="pass_txt" ReadOnly="true" placeholder="Enter Password" ></asp:TextBox>
            

            <b><label for="confpass" class="conf_label">Confirm Password</label></b>
            <asp:TextBox ID="pre_confpass_txt" runat="server" class="conf_txt" ReadOnly="true" placeholder="Enter Confirm Password"></asp:TextBox>

            <asp:Button ID="btnedit" runat="server" Text="Edit" class="btn_edit" OnClick="btnedit_Click"/>
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn_submit" OnClick="btnsubmit_Click"/>
            
    </div>
    </form>
</body>
</html>
