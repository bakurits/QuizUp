<%@page import="com.entity.RuntimeScore"%>
<%@page import="com.entity.QuestionBank"%>
<%@page import="com.entity.Challenge"%>
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
			<h4><strong>Challenges Thrown</strong></h4>


<hr>
	<%
int cateid=0;
int score=0;
int i=0;
int j;

%>
<%
ArrayList<Challenge> list=new ArrayList<Challenge>();
ArrayList<Challenge> list2=new ArrayList<Challenge>();
if(request.getAttribute("thrown")!=null)
{
	list=(ArrayList<Challenge>)request.getAttribute("thrown");
	/* cateid=list.get(0).getCategory_id(); */
}
if(request.getAttribute("receive")!=null)
{
	list2=(ArrayList<Challenge>)request.getAttribute("receive");
	/* cateid=list.get(0).getCategory_id(); */
}
%>
	<table class="display">
	          <thead>
	            <tr>
	              <th>S.no</th>
	              <th>Challenger_id</th>
				  <th>Challengee_id</th>
	              <th>Challenger score</th>
	              <th>Challengee score</th>
	               <th>Winner</th>
	              <th>Completed</th>
	             
	            </tr>
	          </thead>
<%
String str="";
String str2="";
for(Challenge qb:list){
	
	int challenger_id=qb.getChallenger_id();
	int challengee_id=qb.getChallengee_id();
	int score1=qb.getScore1();
	int score2=qb.getScore2();
	Integer winner=qb.getWinner_id();
	if(winner==-1)
		str2="draw";
	else
		str2=winner.toString();
	int completed=qb.getCompletion();
	if(completed==0)
		str="No";
	else
		str="Yes";
		
	
		%>
		
	          <tbody>
			  <tr class="odd">
	              <td>No<%= ++i %>.</td>
	              <td><%=challenger_id %></td>
				  <td><%=challengee_id %></td>
	              <td><%=score1 %></td>
	              <td><%=score2 %></td>
	              <td><%=str2 %></td>
				  <td><%=str %></td>
				
	            </tr>
	          
	            
	          </tbody>
	         <!-- </table> --><!--/END First Table -->
		
		<% 
		}
		%>
  </table><br>
			 <!--SECOND Table -->

	<h4><strong>Challenges Received</strong></h4>
<table class="display">
	          <thead>
	            <tr>
	              <th>S.no</th>
	              <th>Challenger_id</th>
				  <th>Challengee_id</th>
	              <th>Challenger score</th>
	              <th>Challengee score</th>
	               <th>Winner</th>
	              <th>Completed</th>
	             
	            </tr>
	          </thead>
		<%
		int k=0;
String str1="";
String str21="";
for(Challenge qb1:list2){
	
	int challenger_id1=qb1.getChallenger_id();
	int challengee_id1=qb1.getChallengee_id();
	int score11=qb1.getScore1();
	int score21=qb1.getScore2();
	Integer winner1=qb1.getWinner_id();
	int completed1=qb1.getCompletion();
	int challenge_id=qb1.getChallenge_id();
	String quesstring=qb1.getQuestions_id();
	if(winner1==-1)
		str21="draw";
	else
		str21=winner1.toString();
	if(completed1==0)
		str1="No";
	else
		str1="Yes";
		
	
		%>
		
	          <tbody>
			  <tr class="odd">
	              <td>No<%= ++k %>.</td>
	              <td><%=challenger_id1 %></td>
				  <td><%=challengee_id1 %></td>
	              <td><%=score11 %></td>
	              <td><%=score21 %></td>
	              <td><%=str21 %></td>
	              <% if(completed1==0){ %>
	              <td> <form action="process12.htm">
<input type="hidden" value="<%= challenge_id %>" name="challenge_id">
<input type="hidden" value="<%= quesstring %>" name="quesstring">
<button type="submit" class="btn btn-success">Accept</button>
</form></td>
<%}
	              
	              else{     %>
	              <td>Yes</td>

				
				
	            </tr>
	          
	            
	          </tbody>
	         <!-- </table> --><!--/END First Table -->
		
		<% 
		}}
		%>
		</div><!--/span12 -->
      </div><!-- /row -->
      <div class="row">
		<div class="col-sm-12 col-lg-12">
		

<hr>
     </div> <!-- /container -->
    	<br>
	
	</br>
	
      	<div class="container">
      	<!-- <form action="process.htm"> -->
<%-- <form action="process.htm">
<input type="hidden" value="<%= score %>" name="score">

<button type="submit" class="btn btn-success">Submit Your Score</button>  
</form> --%>
		  
      	</div><!-- /container -->
      	</div>
      	</table>
      	</div>
      	</div>
      	</div>
      	
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