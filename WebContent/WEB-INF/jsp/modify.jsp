<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<form:form action="mod.htm" method="post">
<input type="hidden" name="ques_id" value="${ques_id }" /><br />
Question: <input type="text" name="question" value="${question }" /><br />
Category ID: <input type="text" name="category_id" value="${cat_id }"/><br />
Option 1: <input type="text" name="option1" value="${option1 }"/><br />
Option 2: <input type="text" name="option2" value="${option2 }"/><br />
Option 3: <input type="text" name="option3" value="${option3 }"/><br />
Option 4: <input type="text" name="option4" value="${option4 }"/><br />
Right Answer: <input type="text" name="right_answer" value="${right_answer }"/><br />
<input type="submit" value="Submit" />
</form:form>

</body>
</html>