<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>

</style>
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

 
<!-- 전역변수(맴버변수,global변수) -->
<% 
	String greeting="Pet 쇼핑몰에 오신 것을 환영합니다."; 
	String tagline="Welcome to PET GALLERY!";
%>
<div class="col-sm-8 text-left"> 
      <h1>Welcome</h1>
      <p><h3>관리자페이지 입니다.</h3></p>
      <hr>
      <h3>Admin</h3>
      <p>관리자님 안녕하세요</p>
    </div>


	
<div class="container">	
	<div class="text-center">
		<h3><%=tagline %></h3>
		<%
			response.setIntHeader("Refresh", 1);
			Date day = new java.util.Date();
			String am_pm;
			int hour=day.getHours();
			int minute=day.getMinutes();
			int second=day.getSeconds();
			if(hour/12==0){//정수/정수=정수
					am_pm="AM";
			}else{
				am_pm="PM";
				hour=hour-12;//15-12=3;
			}
			DecimalFormat df1 = new DecimalFormat("00");
			String CT = df1.format(hour)+":"+df1.format(minute)+":"+df1.format(second)+am_pm;
			out.print("현재 접속 시간: "+CT+"<br>");
		%>
	</div>	
	<hr>
</div>
<%@ include file="footer.jsp" %>
         
    
       

</body>
</html>

