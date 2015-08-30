
<!doctype html>
<html><head>
    <meta charset="utf-8">
    <title>BLOCKS - Bootstrap board Theme</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Carlos Alvarez - Alvarez.is">

    <!-- Le styles -->

    <link href="login.css" rel="stylesheet">
    
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />

    <style type="text/css">
      body {
        padding-top: 30px;
      }

      pbfooter {
        position:relative;
      }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
       
  	<!-- Google Fonts call. Font Used Open Sans & Raleway -->
	<link href="http://fonts.googleapis.com/css?family=Raleway:400,300" rel="stylesheet" type="text/css">
  	<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">

  	<!-- Jquery Validate Script -->
    <script type="text/javascript" src="jquery.validate.js"></script>

  	<!-- Jquery Validate Script - Validation Fields -->
		<script type="text/javascript">
		
		
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
		</script>

</head>

<style>

    .pbfooter {
        position:relative;
    }

	.navbar-header{
		height:60px;
	}

</style>
<script>
function checklogin(){
			var uname = document.getElementById("username").value;
			var passw = document.getElementById("password").value;

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
  <body >
           
  	<!-- NAVIGATION MENU -->

    <div class="navbar-nav navbar-inverse navbar-fixed-top">
        <div class="container">
        <div class="navbar-header">
          
          <a class="navbar-brand" href="Admin_Console.html" style="padding:0;padding-top:15px;width:200px;">
				<span style="inline"><img src="logo30.png"alt=""/> QuizUp Pro</span></a>
        </div> 
          
        </div>
    </div>

    <div class="container">
        <div class="row">
   		<div class="col-lg-offset-4 col-lg-4" style="margin-top:100px">
   			<div class="block-unit" style="text-align:center; padding:8px 8px 8px 8px;">
				<h3 style="color: #e3e3e3">
		Admin Console	
	</h3>
   				<img src="adminDp.png" alt="" class="img-circle" height="80px" width="80px">
   				<br>
   				<br>
					<form class="cmxform" id="signupForm" method="post" action="alogin.htm">
						<fieldset>
							<p>
								<input id="username" name="uname" type="text" placeholder="Username">
								<input id="password" name="pwd" type="password" placeholder="Password">
							</p>
								<input class="submit btn-success btn btn-large" type="submit" value="Login" onclick="return checklogin()">
						</fieldset>
					</form>
   			</div>

   		</div>


        </div>
    </div>



    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="bootstrap.js"></script>
    
  
</body></html>