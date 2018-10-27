<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentRegistration.aspx.cs" Inherits="StudentRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>
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
            <asp:TextBox ID="txtfname" runat="server" Class="fname_txt" placeholder="Enter First Name"></asp:TextBox>

            <b><label for="mname" class="mname_label">Middle Name</label></b>
            <asp:TextBox ID="txtmname" runat="server" class="mname_txt" placeholder="Enter Middle Name"></asp:TextBox>
           

            <b><label for="lname" class="lname_label">Last Name</label></b>
            <asp:TextBox ID="txtlname" runat="server" class="lname_txt" placeholder="Enter Last Name"></asp:TextBox>
            

            <b><label for="rfnolabel" class="rfno_label">R.F.Number</label></b>
            <asp:TextBox ID="txtrfno" runat="server" class="rfno_txt" placeholder="Enter R.F.Number"></asp:TextBox>
            

            <b><label for="emaillabel" class="email_label">Email-ID</label></b>
            <asp:TextBox ID="txtemail" runat="server" class="email_txt" placeholder="Enter Email-ID" TextMode="Email"></asp:TextBox>
            

            <b><label for="password" class="pass_label">Password</label></b>
            <asp:TextBox ID="pass_txt" runat="server" class="pass_txt" placeholder="Enter Password" TextMode="Password" ></asp:TextBox>
            

            <b><label for="confpass" class="conf_label">Confirm Password</label></b>
            <asp:TextBox ID="confpass_txt" runat="server" class="conf_txt" placeholder="Enter Confirm Password" TextMode="Password" ></asp:TextBox>
            

            
            <asp:Button ID="btnpreview" runat="server" Text="Preview" class="btn_preview" OnClick="btnpreview_Click"/>
      
    </div>
    </div>
    </form>
</body>
</html>
