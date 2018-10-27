<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Login.aspx.cs" Inherits="MobileSystem.Mobile.Student_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

.username, .password {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

.button1 {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

.button1:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
    padding-top:10px;
   
   
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}
span.psw1{
    float:right;
    padding-top: 4px;
}

    

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
</style>
     

</head>
<body>

<center><h2>Login Form</h2></center>

<form  runat="server">
  <div class="imgcontainer">
    <img src="Image/person.png" alt="Avatar" class="avatar" />
  </div>

  <div class="container">
    <label for="uname"><b>Username</b></label>
    <!--<input type="text" placeholder="Enter Username" name="uname" />-->
      <asp:TextBox runat="server" Id="txtlabel" placeholder="Enter User-Name" CssClass="username"/>

    <label for="psw"><b>Password</b></label>
   <!-- <input type="password" placeholder="Enter Password" name="psw" />-->
      <asp:TextBox runat="server" Id="txtpassword" placeholder="Enter Password" CssClass="password" TextMode="Password" />

        
  <asp:Button runat="server" ID="btn_submit" CssClass="button1" Text="Login" OnClick="btn_submit_Click1" />
  </div>

  <div class="container" style="background-color:#f1f1f1">
    
    <span class="psw"><a href="ForgotPassword.aspx">Forgot password?</a></span>
<span class="psw1"><a href="Student_Registration.aspx">Not Registered Yet? Register Here.</a></span>
      <br />
      <div class="ex">
         <center> 
             <br />
             <!--<button type="button" class="cancelbtn">Cancel</button></center>-->
              <br />
             <br />
              <asp:Button runat="server" ID="btn_cancel" Text="Back" CssClass="cancelbtn" OnClick="btn_cancel_Click" />
      </div>
  </div>
</form>

</body>
</html>



