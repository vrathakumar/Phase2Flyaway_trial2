<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<jsp:include page="common.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
</head>
<body>
<body>
	<%
	Object loggedInUser = session.getAttribute("loggedInUser");
	out.print("<p style=\"color:Green;\"> Welcome " + loggedInUser + "</p>");
	%>
	<p>REGISTRATION DETAILS BELOW</p>
	<table border="2" width="100%">
		<tr>
			<th>Full Name</th>
			<th>Address</th>
			<th>Age</th>
			<th>Mobile</th>
			<th>E-mail Id</th>
			<th>Identification</th>
			<th>Code</th>
			<th>Flight No.</th>
			<th>Source City</th>
			<th>Destination City</th>
			<th>Departure time from source</th>
			<th>Arrival time at destination</th>
			<th>No Of Seats</th>
			<th>Date of Travel</th>
			<th>class</th>
		</tr>
</body>
</body>
</html>