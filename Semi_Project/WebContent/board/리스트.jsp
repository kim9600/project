<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>제목</title>
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
  <h3>게시판</h3><br>
  <div class="carousel-inner">
    <div class="col-sm-5">
  	<table class="table table-hover">
  	<tr>
  		<th>번호</th><th>제목</th><th>작성일</th><th>조회</th><th>글쓴이</th>
  	</tr>
  	<tr>
	  	<td>내용</td>
	  	<td>내용</td>
	  	<td>내용</td>
	  	<td>내용</td>
	  	<td>내용</td>
  	</tr>
  	</table>
    </div>
  </div>
 </div> 
<jsp:include page="../footer.jsp"/>
</body>
</html>