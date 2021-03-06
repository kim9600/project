<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<jsp:include page="menu.jsp"/>

<div class="container">
	<h1 class="display-3">로그인</h1>
</div>
<div class="container" align="center">
	<div class="col-md-4 col-md-offset-4">
	<h3 class="form-signin-heading">Please sign in</h3>
	
<%	String error=request.getParameter("error");
if(error!=null){
	out.print("<div class='alert alert-danger'>");
	out.print("아이디와 비밀번호를 확인해 주세요");
	out.print("</div>");
}
%>
<form action="j_security_check" method="post" class="form-signin">
	<div class="form-group">
		<label for="inputUserName" class="sr-only">User Name</label>
		<input type="text" class="form-control" placeholder="ID" name="j_username"
		required autofocus>
	</div>
	
	<div class="form-group">
		<label for="inputPassword" class="sr-only">Password</label>
		<input type="password" class="form-control" placeholder="password" name="j_password"
		required autofocus>
	</div>
	<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
</form>
</div>
</div>
</body>
<jsp:include page="footer.jsp"/>
</html>