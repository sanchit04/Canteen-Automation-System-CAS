<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="MobileSystem.Mobile.StudentLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login</title>
    <link href="Styles/main1.css" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
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
                      <input type="text" class="login_un" id="txtlabel" name="username" placeholder="Enter Email-ID" />
                      <div style="position:relative; z-index:1;" id="layer2">
                       <div class="form_pass">
                      <b><label for="pass" class="label_pass">Password</label></b>
                           <br />
                       <input type="password" class="pass_un" id="txtpassword" name="password" placeholder="Enter password" />       
                                                
                                 <asp:Button ID="btnlogin" runat="server" Text="Login" class="btn_login" />
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
