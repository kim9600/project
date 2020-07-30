<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
	<h1 class="display-3">글쓰기</h1>	
</div>
<div class="container">
<form name="newProduct" action="./processAddProduct.jsp"
	  class="form-horizontal" method="post" enctype="multipart/form-data">

<div class="form-group row">
	<label class="col-sm-2">성명</label>
	<div class="col-sm-3">
		<input type="text" name="wirter" id="writer" class="form-control">
	</div>
</div>

<div class="form-group row">
	<label class="col-sm-2">제목</label>
	<div class="col-sm-5">
		<input type="text" name="title" id="title" class="form-control">
	</div>
</div>


<div class="form-group row">
	<label class="col-sm-2">내용</label>
	<div class="col-sm-7">
		<textarea rows="10" cols="50" name="contents" id="contents" class="form-control" ></textarea>
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
<jsp:include page="../footer.jsp"/>
</body>
</html>