<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentLogin.aspx.cs" Inherits="StudentLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Student Login </title>
    <link href="Styles/main1.css" rel="stylesheet" />
    
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
          <div class="login_box">
              <img src="/Image/person.png" class="person" />
              <br />
              <br />
              <h1>Login Form</h1>
              <div style="position:relative; z-index:1;" id="layer1">
                  
                      <b><label for="uname" class="login_label">Email-ID</label></b>
                     
                  <asp:TextBox ID="txtlabel" class="login_un" runat="server" placeholder="Enter Email-ID"></asp:TextBox>
                      <div style="position:relative; z-index:1;" id="layer2">
                       <div class="form_pass">
                      <b><label for="pass" class="label_pass">Password</label></b>
                           <br />
                             
                           <asp:TextBox ID="txtpassword" class="pass_un" runat="server" placeholder="Enter password" TextMode="Password"></asp:TextBox>               
                                 <asp:Button ID="btnlogin" runat="server" Text="Login" class="btn_login" OnClick="btnlogin_Click"/>
                           <div class="modal_body">
                           <a href="ForgotPassword.aspx">Forgotten password? </a>
                               <div class="regi">
                           <a href="StudentRegistration.aspx">Not Registered Yet? Register Here.</a>
                             </div>
                       </div> 
                       </div>
                  </div>    
                </div>
           </div>
            </div>
    </form>    
    
   
</body>
</html>
