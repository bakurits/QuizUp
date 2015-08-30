<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<script src="bootstrap3-dialog/src/js/bootstrap-dialog.js"></script>
<link href="bootstrap3-dialog/src/css/bootstrap-dialog.css" rel="stylesheet" type="text/css"/>


  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link href="assets/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<script src="bootstrap3-dialog/src/js/bootstrap-dialog.js"></script>
<link href="bootstrap3-dialog/src/css/bootstrap-dialog.css" rel="stylesheet" type="text/css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- Le styles -->

<link href="login.css" rel="stylesheet">
<script src="js/bootstrap.min.js">
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
	<link href="assets/bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
	<script src="bootstrap3-dialog/src/js/bootstrap-dialog.js"></script>
<link href="bootstrap3-dialog/src/css/bootstrap-dialog.css" rel="stylesheet" type="text/css"/>
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
		
		function showScoreDialogue(){
			
			 BootstrapDialog.show({
            title: 'Your performance',
            message: 'Click buttons below.',
            buttons: [{
                label: 'HomePage',
                action: function(dialog) {
                    window.open("file:///C:/Users/apoorv.singh/Desktop/Theme-SinglePageAdmin/User_Console.html","_self");
                }
            }, {
                label: 'Take Another Quiz',
                action: function(dialog) {
                    window.open("file:///C:/Users/apoorv.singh/Desktop/Theme-SinglePageAdmin/TakeQuiz.html","_self");
                }
            }]
        });
		
		}
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
<body>
<!-- NAVIGATION MENU -->

	<div class="navbar-nav navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header"  style="width: 150px">
				
			<a class="navbar-brand" href="#" style="padding:0;padding-top:15px;width:200px;">
				<span style="inline"><img src="logo30.png"alt=""/> QuizUp Pro</span></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="home.htm"><i
							class="icon-home icon-white"></i> Home</a></li>
					<li><a href="addQues.htm"><i
							class="icon-th icon-white"></i>Add a Question</a></li>
					<li><a href="addCat.htm"><i class="icon-lock icon-white"></i>Add a
							Category</a></li>
					<li><a href="modifyQues.htm"><i class="icon-user icon-white"></i>Modify
							a Question</a></li>
				
					<li><a href="logout.htm"><i class="icon-user icon-white"></i>Logout</a></li>
				

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>

<div class="container"  align="center" >
	<div class="panel panel-default" style="margin-top: 100px;width: 800px; ">
      <div class="panel-heading">Taking Question</div>
    



<form:form action="ques.htm" commandName="category" class="form-horizontal" role="form" style="margin-top: 30px;">
<div class="form-group">
  <label class="control-label col-sm-3" for="cat">Select Category:</label>
   <div class="col-sm-9" style="padding-right:30px; margin-bottom:10px;"> 


<form:select path="category_name" items="${dlist}" class="col-sm-9" id="sel1"></form:select>

<br/><br/><br/>
<div class="panel-body">
		<div class="col-sm-offset-2 col-sm-8" align="center">
			<button type="submit" class="btn btn-primary" >Submit</button>
		</div>
	</div>
</div>
</div>
</form:form>




  
	
</div>
</div>





	<script type="text/javascript" src="bootstrap.js"></script>

</body>
</html>