<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Registration.aspx.cs" Inherits="MobileSystem.Mobile.Student_Registration" %>

<!DOCTYPE html>
<html lang="en">
    <head> 
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

		<!-- Website CSS style -->
		<link rel="stylesheet" type="text/css" href="assets/css/main.css">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
        <style>
            body, html{
     height: 100%;
 	background-repeat: no-repeat;
 	background-color: #d3d3d3;
 	font-family: 'Oxygen', sans-serif;
}

.main{
 	margin-top: 70px;
}

h1.title { 
	font-size: 50px;
	font-family: 'Courier New', cursive; 
	font-weight: 400; 
}

hr{
	width: 10%;
	color: #fff;
}

.form-group{
	margin-bottom: 15px;
}

label{
	margin-bottom: 15px;
}

input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}

.main-login{
 	background-color: #fff;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

}

.main-center{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 330px;
    padding: 40px 40px;

}

.login-button{
	margin-top: 5px;
}

.login-register{
	font-size: 11px;
	text-align: center;
}

        </style>
		<title>Admin</title>
	</head>
	<body>
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title"><b>STUDENT REGISTRATION</b></h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
                    	<form class="form-horizontal" runat="server">
						
						<div class="form-group">
							<label for="txtfname" class="cols-sm-2 control-label">RF-Number</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<!--<input type="text" class="form-control" name="fname" id="fname"  placeholder="Enter your First Name"/>-->
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtfname" placeholder="Enter Rf No. from your identity card" AutoPostBack="true" OnTextChanged="txtfname_TextChanged" />
								</div>
							</div>
						</div>
                        <div class="form-group">
							<label for="txtlname" class="cols-sm-2 control-label">First Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<asp:TextBox runat="server" CssClass="form-control" ID="txtlname" placeholder="Enter your First Name" ReadOnly="True" />
								</div>
							</div>
						</div>

						<div class="form-group">
                            <label for="txtemail" class="cols-sm-2 control-label">Last Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<asp:TextBox runat="server" CssClass="form-control" ID="txtemail" placeholder="Enter your Last Name" ReadOnly="True" />
								</div>
							</div>
						</div>

                            <div class="form-group">
							<label for="txtrfno" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-credit-card" aria-hidden="true"></i></span>
									<asp:TextBox runat="server" CssClass="form-control" ID="txtrfno" placeholder="Enter your email" ReadOnly="True" />
								</div>
							</div>
						</div>

                        <div class="form-group">
							<label for="txtmobile" class="cols-sm-2 control-label">Mobile No.</label>
                           
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-credit-card" aria-hidden="true"></i></span>
									<asp:TextBox runat="server" CssClass="form-control" ID="txtmobile" placeholder="Enter your Mobile No."  ValidationGroup="Validation"  />
                                    
								</div>
							</div>
						</div>


						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<asp:TextBox runat="server" CssClass="form-control" ID="pass_txt" placeholder="Enter your Password" ValidationGroup="Validation" />
								    
								</div>
							</div>
						</div>

						<div class="form-group">
                            <label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<asp:TextBox runat="server" CssClass="form-control" ID="confpass_txt" placeholder="Confirm password"  ValidationGroup="Validation" />

								    

								</div>
							</div>
						</div>

						<div class="form-group ">
							<!--<button type="button" class="btn btn-primary btn-lg btn-block login-button">Preview</button>-->
                            <asp:Button runat="server" ID="btnpreview" CssClass="btn btn-primary btn-lg btn-block login-button" text="Preview" OnClick="btnpreview_Click" ValidationGroup="Validation"/> 
						</div>
						<div class="login-register">
				            <a href="Student_Login.aspx">Login</a>
				         </div>
                            
					</form>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	</body>
</html>
