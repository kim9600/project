<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String method= request.getMethod();
	Locale locale= request.getLocale();

	String date= DateFormat.getDateTimeInstance
			(DateFormat.FULL,DateFormat.FULL,locale).format(new Date());
%>
<p>This content was requested using the <%=method %> method.

<p>Requested at: <%=date %>
</body>
</html>