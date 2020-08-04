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
      <h4>Pet Gallery</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">회사소개</a></li>        
        <li><a href="./contacts.jsp">오시는길</a></li>        
      </ul>   
    </div>

    <div class="col-sm-9">
      <h4><small>Pet Gallery</small></h4>
      <hr>
      <h2><b>회사 소개</b></h2>      
      <h5><span class="label label-danger">Pet</span> <span class="label label-primary">Gallery</span></h5><br>
      <p> Pet Gallery는 비약적인 발전을 거쳐 명실상부한 애견용품 업계 1위 기업으로 성장하게 되었습니다.
             이는 믿음, 신뢰라는 사훈을 바탕으로 한 지속적인 소비자와의 소통과 니즈를 파악하여 믿음과 신뢰를 얻을 수 있는 다양한 방법으로 열정적으로 추진한 결과라고 감히 생각합니다.      
                      닷컴 붐이 일면서 지난 17년간 수많은 애완용품 온라인 업체가 우후죽순처럼 생겨났지만 현재 명맥을 유지하고 있는 업체는 손에 꼽을 정도 입니다.
                      이는 고객 여러분께 믿음과 신뢰를 얻지 못한 결과라고 생각합니다. 펫 갤러리는 미래를 선도하는 기업, 끝까지 믿을 수 있고 신뢰받을 수 있는 기업이 되기 위해 
                      현재의 성장에 안주하지 않고 끊임없는 시스템개발, 내/외부 혁신을 통하여 더 굳건한 믿음과 신뢰를 드릴 수 있는 기업이 되기 위해 더욱 매진할 것을 약속드립니다.</p>
      <br><br>      
      
      <hr>
      <h2><b>Business Area</b></h2>
      <h3>신뢰와 믿음을 바탕으로 프리미엄 토탈 펫 서비스를 지향합니다.</h3>      
      <div>
         <img src="./resources/images/service.png" alter="Service">
      </div>
      <hr>
      
       <h2><b>Have Fun!</b></h2>
       <h3>가장 재미있고, 가장 새롭고, 가장 창조적으로 최고의 서비스를 제공하겠습니다.</h3>
       <div class="container-fluid">        
        <div class="row">
          <div class="col-sm-4" align="center">
             <img src="./resources/images/pet1.jpg" width="200" height="200" align="middle"><br>
             <h3>고객감동</h3><br>
             <p>고객이 원하는 가치와 서비스를 창출하여 고객에게 진정한 감동을 선사합니다.</p>             
          </div>
          <div class="col-sm-4" align="center">
             <img src="./resources/images/pet2.jpg" width="200" height="200" align="middle">
             <h3>직원행복</h3><br>
             <p>펫갤러리 가족의 보다나은 행복을 위해 언제나 노력합니다.</p>      
          </div>
          <div class="col-sm-4" align="center">
             <img src="./resources/images/pet3.jpg" width="200" height="200" align="middle">
             <h3>사회공헌</h3><br>
             <p>따뜻한 세상을 위해 펫갤러리만의 차별하된 사회공헌 활동으로 가치를 나눕니다.</p>      
          </div>
          </div>
      </div> 
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>