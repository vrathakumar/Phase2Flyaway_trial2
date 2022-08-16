<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search for flights</title>
</head>
<body>
	<%
	Object loggedInUser = session.getAttribute("loggedInUser");
	out.print("<p style=\"color:Green;\"> Welcome " + loggedInUser + "</p>");
	%>
	<form action="flightpage.jsp" method="post">
		Date of travel <input type="date" name="dot" id="dot" required/><br><br>
		Source City <input type="text" name="sc" id="sc" required/><br><br>
		Destination City<input type="text" name="dc" id="dc" required/><br><br> No of
		Passengers<input type="number" name="nop" id="nop" required/><br><br>
		<button>Search</button>
	</form>

</body>
</html>