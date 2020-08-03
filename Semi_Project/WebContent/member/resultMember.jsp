<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    .navbar {margin-bottom: 0; border-radius: 0;}    
   footer {background-color: #f2f2f2; padding: 25px;}    
  .carousel-inner img {width: 100%; margin: auto; min-height:200px;} 
  @media (max-width: 600px) {.carousel-caption {display: none;}}
  h1{color: green;}
  </style>
<title>회원 정보</title>
</head>
<body>
<jsp:include page="../menu.jsp"/>
	<div class="container">
	   <h1 class="display-3">회원정보</h1>
	</div>
<div class="container" align="center">
<% String msg=request.getParameter("msg");
 if(msg!=null){
   if(msg.equals("0")){
   out.print("<h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
    }else if(msg.equals("1")){
   out.print("<h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
    }else if(msg.equals("2")){
    	String loginId=(String)session.getAttribute("sessionId");
    	out.print("<h2 class='alert alert-danger'>"+loginId+"님 환영합니다.</h2>");
    }
   }else{
	  out.print("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>"); 
   }
%>

</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>