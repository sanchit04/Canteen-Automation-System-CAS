<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="MobileSystem.Mobile.Feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Feedback Page</title>
    <style>
* {
    box-sizing: border-box;
}

        body {
        background-color:#33CCFF;
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



.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}


.button2 {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
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
         <h2><center>Feedback Form</center></h2>
<p><b>Please help us to serve you better by taking a couple of minutes.</b></p>

<div class="container">
 
    <div class="row">
      <div class="col-25">
        <label for="fname">Username</label>
      </div>
      <div class="col-75">
          <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter your name here..."></asp:TextBox>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">How satisfied were you with our product/service?</label>
      </div>
      <div class="col-75">
          <asp:RadioButtonList ID="RadioButtonList1" runat="server">
              <asp:ListItem>Excellent</asp:ListItem>
              <asp:ListItem>Good</asp:ListItem>
              <asp:ListItem>Neutral</asp:ListItem>
              <asp:ListItem>Poor</asp:ListItem>
          </asp:RadioButtonList>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
      
      </div>
      <div class="col-75">
       
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="subject">If you have specific feedback,please write to us..</label>
      </div>
      <div class="col-75">
        <textarea id="subject" name="subject" runat="server" placeholder="Additional comments" style="height:200px"></textarea>
      </div>
    </div>
    <br />
    <div class="row">
        <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="button button2" OnClick="btnsubmit_Click"/>
    </div>
  
</div>
</div>
   
   </form>
</body>
</html>

