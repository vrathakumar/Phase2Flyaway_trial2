<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
</head>
<body>
	This is the login page

	<h1>Fly Away Application</h1>
	</br>
	<form action="sessionhandling.jsp" method="post">
		<p></p>
		<%
		Object errorMessage = pageContext.getSession().getAttribute("errorMessage");
		if (errorMessage != null) {
			out.print("<p style=\"color:red;\">" + errorMessage + "</p>");
			pageContext.getSession().setAttribute("errorMessage", null);
		}
		%>
		</br> User name <input type="email" name="uname" id="uname">
		Password <input type="password" name="pword" id="pword">
		<button>Submit</button>
	</form>
</body>
</html>