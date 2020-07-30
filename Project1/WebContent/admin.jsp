<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    	<div class="dropdown">
      <ul class="nav navbar-nav">
        <li class="active"><a href="menu.jsp">홈</a></li>
        <button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown" text-align="center">관리자페이지
        <span class="caret"></span></button>
        <ul class="dropdown-menu">
        <li ><a href="addProduct.jsp">상품등록</a></li>
        <li><a href="productdemo2.jsp">상품편집</a></li>
        <li><a href="user1.jsp">회원수정</a></li>
        <li><a href="customerservice.jsp">게시판</a></li>
        </ul>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
        
      </ul>
    	</div>
    </div>
  </div>
</nav>


<div class="jumbotron">
<div class="container">
	<div class="display-3" align="center">
		<h2><b>게시판</b></h2>
	</div>
</div>
</div>

<div class="container-fluid">
      <div class="row-fluid dropdown">
        <div class="col-md-2">
          <div class="well sidebar-nav">
           <ul class="nav nav-list">
           <li class="nav-header">공지사항</li>
              <li><a href="test1.jsp">링크</a></li>
              <li><a href="test2.jsp">링크</a></li>
              <li><a href="test3.jsp">링크</a></li>
           
            	
             <li class="nav-header">공지사항2</li>
              <li><a href="#">링크</a></li>
              <li><a href="#">링크</a></li>
              <li><a href="#">링크</a></li>
              
             
           </ul> 
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
          <div class="hero-unit">
          	
            <h1>헬로우, 월드!</h1>
            <p>간단한 마케딩이나 정보 웹사이트를 위한 틀이다. 히어로 유닛이라는 커다란 공간과 세가지 부수적인 내용이 들어있다. 여러분 고유의 웹사이트를 만들 출발점으로 활용하라.</p>
            <p><a href="#" class="btn btn-primary btn-large">더 알아보기 <span class="en-font-family">»</span></a></p>
          </div>
         </div>
         </div>
         </div>
         <hr>
         
</body>
</html>

</html>