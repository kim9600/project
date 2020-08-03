<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message">
	<head>
	<meta charset="UTF-8">
	<title><fmt:message key="ordercancel"/></title>                                <!-- 주문 취소 -->
	
	</head>
	<body>
	<jsp:include page="menu2.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="ordercancel"/></h1>                <!-- 주문 취소 -->
		</div>
	</div>
	<div class="text-right">
		<a href="?language=ko"><fmt:message key="Korean"/></a>|
		<a href="?language=en"><fmt:message key="English"/></a>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary"> &laquo;<fmt:message key="list"/></a>  <!-- 상품 목록 -->
	</div>
	<jsp:include page="footer.jsp"/>
	</body>
</fmt:bundle>
</html>