<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>login</title>
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
        <li><a href="product.jsp">상품정보</a></li>
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
	<h1 class="display-3">로그인</h1>
	</div>
</div>
<div class="container" align="center">
<div class="col-md-4 col-md-offset-4">
	<h3 class="form-signin-heading">Please sign in</h3>
	<%
		String error= request.getParameter("error");
		if(error!=null){
			out.println("<div class='alert alert-danger'>");
			out.println("아이디와 비밀번호를 확인해주세요");
			out.println("</div>");
			
		}
	%>
<form class="form-signin" action="j_security_check" method="post">
	<div class="form-group">
		<label for="inputUserName" class="sr-only">User Name</label>
		<input type="text" class="form-control" placeholder="ID" name='j_username' required autofocus>
	</div>
	<div class="form-group">
		<lable for="inputPassword" class="sr-only">Password</lable>
		<input type="password" class="form-control" placeholder="Password" name='j_password' required>
		
		</div>
	<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
</form>
</div>

</div>
</body>
</html>