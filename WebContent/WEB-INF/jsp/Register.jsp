<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>BLOCKS - Bootstrap Dashboard Theme</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="bootstrap.css" rel="stylesheet">
<link href="main.css" rel="stylesheet">
<link href="jquery-ui.css" rel="stylesheet">
<link href="font-style.css" rel="stylesheet">
<link rel="stylesheet" href="register.css">

<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="jquery-ui.js"></script>
<script src="bootstrap.js"></script>

<style type="text/css">
body {
	padding-top: 60px;
}
</style>

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Google Fonts call. Font Used Open Sans & Raleway -->
<link href="http://fonts.googleapis.com/css?family=Raleway:400,300"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet" type="text/css">
<!-- Jquery Validate Script -->
<script type="text/javascript" src="jquery.validate.js"></script>

<!-- Jquery Validate Script - Validation Fields -->
<script type="text/javascript">
		
		
		$().ready(function() {
			$('#form_wrapper').tabs();
			// validate the comment form when it is submitted
			$("#commentForm").validate();
		
			// validate signup form on keyup and submit
			$("#signupForm").validate({
				rules: {
					firstname: "required",
					lastname: "required",
					username: {
						required: true,
						minlength: 1
					},
					password: {
						required: true,
						minlength: 1
					},
					confirm_password: {
						required: true,
						minlength: 2,
						equalTo: "#password"
					},
					email: {
						required: true,
						email: true
					},
					topic: {
						required: "#newsletter:checked",
						minlength: 2
					},
					agree: "required"
				},
				messages: {
					firstname: "Please enter your firstname",
					lastname: "Please enter your lastname",
					username: {
						required: "Please enter a username",
						minlength: "Your username must consist of at least 1 character"
					},
					password: {
						required: "Please provide a password",
						minlength: "Your password must be at least 1 character long"
					},
					confirm_password: {
						required: "Please provide a password",
						minlength: "Your password must be at least 5 characters long",
						equalTo: "Please enter the same password as above"
					},
					email: "Please enter a valid email address",
					agree: "Please accept our policy"
				}
			});
		
			// propose username by combining first- and lastname
			$("#username").focus(function() {
				var firstname = $("#firstname").val();
				var lastname = $("#lastname").val();
				if(firstname && lastname && !this.value) {
					this.value = firstname + "." + lastname;
				}
			});
		
		});
		</script>

		<style>
			.container1{
				border:2px solid;
			}
		</style>
		
		
		<script type="text/javascript">
		
		function clear(){
			document.getElementById("first").value="";
			document.getElementById("last").value="";
			document.getElementById("email").value="";
			document.getElementById("password").value="";
			document.getElementById("user").value="";
		}
		
		
function check(){
			
			var fname = document.getElementById("first").value;
			var lname = document.getElementById("last").value;
			var mail = document.getElementById("email").value;
			var pwd = document.getElementById("password").value;
			var cpwd = document.getElementById("cpass").value;
			var uid = document.getElementById("user").value;

			var namepatt = /^[a-zA-Z0-9]+$/;
			
			
			
			if(fname==""){
				alert("please Enter the First Name");
				return false;
			}
			if(lname==""){
				alert("please Enter the Last Name");
				return false;
			}
			if(uid==""){
				alert("please Enter the User Name");
				return false;
			}
			
			if(!namepatt.test(uid)){
				alert("please Enter alphanumeric data in Name field");
				return false;
			}
			
			if(pwd==""){
				alert("please Enter the Password");
				return false;  
			}
			
			if(pwd.length < 6){
				alert("Entered password should be at least 6 characters");
				return false;
			}
			
			if(cpwd==""){
				alert("please confirm the Password");
				return false;  
			}
			
			if(cpwd!=pwd){
				alert("password do not match");
			}
			
			var emailpatt = /^[a-zA-Z0-9]+[@][a-zA-Z0-9]+[\.][a-zA-Z]+$/;
			if(mail==""){
				alert("please Enter your Email ID");
				return false;  
			}
			
			if(!emailpatt.test(mail)){
				alert("please enter email id in format like abc@xyz.com");
				return false;
			}
			
			alert("Great!!! you can now login...");
			return true;
			
		}
		
		function checklogin(){
			var uname = document.getElementById("uname").value;
			var passw = document.getElementById("pwd").value;

			if(uname==""){
				alert("please Enter the user id");
				return false;
			}
			if(passw==""){
				alert("please Enter the password");
				return false;
			}
			//alert("you are great to go!!");
			return true;
		}
		</script>
		
