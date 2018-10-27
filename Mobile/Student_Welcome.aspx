<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Welcome.aspx.cs" Inherits="MobileSystem.Mobile.Student_Welcome" %>

<!DOCTYPE html lang="en">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    <title>Welcome Student</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="/Mobile/Styles/bootstrap.min.css">
    <!-- Font Awesome and Pixeden Icon Stroke icon fonts-->
    <link rel="stylesheet" href="/Mobile/Styles/font-awesome.min.css">
    <link rel="stylesheet" href="/Mobile/Styles/pe-icon-7-stroke.css">
    <!-- Google fonts - Roboto-->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,700">
    <!-- lightbox-->
    <link rel="stylesheet" href="/Mobile/Styles/lightbox.min.css">
    <!-- theme stylesheet-->                                       
    <link rel="stylesheet" href="/Mobile/Styles/style.default.css" >
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="/Mobile/Styles/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="/Mobile/Image/favicon.png">
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
</head>
<body>
    <form runat="server">
     <header class="header">
      <div role="navigation" class="navbar navbar-default">
        <div class="container">
          <div class="navbar-header"><a href="index.html" class="navbar-brand">Ruparel Canteen</a>
            <div class="navbar-buttons">
              <button type="button" data-toggle="collapse" data-target=".navbar-collapse" class="navbar-toggle navbar-btn">Menu<i class="fa fa-align-justify"></i></button>
            </div>
          </div>
          <div id="navigation" class="collapse navbar-collapse navbar-right">
            <ul class="nav navbar-nav">
              <li class="active"><a href="index.html">Home</a></li>
              <li><a href="Order.aspx">Order Now</a></li>
              <li class="dropdown"><a href="#" >Menu Card</a>

              </li>
              <li><a href="contact.html">Contact</a></li>
            </ul>
              <!--<a href="Student_Login.aspx" data-toggle="modal" data-target="#login-modal" class="btn navbar-btn btn-ghost"><i class="fa fa-sign-in"></i>Log Out</a>-->
              <asp:Button runat="server" data-toggle="modal" data-target="#login-modal" CssClass="btn navbar-btn btn-ghost" Text="Log Out" ID="btn_logout" OnClick="btn_logout_Click" />
          </div>
        </div>
      </div>
    </header>
    
   
   <!-- <div class="jumbotron main-jumbotron">
      <div class="container">
        <div class="content">
          <p class="margin-bottom">Hungry?? <br/>Lets Order Something!</p>
          <p><a href="Order.aspx" class="btn btn-white">Order Now</a></p>
        </div>
          <h1>Welcome User!</h1>
      </div>
    </div>-->
        <div class="container">
  <h2>Carousel Example</h2> 
            <marquee behavior="left" bgcolor="yellow" direction="left" height="30px" onmouseout="this.start();" onmouseover="this.stop();" class="auto-style4"> 
                <a href="#" style="text-decoration:none"><font color="black" size="3">Eco-friendly initiatives</font></a> <font size="5"><b>|</b></font> 
                <a href="#" style="text-decoration:none"><font color="black" size="3">Sant Gadge Maharaj Award for Clean and Green Campus</font></a> <font size="5"><b>|</b></font> 
                <a href="#" style="text-decoration:none"><font color="black" size="3">Sport facilities-basketball court,kho kho ground,rifle shooting range and others</font></a> <font size="5"><b>|</b></font>
                <a href="http://www.ruparel.edu/uploads/gallery/1/documents/naac-cycle-3-certificate-pdfnaac-cycle-3-certificate58fadc78461f5-original.pdf" style="text-decoration:none"><font color="black" size="3">Reaccredited with Grade A (CGPA of 3.21) by NAAC on 22nd February 2017</font></a> <font size="5"><b>|</b></font> 
                <a href="#" style="text-decoration:none"><font color="black" size="3">Best College Award 2007-2008-University of Mumbai</font></a> <font size="5"><b>|</b></font>
                <a href="https://tinyurl.com/RuparelStudySkills" style="text-decoration:none"><font color="black" size="3">I want to evaluate my Self Study Skills</font></a> <font size="5"><b>|</b></font> 
                <a href="http://www.fyjcmumbai.com/" style="text-decoration:none"><font color="black" size="3">First Year Junior College</font></a> <font size="5"><b>|</b></font> 
                <a href="http://www.ruparel.edu/uploads/gallery/1/documents/degree-admission-schedule-2017-18-pdfdegree-admission-schedule-2017-185930e2d8566b4-original.pdf" style="text-decoration:none"><font color="black" size="3">Schedule for First Year Admissions to Degree Courses 2017-2018</font></a> <font size="5"><b>|</b></font> 
                <a href="http://ruparel.edu/gallery/" style="text-decoration:none"><font color="black" size="3">Click on Gallery to see latest event Photographs</font></a> <font size="5"><b>|</b></font> 
                <a href="#" style="text-decoration:none"><font color="black" size="3">SSR 3rd Cycle </font></a><font size="5"><b>|</b></font>
            </marquee>
 
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
           
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="Image/food.jpg" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="chicago.jpg" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="ny.jpg" alt="New york" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
       
  </div>
            <marquee behavior="left" bgcolor="#33CCFF" direction="left" height="30px" onmouseout="this.start();" onmouseover="this.stop();" class="auto-style5"> 
            <a href="http://www.ruparel.edu/uploads/gallery/1/documents/fybms-3-pdffybms-35957847734134-original.pdf" style="text-decoration:none"><font color="black" size="3"><strong>F.Y.B.M.S. Admission 2017-18 3rd Merit cutoff list</strong></font></a> <font size="5"><b>|</b></font> 
            <a href="http://www.ruparel.edu/uploads/gallery/1/documents/fybsc-comp-sci-3-pdffybsc-comp-sci-35957847a059f1-original.pdf" style="text-decoration:none"><font color="black" size="3"><strong>F.Y.B.Sc. (Computer Science)Admission 2017-18  3rd  Merit cutoff merit List</strong></font></a><font size="5"><b>|</b></font> 
            <a href="http://www.ruparel.edu/uploads/gallery/1/documents/fybsc-it-3-pdffybsc-it-35957847ae7541-original.pdf" style="text-decoration:none"><font color="black" size="3"><strong>F.Y.B.Sc. (I.T.)  Admission 2017-18  3rd Merit Cutoff List</strong></font></a> <font size="5"><b>|</b></font>  
            <a href="http://www.ruparel.edu/uploads/gallery/1/documents/fybcom-3-pdffybcom-359578476efcba-original.pdf" style="text-decoration:none"><font color="black" size="3"><strong>F.Y.B.Com. Admission 2017-18 3rd Merit Cutoff List</strong></font></a> <font size="5"><b>|</b></font>
            <a href="http://www.ruparel.edu/uploads/gallery/1/documents/fybsc-3-pdffybsc-359578479bb30a-original.pdf" style="text-decoration:none"><font color="black" size="3"><strong>F.Y.B.Sc. Admission 2017-18 3rd Merit cutoff list</strong></font></a> <font size="5"><b>|</b></font>
            <a href="http://www.ruparel.edu/uploads/gallery/1/documents/fyba-3-pdffyba-35957847664569-original.pdf" style="text-decoration:none"><font color="black" size="3"><strong>F.Y.B.A. Admissions 2017-18 3rd  Merit cutoff list</strong></font></a> <font size="5"><b>|</b></font> 
             
             </marquee>
       
</div>
        

   <section>
      <div class="container">
        <h2>About Ruparel College Canteen</h2>
        <p class="lead">The College Canteen is located in the Gymkhana Building. It provides a variety of freshly prepared food items to the students at a reasonable price. The Canteen is well-equipped with proper seating arrangement indoors as well as an outdoor section which is used when required.</p>
        <p>An extension counter of the Canteen has been set up in the Faculty Common Room for the convenience of faculty members.</p>
        
      </div>
    </section>
     <!-- Javascript files-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.cookie.js"> </script>
    <script src="/js/lightbox.min.js"></script>
    <script src="/js/front.js"></script>
    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID.-->
    <!---->
   <!-- <script>
      (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
      function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
      e=o.createElement(i);r=o.getElementsByTagName(i)[0];
      e.src='//www.google-analytics.com/analytics.js';
      r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
      ga('create','UA-XXXXX-X');ga('send','pageview');
    </script>-->
</form>
    </body>
</html>
