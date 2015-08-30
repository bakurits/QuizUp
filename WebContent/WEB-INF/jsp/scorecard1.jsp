<%@page import="com.entity.RuntimeScore"%>
<%@page import="com.entity.QuestionBank"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <title>BLOCKS - Bootstrap Dashboard Theme</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />    
    <!-- DATA TABLE CSS -->
    <link href="http://www.prepbootstrap.com/Content/css/single-page-admin/table.css" rel="stylesheet">
        
    <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/single-page-admin/bootstrap.js"></script>
    <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/single-page-admin/admin.js"></script>
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

    <style type="text/css">
      body {
        padding-top: 60px;
      }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
        
  	<!-- Google Fonts call. Font Used Open Sans -->
  	<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">

  	<!-- DataTables Initialization -->
    <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/single-page-admin/datatables/jquery.dataTables.js"></script>
  			<script type="text/javascript" charset="utf-8">
  			    $(document).ready(function () {
  			        $('#dt1').dataTable();
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
<%-- Congratulations your score is: ${score }<br/><br/><br/> --%>
 <div class="container">

      <!-- CONTENT -->
	<div class="row">
		<div class="col-sm-12 col-lg-12">
			<h4><strong>Your Scorecard</strong></h4>

<%!
ArrayList<RuntimeScore> rs=null;
%>
<%
Object obj1=request.getAttribute("rs");
if(obj1!=null)
{
	rs=(ArrayList<RuntimeScore>)obj1;
 	/* for(RuntimeScore s:rs)
	{
		out.println(s.getQues_id()+"  "+s.getSelected()+"   "+s.getRiightanswer()+"<br>");
	} */
 
 }


%>
<hr>
	<%
int cateid=0;
int score=0;
int i=0;
int j;
int selected=20;
%>
<%
ArrayList<QuestionBank> list=new ArrayList<QuestionBank>();
if(session.getAttribute("elist")!=null)
{
	list=(ArrayList<QuestionBank>)session.getAttribute("elist");
	cateid=list.get(0).getCategory_id();
}
%>
	<table class="display">
	          <thead>
	            <tr>
	              <th>Q No.</th>
				  <th>Question</th>
	              <th>Option1</th>
	              <th>Option2</th>
	              <th>Option3</th>
	              <th>Option4</th>
				  <th>selected</th>
				  <th>correct</th>
				  <th>Decision</th>
	            </tr>
	          </thead>
<%
for(QuestionBank qb:list){
	 selected=0;
	String result="";
	int flag=0;
	int correctans=qb.getRight_answer();
	int ques_id=qb.getQues_id();
	String ques_name=qb.getQuestion();
	
	String select=null;
	String opt1=qb.getOption1();
	String opt2=qb.getOption2();
	String opt3=qb.getOption3();
	String opt4=qb.getOption4();
	
	for(j=0;j<rs.size();j++){
		System.out.println("helloooo");
		if(rs.get(j).getQues_id()==ques_id)
		{
			selected=rs.get(j).getSelected();
			System.out.println("hello" +selected);
			
		break;
		}
	}

	if(selected==correctans){
		score++;
		result="correct";
	}
	else{
		result="incorrect";
	}
		%>
		<%-- <table cellpadding="10" bgcolor="#e3e3e3">
		<tr><td>Q<%= ++i %>-</td><td><%=ques_name %></td></tr>
		<tr><td>1: <%=opt1 %></td><td>2: <%=opt2 %></td></tr>
		<tr><td>3: <%=opt3 %></td><td>4: <%=opt4 %></td></tr>
		<tr><td>Result:<%=result %></td><td>correct:<%=correctans %></td><td>selected:<%=selected %></td></tr>
		
		
		
		</table>
		<br/><br/><br/> --%>
		<!-- <table class="display">
	          <thead>
	            <tr>
	              <th>Q No.</th>
				  <th>Question</th>
	              <th>Option1</th>
	              <th>Option2</th>
	              <th>Option3</th>
	              <th>Option4</th>
				  <th>selected</th>
				  <th>correct</th>
				  <th>Decision</th>
	            </tr>
	          </thead> -->
	          <tbody>
			  <tr class="odd">
	              <td>Q<%= ++i %>.</td>
	              <td><%=ques_name %></td>
				  <td><%=opt1 %></td>
	              <td><%=opt2 %></td>
	              <td><%=opt3 %></td>
	              <td><%=opt4 %></td>
				  <td><%=selected %></td>
				  <td><%=correctans %></td>
				  <td><%=result %></td>
	            </tr>
	          
	            
	          </tbody>
	         <!-- </table> --><!--/END First Table -->
		
		<% 
		}
		%>
  </table><br>
			 <!--SECOND Table -->


		
		</div><!--/span12 -->
      </div><!-- /row -->
     </div> <!-- /container -->
    	<br>
	<div class="container">
		<h2>Congratulations buddy!!!</h2>
		<h3>Your total score is: <%=score %></h3>
	</div>
	</br>
      	<div class="container">
      	
<form action="process1.htm">
<input type="hidden" value="<%= score %>" name="score">

<button type="submit" class="btn btn-success">Submit Your Score</button>  
</form>
		  
      	</div><!-- /container -->
      	<br>
	<!-- FOOTER -->	
	<div id="footerwrap">
      	<footer class="clearfix"></footer>
      	<div class="container">
      		<div class="row">
      			<div class="col-sm-12 col-lg-12">
      			<p><img src="http://www.prepbootstrap.com/Content/images/shared/single-page-admin/logo.png" alt=""></p>
      			<p>Developed by Snapdeal GETs - Copyright 2013</p>
      			</div>

      		</div><!-- /row -->
      	</div><!-- /container -->		
	</div><!-- /footerwrap -->


<br/><br/><br/>



<%-- <form action="process.htm">

<input type="hidden" value="<%= score %>" name="score">

<input type="submit" value="Submit your score"/>
</form> --%>


</body>
</html>