</head>
<body onload="clear()">

	<!-- NAVIGATION MENU -->

	<div class="navbar-nav navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img src="logo30.png" alt="">
					QuizUp Pro</a>
			</div>
			<div class="navbar-collapse collapse"></div>
			<!--/.nav-collapse -->
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-lg-6"id="leaderboard">
					
					
					
					
					<div class="col-sm-6 col-lg-6">
						<div class="dash-unit">
							<div class="thumbnail">
								<img src="face80x80.jpg" alt="Marcel Newman" class="img-circle">
							</div><!-- /thumbnail -->
							<h1>Sports</h1>
							<hr/>
							<br>
							<h1>Arpit</h1>
							<h1>Amrit</h1>
							<h1>Anuj</h1>
							</div>
					</div>
					
					
					
					<div class="col-sm-6 col-lg-6">
						<div class="dash-unit">
							<div class="thumbnail">
								<img src="face80x80.jpg" alt="Marcel Newman" class="img-circle">
							</div><!-- /thumbnail -->
							<h1>Tech</h1>
							<hr/>
							<br>
							<h1>Shyam</h1>
							<h1>Anmol</h1>
							<h1>APJ</h1>
							</div>
					</div>
					
					
					<div class="col-sm-6 col-lg-6">
						<div class="dash-unit">
							<div class="thumbnail">
								<img src="face80x80.jpg" alt="Marcel Newman" class="img-circle">
							</div><!-- /thumbnail -->
							<h1>Bollywood</h1>
							<hr/>
							<br>
							<h1>Apurav</h1>
							<h1>Amulayam</h1>
							<h1>Ankit</h1>
							</div>
					</div>
					
					
					<div class="col-sm-6 col-lg-6">
						<div class="dash-unit">
							<div class="thumbnail">
								<img src="face80x80.jpg" alt="Marcel Newman" class="img-circle">
							</div><!-- /thumbnail -->
							<h1>Science</h1>
							<hr/>
							<br>
							<h1>Amrit</h1>
							<h1>Anuj</h1>
							<h1>Arpit</h1>
							</div>
					</div>
					
				</div>
			<div class="col-sm-6 col-lg-6">
				<div id="form_wrapper">
				
					<div id="wrapper" class="container1" style="margin-top:20px; border-color:#ffffff;">

  <ul class="nav nav-tabs nav-justified">
    <li class="active"><a href="#register" data-toggle="tab">Register</a></li>
    <li><a href="#login" data-toggle="tab">Login</a></li>
    
  </ul>
  <br>
 

<div class="tab-content">
  <div class="tab-pane active" id="register">
	
<%-- <form:form id="register-form" class="form" action="adduser.htm" commandName="RegisterUser">
							<div class="registration_body">
								<!-- first name -->
								<label for="name" style="color:#ffffff;">First name</label> <form:input path="first_name"
									class="input-huge" type="text" id="first"/>
								<!-- last name -->
								<label for="surname" style="color:#ffffff;">Last name</label> <form:input path="last_name"
									class="input-huge" type="text" id="last"/>
								<!-- username -->
								<label style="color:#ffffff;">Username</label> <form:input path="username" class="input-huge" type="text" id="user" />
								<!-- email -->
								<label style="color:#ffffff;">E-mail</label> <form:input path="email" class="input-huge" type="text" id="email"/>
								<!-- password -->
								<label style="color:#ffffff;">Password</label> <form:input path="password" class="input-huge" type="password" id="password"/>
								<!-- re enter password -->
								<label style="color:#ffffff;">Re-enter Password</label> <input class="input-huge"
									type="text"> 
									
							</div>

							<div class="footer">
								<label class="checkbox inline" style="color:#ffffff;"> <input type="checkbox"
									id="inlineCheckbox1" value="option1"> I agree with the
									terms &amp; conditions
								</label>
								<button type="submit" class="btn btn-success" onclick="return check()">Register</button>
							</div>
						</form:form>		 --%>
						 <form id="register-form" class="form" method="post" action="adduser.htm"  >
		<div class="registration_body">
								<!-- first name -->
								<label  style="color:#ffffff;">First name</label><input class="input-huge" type="text" name="first" id="first"/>
								<label  style="color:#ffffff;">Last name</label><input class="input-huge" type="text" name="last" id="last"/>
								<label  style="color:#ffffff;">Username</label><input class="input-huge" type="text" name="user" id="user"/>
								<label  style="color:#ffffff;">E-mail</label><input class="input-huge" type="text" name="email" id="email"/>
								<label  style="color:#ffffff;">Password</label><input class="input-huge" type="password" name="password" id="password"/>
								<label  style="color:#ffffff;">Re-enter Password</label><input class="input-huge" type="password" name="cpass" id="cpass"/>
	 </div>
  	<div class="footer">
								<label class="checkbox inline" style="color:#ffffff;"> <input type="checkbox"
									id="inlineCheckbox1" value="option1"> I agree with the
									terms &amp; conditions
								</label>
								<button type="submit" class="btn btn-success" onclick="return check()">Register</button>
							</div>
						</form>		
	
	 </div>
  
  <div class="tab-pane " id="login">
	<form id="login-form" class="form" method="post" action="login.htm">
							<div class="registration_body" style="padding-left:20px; padding-right:20px;">
								<!-- username -->
								<label style="color:#ffffff;">Username</label> <input class="input-huge" type="text" name="uname" id="uname">
								<!-- password -->
								<label style="color:#ffffff;">Password</label><br/> <input class="input-huge" type="password" name="pwd" id="pwd">
							</div>

							<div class="footer" align="left" style="padding-left:20px; padding-bottom:20px;">
								<button type="submit" class="btn btn-success" onclick="return checklogin()">Login</button>
							<span style="color: red">${invaliduserlogin }</span>
							</div>
						</form>
  </div>

</div>
</div>
			</div>

		</div>
	</div>

	
</body>
</html>