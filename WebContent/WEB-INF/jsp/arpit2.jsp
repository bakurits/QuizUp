<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.QuestionBank"%>
<%@page import="java.util.ArrayList"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>BLOCKS - Bootstrap Dashboard Theme</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Carlos Alvarez - Alvarez.is">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js_new/gauge.js"></script>
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
</head>

<style>
.pbfooter {
	position: relative;
}

.navbar-header {
	height: 60px;
}

.container1 {
	margin-top: 100px;
	margin-right: 50px;
}
</style>

<body bgcolor="#e3e3e3">

<script type="text/javascript">
var i=0;
var ques=new Array();
var opt=new Array();
var cor=new Array();
var selectedAns = new Array();
var score=0;
var quesNo=-1;
var optStr=new Array();
var maxQues=0;
//var listitems;
	<%! 
int cateid=0;
int score=10;

%>
<%

ArrayList<QuestionBank> list=new ArrayList<QuestionBank>();
if(session.getAttribute("elist")!=null)
{
	list=(ArrayList<QuestionBank>)session.getAttribute("elist");
	cateid=list.get(0).getCategory_id();
%>
maxQues = <%=list.size()%>;
<%
	for(QuestionBank qb:list)
	{
%>
	ques[i] = "<%= qb.getQuestion().toString() %>";
	opt[i*4] = "<%= qb.getOption1().toString() %>";
	opt[i*4+1] = "<%= qb.getOption2().toString() %>";
	opt[i*4+2] = "<%= qb.getOption3().toString() %>";
	opt[i*4+3] = "<%= qb.getOption4().toString() %>";
	cor[i] = <%= qb.getRight_answer() %>;
	optStr[i] = "<%= qb.getQues_id() %>";
	i++;
	<%		
	}
}
%>

function changeQuestion(){
	//alert("hello");
	quesNo++;
	if(quesNo==-1)  $("#currQues").trigger("change");
	if(quesNo==maxQues)	{sendScore();}
	else{
	document.getElementById("quizfrom").reset();
	var option1 = document.getElementById("option1");
	var option2 = document.getElementById("option2");
	var option3 = document.getElementById("option3");
	var option4 = document.getElementById("option4");
	var question = document.getElementById("question");
	var defaultoption = document.getElementById("defaultoption");
	option1.setAttribute("value", 1);
	option2.setAttribute("value", 2);
	option3.setAttribute("value", 3);
	option4.setAttribute("value", 4);
	question.innerHTML= "Question "+(quesNo+1);
	document.getElementById("option1label").innerHTML= opt[quesNo*4];
	document.getElementById("option2label").innerHTML= opt[quesNo*4+1];
	document.getElementById("option3label").innerHTML= opt[quesNo*4+2];
	document.getElementById("option4label").innerHTML= opt[quesNo*4+3];
	var questionText = document.getElementById("questionText");
	questionText.innerHTML=ques[quesNo];
	degrees=-36;}
}
function sendScore(){
	document.getElementById("sendQuizScore").submit();
}

	function checkAnswer() {
		if(quesNo!=-1){
		var optNo = document.getElementsByName("optradio");
		var selectedOtption;
		for (var i = 0, length = optNo.length; i < length; i++) {
			if (optNo[i].checked) {
				selectedOption = optNo[i].value;
				selectedAns[quesNo] = selectedOption;
				var choice = document.getElementById("ques"+(quesNo+1));
				choice.setAttribute("name", optStr[quesNo]);
				choice.value=selectedOption;
				break;
			}
		}
		if (selectedOption == cor[quesNo]) {
			score++;
			changeClassFormCorrect();
		} else
			changeClassFormInCorrect();}
		else
		changeClassFormCorrect();
	}
	function changeClassFormCorrect() {
		var questionPanel = document.getElementById("form-panel");
		questionPanel.setAttribute("class", "panel panel-success");
		setTimeout(function() {
			questionPanel.setAttribute("class", "panel panel-primary");
			changeQuestion();
		}, 1000);
	}
	function changeClassFormInCorrect() {
		var questionPanel = document.getElementById("form-panel");
		questionPanel.setAttribute("class", "panel panel-danger");
		setTimeout(function() {
			questionPanel.setAttribute("class", "panel panel-primary");
			changeQuestion();
		}, 1000);
	}
