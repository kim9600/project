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
	session.invalidate(); //invalidate() --> 세션이 켜져있어도 종료시킬수있다
	response.sendRedirect("admin.jsp"); 
%>
</body>
</html>