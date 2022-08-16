<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, com.mysql.jdbc.Driver"%>  
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="common.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight page</title>
</head>
<body>

<!-- Getting connection to the SQL table -->
<%-- <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/phase2_project_flyaway"  
     user="root"  password="root"/>
 --%>
   
<c:set var="sourceCity" scope="page" value="${param.sc}" />
<c:set var="destinationCity" scope="page" value="${param.dc}" />
<c:set var="datOfTravel" scope="page" value="${param.dot}" />
<c:set var="noOfPassangers" scope="page" value="${param.nop}"/>

<fmt:parseDate value="${datOfTravel}" pattern="yyyy-MM-dd" var="parsedDateOfTravel"/>
<fmt:formatDate value="${parsedDateOfTravel}" pattern="MM/dd/yyyy" var="formattedDatOfTravel" />

<p>Date Of Travel : <c:out value="${formattedDatOfTravel}"></c:out> </p>
<sql:query dataSource="${db}" var="rs">  
	SELECT * from flight_details where upper(source_city) = upper(?) and destination_city = upper(?) and date_of_travel = ?
	 
	<sql:param value="${sourceCity}" />
	<sql:param value="${destinationCity}" />
	<sql:param value="${formattedDatOfTravel}" /> 
</sql:query>      

<table border="2" width="100%">  
<tr>  
<th>Airline</th>  
<th>Price</th>  
<th>Flight No.</th>  
<th>Source City</th>  
<th>Destination City</th> 
<th>Departure time from source</th> 
<th>Arrival time at destination</th> 
<th>Total seats available</th> 
<th>Date of Travel</th>
<th>class</th>  
</tr>  
	<c:forEach var="row" items="${rs.rows}">  
		<tr>  
			<td><c:out value="${row.airlinename}"/></td>  
			<td><c:out value="${row.price}"/></td>  
			<a href="registerdetails.jsp"> 
			<td><c:out value="${row.flight_no}"/></td> 
			</a> 
			<td><c:out value="${row.source_city}"/></td> 
			<td><c:out value="${row.destination_city}"/></td>  
			<td><c:out value="${row.dep_time_from_source}"/></td>  
			<td><c:out value="${row.arr_time_to_destination}"/></td>  
			<td><c:out value="${row.seat_availability}"/></td>  
			<td><c:out value="${row.date_of_travel}"/></td>  
			<%-- <td><c:out value="${row.class}"/></td> --%>
		</tr>  
	</c:forEach>  
</table>
</body>
</html>