</script>
<script>
/* $(document).ready(function(){
	$("#currQues").change(checkAnswer());
});
 */</script>


	<!-- NAVIGATION MENU -->

	<div class="navbar-nav navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header" style="width: 150px">

				<a class="navbar-brand" href="#"
		 			style="padding: 0; padding-top: 15px; width: 200px;"> <span
					style=""><img src="logo30.png" alt="" /> QuizUp Pro</span></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="#"><i
							class="icon-home icon-white"></i> Home</a></li>
					<li><a href="#"><i class="icon-th icon-white"></i>Take
							a quiz</a></li>
					<li class="active"><a href="#"><i
							class="icon-lock icon-white"></i>Challenge</a></li>
					<li><a href="#"><i class="icon-user icon-white"></i>View
							Challenges</a></li>
					<li><a href="#"><i
							class="icon-user icon-white"></i>Profile</a></li>


				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>

	<div class="container" align="center" id="">
		<form class="form-horizontal" role="form" style="margin-top: 30px;" id="quizfrom">

<input type="text" id="currQues" value="-1" onchange="checkAnswer()" style="display:none;"/>
		<div class="form-group">

		<div style="margin-right=0px;margin-left:200px;">
		<div class="panel panel-primary"
			style="margin-top: 30px; width: 600px; height: 300px; float:left;" id="form-panel">

			<div class="panel-heading" id="question">Sample Question 1 Testing</div>
			<div class="panel-body">
				<p align="left" style="margin-left: 10px; margin-right: 10px;" id="questionText">This is dummy Question?</p>
			</div>
<!-- 			<div class="panel-body">
				<img src="" width="200px" height="200px" />
			</div> -->

			<!-- 			 -->
			<div class="panel-body">
				<div class="col-sm-6" style="padding-left: 10px;display:none;">
					<div class="radio">
						<label><input type="radio" name="optradio" id="defaultoption" checked="checked" value="0"/></label>
					</div>
				</div>
				<div class="col-sm-6" style="padding-left: 10px;">
					<div class="radio">
						<label><input type="radio" name="optradio" id="option1"><label id="option1label">Option
							1</label></label>
					</div>
				</div>
				<div class="col-sm-6" style="padding-left: 10px;">
					<div class="radio">
						<label><input type="radio" name="optradio" id="option2"><label id="option2label">Option
							2</label></label>
					</div>
				</div>
				<div class="col-sm-6" style="padding-left: 10px;">
					<div class="radio">
						<label><input type="radio" name="optradio" id="option3"><label id="option3label">Option
							3</label></label>
					</div>
				</div>
				<div class="col-sm-6" style="padding-left: 10px;">
					<div class="radio">
						<label><input type="radio" name="optradio" id="option4"><label id="option4label">Option
							4</label></label>
					</div>
				</div>
			</div>

				<div class="panel-body">
					<div class="col-sm-offset-2 col-sm-8" align="center">
						<button id="submitans" class="btn btn-primary" type="button" onclick="checkAnswer();">Submit Answer</button>
					</div>
				</div>
		</div>
		</div>
		</form>

			<div class="container" style="">
		 		<div class="col-sm-3 col-lg-3" style="width:200;height:200; right: 5px;">
					<div>
						<canvas id="canvas" width="400" height="400"></canvas>
					</div>
				</div>
			</div>


		
	</div>
	<form id="sendQuizScore"  action="viewscore1.htm" method="post" style="display:none;">
<%
    int p=1;
	for(QuestionBank qb:list)
	{
%>
		<input type="hidden" id="ques<%=p%>"/>
<%
	p++;
} %>
	</form>

	<script type="text/javascript" src="bootstrap.js"></script>


</body>

</html>