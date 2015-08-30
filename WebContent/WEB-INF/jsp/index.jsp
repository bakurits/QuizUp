<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%

session.setAttribute("user_id",1);

%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="addQues.htm">Add Ques</a><br />
<a href="showQues.htm">Show Ques</a><br />
<a href="modifyQues.htm">Modify Ques</a><br />
<a href="deleteQues.htm">Delete Ques</a><br />
<a href="addCat.htm">Add Category</a><br />
<a href="showCat.htm">Show Category</a><br />
<a href="showQuesinCat.htm">Show All Ques in Category</a><br />
<a href="viewchallenges.htm">View Challenges</a><br />
<a href="startchallenge.htm">Start Challenge</a><br />
<a href="getChallenger.htm">Get Challenger</a><br />
<a href="getWinner.htm">Get Winner</a><br />


</body>
</html>