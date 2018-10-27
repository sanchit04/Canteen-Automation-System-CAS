<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="MobileSystem.Mobile.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Forgot Password</title>
        <style>
* {
    box-sizing: border-box;
}

       
input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

label {
    padding: 12px 12px 12px 0;
    display: inline-block;
    
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
    padding-top:10px;
   
   }



.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
   
}

.col-25 {
    float: left;
    width: 25%;
    margin-top: 6px;
    
}

.col-75 {
    float: left;
    width: 75%;
    margin-top: 6px;
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

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}


/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
    .col-25, .col-75, input[type=submit] {
        width: 100%;
        margin-top: 0;
    }
}



</style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2><center>Forgot password</center></h2>
           
             <div class="imgcontainer">
    <img src="Image/password1.png" alt="Avatar" class="avatar" />
  </div>
           <div class="container">
       <p><center>Enter your username in the given textbox and we will mail you your password.</center></p>
    <div class="row">
      <div class="col-25">
        <b><label for="fname">Username</label></b>
      </div>
      <div class="col-75">
          <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter your name here..."></asp:TextBox>
      </div>
    </div>
               <br />
                <div class="row">
       <asp:Button runat="server" ID="btn_submit" CssClass="button1" Text="Forgot password" OnClick="btn_submit_Click"  />
    </div>
               <br />
                <asp:Button runat="server" ID="btn_cancel" Text="Back" CssClass="cancelbtn"  />
        </div>
    </form>
</body>
</html>
