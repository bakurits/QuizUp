<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html><head>
    <meta charset="utf-8">
    <title>BLOCKS - Bootstrap Dashboard Theme</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="bootstrap.css" rel="stylesheet">
    <link href="main.css" rel="stylesheet">
    <link href="font-style.css" rel="stylesheet">
    <link rel="stylesheet" href="register.css">

	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>    
    <script src="bootstrap.js"></script>

    <style type="text/css">
      body {
        padding-top: 60px;
      }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
          $('#btn').click(function(){
              var fname=$('#fname').val();
              var lname=$('#lname').val();
              var email=$('#email').val();
              var pwd=$('#pwd').val();
              var rpwd =$('#rpwd').val();
              if(pwd==rpwd)
              {
              if(fname !="" && lname!="" && email!="" && pwd!="")
                {
                $.ajax(
                    {
                    type:'post',
                    cache:false,
                    url:'profileupdate.jsp',
                    data:{'fname':fname,'lname':lname,'email':email,'pwd':pwd}, 
                    success:function(data){
                      alert("Your Profile Updated Successfully");
                    },
                    timeout:100 
                  });
                }
              }
          });
    });
    </script>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
  	<!-- Google Fonts call. Font Used Open Sans & Raleway -->
	<link href="http://fonts.googleapis.com/css?family=Raleway:400,300" rel="stylesheet" type="text/css">
  	<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
  	<script>
  	function check(){
			
		
			var mail = document.getElementById("email").value;
			var pwd = document.getElementById("pwd").value;
			var cpwd = document.getElementById("cpwd").value;
				
			var emailpatt = /^[a-zA-Z0-9\._]+[@][a-zA-Z0-9]+[\.][a-zA-Z]+$/;
			if(mail==""){
				alert("please Enter your Email ID");
				return false;  
			}
			
			if(!emailpatt.test(mail)){
				alert("please enter email id in format like abc@xyz.com");
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
				return false; 
			}
			
		
			
			alert("profile updated...");
			return true;
			
		}
  	</script>
	</head>
  <body>

  	<!-- NAVIGATION MENU -->

    <div class="navbar-nav navbar-inverse navbar-fixed-top">
        <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><img src="logo30.png" alt="">QuizUp Pro</a>
        </div> 
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
					<li><a href="user.htm"><i
							class="icon-home icon-white"></i> Home</a></li>
					<li><a href="viewcat.htm"><i
							class="icon-th icon-white"></i>Take a Quiz</a></li>
					<li><a href="Challenge.htm"><i class="icon-lock icon-white"></i>Challenge</a></li>
					<li><a href="ViewScoreboard.htm"><i class="icon-user icon-white"></i>View Challenges</a></li>
					<li class="active"><a href="ProfileView.htm"><i class="icon-user icon-white"></i>Profile</a></li>
					<li><a href="logout.htm"><i class="icon-user icon-white"></i>Logout</a></li>

            </ul>
          </div><!--/.nav-collapse -->
        </div>
    </div>
<% int user=(Integer)request.getAttribute("userid"); %>
    <div class="container">
        <div class="row">

        	<div class="col-lg-12">
        		
        		<div class="register-info-wraper">
        			<div id="register-info">
        				<div class="cont2">
        					<div class="thumbnail">
								<img src="face.jpg" alt="Marcel Newman" class="img-circle">
							</div><!-- /thumbnail -->
              <h2>${first} ${last} </h2>
        				</div>
        				<div class="row">
        				
        					<div class="col-lg-2">
                  </div>
                  	
                  <div class="col-lg-3">
                  </div>
                  <div class="col-lg-3">
        						<div class="cont3">
        						<form action="insertprof.htm" method="post">
        					        <p><ok>First Name:</ok>${first}<!-- <input class="form-control" id="fname" type="text" placeholder="snapdeal"> --></p>
                          <p><ok>Last Name:</ok>${last}<!-- <input class="form-control" id="lname" type="text" placeholder="snapdeal"> --></p>
                          <p><ok>Username:</ok>${username}<!-- <input class="form-control" id="username" type="text" placeholder="snapdeal"> --></p>
            							<p><ok>Mail:</ok><input class="form-control" id="email" name="email" type="email" value="${email }"  ></p>
            					    <p><ok>Password:</ok><input class="form-control" id="pwd" name="password" type="password" value="${password }" ></p>
                          <p><ok>Re-Enter Password:</ok><input class="form-control" id="cpwd" type="password" value="${password }" ></p>
                          <input type="hidden" value="<%= user %>" name="userid">
                          
                          <p><button class="btn btn-success" id="btn" onclick="return check()">Save</button></p>
                          </form>
                    </div>
        					</div>
        				</div><!-- /inner row -->
						<hr>
						       				
        			</div>
        		</div>

        	</div>
         </div>

        </div>
    </div>

	<div id="footerwrap">
      	<footer class="clearfix"></footer>
      	<div class="container">
      		<div class="row">
      			<div class="col-sm-12 col-lg-12">
      			<p><img src="logo.png" alt=""></p>
      			<p>Blocks Dashboard Theme - Crafted With Love - Copyright 2013</p>
      			</div>

      		</div><!-- /row -->
      	</div><!-- /container -->		
	</div><!-- /footerwrap -->  
</body></html>