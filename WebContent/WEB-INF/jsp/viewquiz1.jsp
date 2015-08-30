<%@page import="com.entity.QuestionBank"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<meta charset="utf-8">
<title>BLOCKS - Bootstrap Dashboard Theme</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Carlos Alvarez - Alvarez.is">

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- Le styles -->

<link href="login.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link href="main.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 30px;
}

pbfooter {
	position: relative;
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
		
		$.validator.setDefaults({
			submitHandler: function() { window.open ('dashboard.html','_self',false) }
		});
		
		$().ready(function() {
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
		
			//code to hide topic selection, disable for demo
			var newsletter = $("#newsletter");
			// newsletter topics are optional, hide at first
			var inital = newsletter.is(":checked");
			var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
			var topicInputs = topics.find("input").attr("disabled", !inital);
			// show when newsletter is checked
			newsletter.click(function() {
				topics[this.checked ? "removeClass" : "addClass"]("gray");
				topicInputs.attr("disabled", !this.checked);
			});
		});
		
		$(function() {
       var cd = $('#countdown');
       var c = parseInt(cd.text(),10);
       var interv = setInterval(function() {
           c--;
           cd.html(c);
           if (c == 0) {
               window.location.reload(false);
               clearInterval(interv);
           }
       }, 1000);
   });
		</script>

</head>

<style>
.pbfooter {
	position: relative;
}

.navbar-header {
	height: 60px;
}

.container1{
	margin-top: 100px;
	margin-right: 50px;
}
</style>




<body bgcolor="#e3e3e3">

	<!-- NAVIGATION MENU -->

	<div class="navbar-nav navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header"  style="width: 150px">
				
			<a class="navbar-brand" href="#" style="padding:0;padding-top:15px;width:200px;">
				<span style="inline"><img src="logo30.png"alt=""/> QuizUp Pro</span></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="user.htm"><i
							class="icon-home icon-white"></i> Home</a></li>
					<li><a href="viewcat.htm"><i
							class="icon-th icon-white"></i>Take a Quiz</a></li>
					<li><a href="Challenge.htm"><i class="icon-lock icon-white"></i>Challenge</a></li>
					<li><a href="ViewScoreboard.htm"><i class="icon-user icon-white"></i>View Challenges</a></li>
					<li><a href="ProfileView.htm"><i class="icon-user icon-white"></i>Profile</a></li>
					<li><a href="logout.htm"><i class="icon-user icon-white"></i>Logout</a></li>
				
				
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>

<div class="container"  align="center" >
	<div class="panel panel-default" style="margin-top: 100px;width: 800px; ">
      <div class="panel-heading">Taking Question</div>
    

  
	
	<%
int i=0;

%>
<%
ArrayList<QuestionBank> list=new ArrayList<QuestionBank>();
if(session.getAttribute("elist")!=null)
{
	list=(ArrayList<QuestionBank>)session.getAttribute("elist");
	
%>
<form method="post" action="viewscore.htm">


<%
	for(QuestionBank qb:list)
	{
%>
<div class="panel panel-primary" style="margin-top: 30px;width: 600px; height:200px; ">
      <div class="panel-heading">Question <%=++i %></div>
		<p align="left" style="margin-left:10px; margin-right:10px;"><%= qb.getQuestion().toString() %></p>
		<div class="col-sm-6" style="padding-left:10px;"> 
			<div class="radio">
			<label><input type="radio" name="<%= qb.getQues_id() %>" value="1"><%= qb.getOption1().toString() %></label>
			</div>
		</div>
		<div class="col-sm-6" style="padding-left:10px;"> 
			<div class="radio">
			<label><input type="radio" name="<%= qb.getQues_id() %>" value="2"><%= qb.getOption2().toString() %></label>
			</div>
		</div>
		<div class="col-sm-6" style="padding-left:10px;" > 
			<div class="radio">
			<label><input type="radio" name="<%= qb.getQues_id() %>" value="3"><%= qb.getOption3().toString() %></label>
			</div>
		</div>
		<div class="col-sm-6" style="padding-left:10px;"> 
			<div class="radio">
			<label><input type="radio" name="<%= qb.getQues_id() %>" value="4"><%= qb.getOption4().toString() %></label>
			</div>
		</div>
		
	  
	  
	</div>


<%		
	}
}
%>




    <div class="panel-body">
		<div class="col-sm-offset-2 col-sm-8" align="center">
			<button type="submit" class="btn btn-primary">Complete Quiz</button>
		</div>
	</div>
</div>
</div>


</form> 


	<script type="text/javascript" src="bootstrap.js"></script>


</body>
</html>
</body>
</html>