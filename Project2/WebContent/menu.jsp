<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="home.jsp">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="home.jsp">Home</a></li>
      <li><a href="${pageContext.request.contextPath}/editProduct.jsp/edit=update">수정</a></li>
      <li><a href="${pageContext.request.contextPath}/editProduct.jsp?edit=delete">삭제</a></li>
     
      
      
   
      <li><a href="#">Page 2</a></li>
      <li><a href="http://localhost:8080/Project1/BoardListAction.do">게시판</a></li>
    </ul>
      <ul class="nav navbar-nav navbar-right">
      <li><a href="admin.jsp"><span class="glyphicon glyphicon-log-in"></span>Admin</a></li>
<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out" ></span> 로그아웃</a></li>
      
</ul>
	

  </div>  
</nav>

</body>
</html>