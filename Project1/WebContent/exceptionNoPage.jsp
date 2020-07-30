<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>페이지 오류</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">
      	<img src="./resources/images/cat.jpg" height="30px" width="30px"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="menu.jsp">홈</a></li>
        <li><a href="#">about</a></li>
        <li><a href="products.jsp">상품정보</a></li>
        <li><a href="customerservice.jsp">고객센터</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="admin.jsp"><span class="glyphicon glyphicon-log-in"></span>Admin</a></li>
        <li><a href="./login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="jumbotron">
	<div class="container">
		<h2 class="alert alert-danger">요청하신 페이지를 찾을수 없습니다.</h2>
	</div>
</div>
<div class="container">
	<p><%=request.getRequestURL()%></p>
	<p><a href="products.jsp" class="btn btn-secondary">상품 목록  &raquo;</a>
</div>
</body>
</html>