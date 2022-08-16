<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, com.mysql.jdbc.Driver"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<jsp:include page="common.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	This is the sessionhandling page
	<c:set var="username" scope="page" value="${param.uname}" />
	<c:set var="password" scope="page" value="${param.pword}" />
	<!-- Getting connection to the SQL table -->
	<%-- <sql:setDataSource var="db" driver="org.sqlite.JDBC"
		url="jdbc:sqlite:D:/projects/aug/AirwaysAssignment/airways.db" user="" password=""/> --%>

	<!-- Getting value of the password for the username uname -->
	<sql:query dataSource="${db}" var="result">
		SELECT * FROM login where upper(username) = upper(?) AND password = ?
	<sql:param value="${username}" />
		<sql:param value="${password}" />
	</sql:query>
	<c:forEach var="row" items="${result.rows}">
		<tr>
			<c:set var="loggedInUser" scope="page" value="${row.username}" />
			<c:set var="loggedInUserRole" scope="page" value="${row.user_role}" />
		</tr>
	</c:forEach>
	<%
	Object loggedInUser = pageContext.getAttribute("loggedInUser");
	Object loggedInUserRole = pageContext.getAttribute("loggedInUserRole");
	if (loggedInUser != null && !loggedInUser.toString().isEmpty()) {
		session.setAttribute("loggedInUser", loggedInUser.toString());
		if (loggedInUserRole != null && loggedInUserRole.toString().equalsIgnoreCase("ADMIN")) {
			session.setAttribute("loggedInUserRole", loggedInUserRole.toString());
			response.sendRedirect("admin.jsp");
		} else {
			response.sendRedirect("search.jsp");
		}
	} else {
		//pageContext.forward("login.jsp");
		session.setAttribute("errorMessage", "Invalid Username or Password!");
		//response.sendRedirect("login.jsp");
	}
	%>
</body>
</html>