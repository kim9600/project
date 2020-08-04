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
        <li><a href="${pageContext.request.contextPath}/history.jsp">회사소개</a></li>
         <li class="active"><a href="#">오시는 길</a></li>  
              
      </ul><br>      
    </div>
    <div class="col-sm-9 ">
    
      <h4><small>Pet Gallery</small></h4>
      <hr>
      <h2>오시는길</h2>

      <div class="container">
    <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.149535031833!2d127.02842879573537!3d37.4927337658823!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca150a056cc85%3A0x3e69b34abbd6445c!2z7KSR7JWZ7KCV67O07LKY66as7ZWZ7JuQ!5e0!3m2!1sko!2skr!4v1590057997505!5m2!1sko!2skr"
            width="300" height="300" frameborder="300" style="border:0;" allowfullscreen="" aria-hidden="false"
            tabindex="0"></iframe>
        <div id="adiv">
        <br>
            <h3>주소</h3>
            <br>
            <span>서울 강남구 테헤란로7길 7 에스코 빌딩 7층</span>
            <br><br>
            <br>
              <div> <span><img src="./resources/images/phone.png"  width="30" height="30" alt="phonenumber"><a href="tel:02-123-4567"> 02-123-4567</a> </span><br><br><br></div> 
               <div> <span><img src="./resources/images/fax.png" width="30" height="30" alt="faxnumber"><a href="tel:02-123-4567"> 02-123-4567</a></span><br><br><br> </div> 
               <div>  <span><img src="./resources/images/email.png" width="30" height="30" alt=""><a href="mailTo:abc@google.com"> petgallary@google.com</a></span><br></div> 
   
      </div>
    </div>

  </div>
</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>