<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<style>
b{color: blue;}
#target{color:purple;}
</style>
  <title>PET GALLERY</title>
  <meta charset="utf-8">
<jsp:include page="menu2.jsp"/>
</head>
<body>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="./resources/images/dog_n_cat.png" alt="Image" >
        <div class="carousel-caption">
          <h3>PET GALLERY에 오신 것을 환영합니다.</h3>
          <p>PET GALLERY만의 다양한 상품과 혜택을 만나보세요!</p>
        </div>      
      </div>

      <div class="item">
        <img src="./resources/images/dog_n_cat.png" alt="Image" />
        <div class="carousel-caption">
          <h3>도전하는 PET GALLERY</h3>
          <p>한 걸음,한 걸음 씩, 빠르진 않아도 더 나은 내일을 향해 노력합니다.</p>
        </div>      
      </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
    </div>
<div class="container text-center">    
  <h3 id="target">추천 상품 </h3><br>
  <div class="row">
    <div class="col-sm-4">
      <a href="productsDog.jsp">
      <img src="./resources/images/dogfood.jpg" class="img-responsive" style="width:100%" alt="Image">
      <p><b>★ 주문 1위 ★</b> 강아지 사료</p>
      </a>
    </div>
    <div class="col-sm-4"> 
      <a href="productsCat.jsp">
      <img src="./resources/images/catToy.jpg" class="img-responsive" style="width:100%" alt="Image">
      <p>고양이 깃털 장난감</p>    
      </a>
    </div>
    <div class="col-sm-4">
      <div class="well">
       <h4><b>은행정보</b></h4>
      예금주 : (주)펫샵<br>
      국민93456-707070<br>
      우리1005-486-717171<br>         
      </div>
      <div class="well">
      <h4><b>고객센터</b></h4>
     <h3 class="text-danger"><b>1688-7079</b></h3>
      근무시간안내
      평일10:00~18:00<br>
      (점심시간 12:00 ~ 13:00)<br>
      토요일10:00~13:00<br>
      일요일 및 공휴일은 휴무입니다.

      </div>
    </div>
  </div>
</div><br>
<jsp:include page="footer.jsp"/>
</body>
</html>