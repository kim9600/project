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
<jsp:include page="menu2.jsp"/>
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
    
      <h4>회사소개</h4>
      <ul class="nav nav-pills nav-stacked">        
        <li><a href="${pageContext.request.contextPath}/contacts.jsp">오시는 길</a></li>        
         <li class="active"><a href="#">연혁</a></li>
      </ul><br>      
    </div>
    <div class="col-sm-9 ">
    
      <h4><small>PET GALLERY</small></h4>
      <h2>연혁</h2>
      <hr>
      <img src="./resources/images/catanddog.jpg">
      
      
      <div class="container">
         PET GALLERY(펫 갤러리)는 2020년 오픈한 강아지와 고양이의 사료, 간식, 장난감 등을 판매하는 사이트입니다.
         신뢰할 수 있는 전문가들이 제안하는 국내 최대구색의 2,600 여가지의 반려동물 전문상품이 구비되어 있습니다.<br>
         
      또한, 새로운 가족을 만날 수 있는 분양실과 미용하는 모습을 직접 볼 수 있는 오픈된 뷰티샵, 피부타입에 맞는 스파 프로그램 및 서로 친구들을 만나
사회성을 기를 수 있는 놀이터, 쾌적하고 편안한 호텔, 그리고 반려동물과 함께 할 수 있는 카페가 구비되어 있습니다.
   </div>
</div>
<br>

</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>