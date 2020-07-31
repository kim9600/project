<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
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
<title>페이지 오류</title>
</head>
<body>
<jsp:include page="menu2.jsp"/>

  <div class="container">
	 <h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
  </div>
<div class="container">
<p><%=request.getRequestURL()%><p>
<p><a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>