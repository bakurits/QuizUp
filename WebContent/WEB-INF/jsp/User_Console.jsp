<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html><head>
    <meta charset="utf-8">
    <title>BLOCKS - Bootstrap Dashboard Theme</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Carlos Alvarez - Alvarez.is">

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link href="main.css" rel="stylesheet">
    <link href="font-style.css" rel="stylesheet">
    <link href="flexslider.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="bootstrap.js"></script>
	<script type="text/javascript" src="lineandbars.js"></script>
    
	<script type="text/javascript" src="dash-charts.js"></script>
	<script type="text/javascript" src="gauge.js"></script>
	
	<!-- NOTY JAVASCRIPT -->
	<script type="text/javascript" src="noty/jquery.noty.js"></script>
	<script type="text/javascript" src="noty/layouts/top.js"></script>
	<script type="text/javascript" src="noty/layouts/topLeft.js"></script>
	<script type="text/javascript" src="noty/layouts/topRight.js"></script>
	<script type="text/javascript" src="noty/layouts/topCenter.js"></script>
	
	<!-- You can add more layouts if you want -->
	<script type="text/javascript" src="noty/themes/default.js"></script>
    <!-- <script type="text/javascript" src="assets/js/dash-noty.js"></script> This is a Noty bubble when you init the theme-->
	<script type="text/javascript" src="highcharts.js"></script>
	<script src="jquery.flexslider.js" type="text/javascript"></script>

    <script type="text/javascript" src="admin.js"></script>
      
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
	<link href="http://fonts.googleapis.com/css?family=Raleway:400,300" rel="stylesheet" type="text/css">
  	<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">

<script type="text/javascript">
    $(document).ready(function () {

        $("#btn-blog-next").click(function () {
            $('#blogCarousel').carousel('next')
        });
        $("#btn-blog-prev").click(function () {
            $('#blogCarousel').carousel('prev')
        });

        $("#btn-client-next").click(function () {
            $('#clientCarousel').carousel('next')
        });
        $("#btn-client-prev").click(function () {
            $('#clientCarousel').carousel('prev')
        });

    });

    $(window).load(function () {

        $('.flexslider').flexslider({
            animation: "slide",
            slideshow: true,
            start: function (slider) {
                $('body').removeClass('loading');
            }
        });
    });

</script>    
  </head>
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

    <div class="container">

	  <!-- FIRST ROW OF BLOCKS -->     
      <div class="row">

      <!-- USER PROFILE BLOCK -->
        <div class="col-sm-3 col-lg-3">
      		<!-- <a href="ProfileView.html"> -->
			<div class="dash-unit">
	      		<dtitle>User Profile</dtitle>
	      		<hr>
				<div class="thumbnail">
					<img src="face80x80.jpg" alt="Marcel Newman" class="img-circle">
				</div><!-- /thumbnail -->
				<h1>${firstname }</h1>
				<h3>${username }</h3>
				<br>
					<div class="info-user">
						
						<span aria-hidden="true" class="li_settings fs1"></span>
						
					</div>
				</div>
				</a>
        </div>

       <!-- DONUT CHART BLOCK -->
        <!--  <div class="col-sm-3 col-lg-3">
       MAIL BLOCK
      		<div class="dash-unit">
      		<dtitle>Your Challenges</dtitle>
      		<hr>
      		<div class="framemail">
    			<div class="window">
			        <ul class="mail">
			            <li>
			                <i class="unread"></i>
							<a href="TakeChallenge.html">
			                <div>
							<img class="avatar" src="photo01.jpeg" alt="avatar">
			                <p class="sender">Anuj challenged you</p>
			                </div>
							</a>
			            </li>
			            
			        </ul>
    			</div>
			</div>
		</div>/dash-unit
	</div> 
       -->
      		<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
	      		<dtitle>Your performance</dtitle>
	      		<hr>
					<div class="accordion" id="accordion2">
					<% int i=0; %>
					<c:forEach items="${map}" var="s">
		                <div class="accordion-group">
		                    <div class="accordion-heading">
		                        <a class="accordion-toggle" data-toggle="collapse"  data-parent="#accordion2" href="#<%=i%>">
		                        ${s.key}
		                        </a>
		                    </div>
		                    <div id="<%=i++ %>" class="accordion-body collapse ">
		                        <div class="accordion-inner">
								<p>Total quizzes:${s.value.get(0)[0]}<br/>Highest score: ${s.value.get(0)[1]}<br/>Lowest score:${s.value.get(0)[2]}
								</p>
								</div>
		                    </div>
		                </div>
						</c:forEach>
		            </div>
				</div>
			</div>
	
	  
	  <!-- NOTIFICATIONS BLOCK -->     
		<div class="col-sm-3 col-lg-3">
			
			<div class="dash-unit">
	      		<dtitle>Whats new</dtitle>
	      		<hr>
				
	      		<div class="info-user">
					<span aria-hidden="true" class="li_bubble fs2"></span>
				</div>
	      		<div class="cont">
	      			<p>New Category added</p>
	      			<p>Beta version will be released on 15 august</p>
	      			<p></p>
	      		</div>
			</div>
		</div>
		
		<!-- FAST CONTACT BLOCK -->     
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
	      		<dtitle>Feedback</dtitle>
	      		<hr>
	      		<div class="cont">
                	<form  method="POST" id="contact"  action="mailto:anmol.gupta@snapdeal.com"
name="feedback"
  enctype="multipart/form-data">
                    	<input type="text" id="contactname" name="contactname" placeholder="Name">
                    	<input type="text" id="email" name="email" placeholder="Email">
                    	<div class="textarea-container"><textarea id="message" name="message" placeholder="Message"></textarea></div>
                    	<input type="submit" id="submit" name="submit" value="Send">
                    </form>
				</div>
				</div>
			</div>


	  
	</div><!--/row -->     
      
 	  <!-- FOURTH ROW OF BLOCKS -->     
		<div class="row">

 	  <!-- ACCORDION BLOCK -->     
	<%-- 		<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
	      		<dtitle>Your performance</dtitle>
	      		<hr>
					<div class="accordion" id="accordion2">
					<% int i=0; %>
					<c:forEach items="${map}" var="s">
		                <div class="accordion-group">
		                    <div class="accordion-heading">
		                        <a class="accordion-toggle" data-toggle="collapse"  data-parent="#accordion2" href="#<%=i%>">
		                        ${s.key}
		                        </a>
		                    </div>
		                    <div id="<%=i++ %>" class="accordion-body collapse ">
		                        <div class="accordion-inner">
								<p>Total quizzes:${s.value.get(0)[0]}<br/>Highest score: ${s.value.get(0)[1]}<br/>Lowest score:${s.value.get(0)[2]}
								</p>
								</div>
		                    </div>
		                </div>
						</c:forEach>
		            </div>
				</div>
			</div>
	 --%>		
			
 	  		
 	  		

		</div><!--/row -->
     
      
      
	</div> <!-- /container -->
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