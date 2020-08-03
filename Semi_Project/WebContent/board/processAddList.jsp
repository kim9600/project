<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>    
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String id = request.getParameter("id");	
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String regist_day = request.getParameter("regist_day");
	String hit = request.getParameter("hit");	
	String ip = request.getParameter("ip");	
	//member테이블 등록 일시 데이타 생성
	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	Timestamp timestamp = new Timestamp(currentDatetime.getTime());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="dataSource" 
				   url="jdbc:mysql://localhost:3306/semiDB" 
				   driver="com.mysql.jdbc.Driver"
				   user="root"
				   password="1234"/>
<c:catch var="except">
<sql:update dataSource="${dataSource}" var="resultSet">
	insert into board values(?,?,?,?,?,?,?,?)
	<sql:param value="<%=num %>"/>
	<sql:param value="<%=id %>"/>
	<sql:param value="<%=name %>"/>
	<sql:param value="<%=subject %>"/>
	<sql:param value="<%=content %>"/>
	<sql:param value="<%=regist_day %>"/>
	<sql:param value="<%=hit %>"/>
	<sql:param value="<%=ip %>"/> 
</sql:update>
</c:catch>
<c:if test="${empty except}">
	<c:if test="${resultSet>0}">
		<c:redirect url="resultMember.jsp?msg=1"/>
	</c:if>
</c:if>				   
</body>
</html>