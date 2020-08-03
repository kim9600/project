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
    .row.content {height: 1500px}    
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }    
      background-color: #555;
      color: white;
      padding: 15px;
    }
  </style>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
      <h4>회사소개</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/company.jsp">PET SHOP?</a></li>
        <li><a href="${pageContext.request.contextPath}/company.jsp">오시는 길</a></li>        
      </ul><br>      
    </div>
    <div class="col-sm-9">
      <h4><small>PET SHOP</small></h4>
      <hr>
      <h2>PET SHOP이란?</h2>
      <h5><span class="glyphicon glyphicon-time"></span> Post by Jane Dane, Sep 27, 2015.</h5>
      <h5><span class="label label-danger">Food</span> <span class="label label-primary">Ipsum</span></h5><br>
      <p>Food is my passion. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <br><br> 
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>