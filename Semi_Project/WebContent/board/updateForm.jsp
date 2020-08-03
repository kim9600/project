<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id=(String)session.getAttribute("id");
%>
<sql:setDataSource var="dataSource" 
				   url="jdbc:mysql://localhost:3306/semiDB" 
				   driver="com.mysql.jdbc.Driver"
				   user="root"
				   password="1234"/>
<sql:query var="resultSet" dataSource="${dataSource}">
  select * from board where id=?
  <sql:param value="<%=id%>"/>
</sql:query> 				   
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

<jsp:include page="../menu.jsp"/>
<div class="container text-center">	
	<h1 class="display-3">글수정</h1>	
</div>
<c:forEach var="row" items="${resultSet.rows}">
   <c:set var="num" value="${row.num}"/>   
   <c:set var="title" value="${row.title}"/> 
   <c:set var="id" value="${row.id}"/>
      <c:set var="content" value="${row.content}"/>    
<div class="container">
<form name="newProduct" action="./processAddProduct.jsp"
	  class="form-horizontal" method="post" enctype="multipart/form-data">

<div class="form-group row">
	<label class="col-sm-2">성명</label>
	<div class="col-sm-3">
		<input type="text" name="wirter" id="writer" class="form-control" value="<c:out value='${row.name}'/>">
	</div>
</div>

<div class="form-group row">
	<label class="col-sm-2">제목</label>
	<div class="col-sm-5">
		<input type="text" name="title" id="title" class="form-control" value="<c:out value='${row.title}'/>">
	</div>
</div>


<div class="form-group row">
	<label class="col-sm-2">내용</label>
	<div class="col-sm-7">
		<textarea rows="10" cols="50" name="contents" id="contents" class="form-control" value="<c:out value='${row.content}'/>"></textarea>
	</div>
</div>


<div class="form-group row">	
	<div class="col-sm-offset-2 com-sm-10">
		<input type="submit" class="btn btn-primary" value="등록" >
		<input type="reset" class="btn btn-primary" value="취소" >
	</div>
</div>

</form>
</div>
</c:forEach>
<jsp:include page="../footer.jsp"/>
</body>
</html>