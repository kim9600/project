<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<% String name = (String)request.getAttribute("name"); %>
<!DOCTYPE html><html lang="en"><head>
  <title>글쓰기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>    
  .navbar {margin-bottom: 0; border-radius: 0;}    
   footer {background-color: #f2f2f2; padding: 25px;}    
  .carousel-inner img {width: 100%; margin: auto; min-height:200px;} 
  @media (max-width: 600px) {.carousel-caption {display: none;}}
  </style>
</head>
<body>
<sql:setDataSource var="dataSource" 
				   url="jdbc:mysql://localhost:3306/semiDB" 
				   driver="com.mysql.jdbc.Driver"
				   user="root"
				   password="1234"/>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">글쓰기</h1>
	</div>
</div>
<!-- 글쓰기 폼 -->
<div class="container">
	<form name="newWrite" action="./BoardWriteAction.do" class="form-horizontal" method="post" onclick="return checkForm()">
		<input type="hidden" name="id" class="form-control" value="${sessionId}">
		<div class="form-group row">
			<label class="col-sm-2 control-label">성명</label>
			<div class="col-sm-3">
				<input name="name" class="form-control" value="<%=name%>" placeholder="name" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-5">
				<input name="subject" class="form-control" placeholder="subject" autofocus>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-8">
				<textarea rows="5" cols="80" name="content" class="form-control" placeholder="content"></textarea>				
			</div>
		</div>
		<div class="form-group row">			
			<div class="col-sm-10 col-sm-offset-2">
				<input type="submit" class="btn btn-primary" value="등록" >
				<input type="reset" class="btn btn-primary" value="취소">	
			</div>
		</div>
	</form>
	<hr>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>