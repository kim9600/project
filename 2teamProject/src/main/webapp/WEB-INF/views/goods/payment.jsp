<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/css.jsp" %>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>






<div class="text-center">
<h2>${userName2}님 </h2><br>
<h2>거래가 정상적으로 완료되었습니다.</h2>
<h4>이용해주셔서 감사합니다.</h4>

<h4>결제번호= ${getOrder.order_id}</h4>
<h4>결제금액=${getOrder.amount}</h4>
<h4>결제일자= <fmt:formatDate value="${getOrder.order_date}" pattern="yyyy-MM-dd"/></h4>
<button class="btn btn-default"><a href="/">돌아가기</a></button>
<button class="btn btn-default"><a href="/goods/orderList">주문내역 조회</a></button>


</div>
</body>
</html>


 
