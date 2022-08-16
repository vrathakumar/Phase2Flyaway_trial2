<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*,com.flyaway.Constants"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<jsp:useBean id="Constants" class="com.flyaway.Constants" scope="application"/>
<%-- <sql:setDataSource var="db" driver="@{Constants.DB_DRIVER_CLASS_NAME}"
		url="@{Constants.DB_URL}" user="@{Constants.USER_NAME}" password="@{Constants.PASSWORD}" scope="application"/>
 --%>
 <sql:setDataSource var="db" driver="org.sqlite.JDBC"
		url="jdbc:sqlite:D:/projects/aug/AirwaysAssignment/airways.db" user="" password="" scope="application"/>