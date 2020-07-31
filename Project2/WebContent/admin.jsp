<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<jsp:include page="menu.jsp"/>

<div class="jumbotron">
<div class="container">
	<div class="display-3" align="center">
		<h2><b>관리자 게시판</b></h2>
	</div>
</div>
</div>

<div class="container-fluid">
      <div class="row-fluid">
        <div class="col-md-2">
          <div class="well sidebar-nav">
           <ul class="nav nav-list">
           <li class="nav-header">공지사항</li>
              <li ><a href="#">문의글</a></li>
              <li><a href="#">링크</a></li>
              <li><a href="#">링크</a></li>
           
            	
             <li class="nav-header">공지사항2</li>
              <li><a href="#">링크</a></li>
              <li><a href="#">링크</a></li>
              <li><a href="#">링크</a></li>
              
             
           </ul>
           </div> 
          </div>
        </div>
        
        
        <div class="span9">
          <div class="hero-unit">
          	<div class="col-sm-9" height="500px">
          		<jsp:include page="home.jsp"/>
          	</div>
            
     
           
          
         </div>
         </div>
         </div>
         <hr>
         
</body>
</html>

</html>