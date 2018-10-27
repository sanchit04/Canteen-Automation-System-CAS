<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Succesfull.aspx.cs" Inherits="MobileSystem.Mobile.Succesfull" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Successful Page</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
* {
    box-sizing: border-box;
}

/* Style the body */
body {
    font-family: Arial;
    margin: 0;
}

/* Header/logo Title */
.header {
    padding: 40px;
    text-align: center;
    background: #33CCFF;
    color: white;
    
}

/* Increase the font size of the heading */
.header h1 {
    font-size: 40px;
}




/* Column container */


/* Create two unequal columns that sits next to each other */
/* Sidebar/left column */
.side {
    -ms-flex: 30%; /* IE10 */
    flex: 30%;
    background-color: #f1f1f1;
    padding: 20px;
}

/* Main column */
.main {   
    -ms-flex: 70%; /* IE10 */
    flex: 70%;
    background-color: white;
    padding: 20px;
}

/* Fake image, just for this example */
.fakeimg {
    background-color: #aaa;
    width: 100%;
    padding: 20px;
}

/* Footer */
.footer {
    padding: 20px;
    text-align: center;
    background: #ddd;
    height: 320px;
}

.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
            height: 274px;
        }

.button {
    background-color: #33CCFF; 
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}



.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

/* Responsive layout - when the screen is less than 700px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 700px) {
    .row {   
        flex-direction: column;
    }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
    .navbar a {
        float: none;
        width: 100%;
    }
}
</style>
</head>
<body>
    <form id="form1" runat="server">
   <div class="header">
  <h1>Canteen Automation System</h1>
  <p><b>D. G. Ruparel College of Arts, Science and Commerce</b></p>
  </div>
   
    <div class="footer">
      <div class="container">
          <h2>Order Successful</h2>
          <p>Congratulations!! Your order has been confirmed, delivery has been initiated. Thank you for using our service! A notification message has been sent to you via email.<br />
              <mark>Once the order is ready you will be notified by a text message on your mobile.Keep Checking!</mark>
          </p>
            <asp:GridView ID="GridView1" runat="server" Visible="false"></asp:GridView>
 <asp:Button ID="btnhome" runat="server" Text="Back to Home Page" CssClass="button button2" OnClick="btnhome_Click"/> 
      </div>
    </div>
        </form>
</body>
</html>
