<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>

</head>
<body>
<%
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i=0;i<cookies.length;i++){
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			if(n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			if(n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			if(n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			if(n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			if(n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
	}

	con.setAutoCommit(false);
	Date saleDate = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	//delivery 테이블저장
	try{
		String sql = "insert into delivery(sessionId,name,deliverydate,nation,zipcode,address)"
								+" values(?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, shipping_cartId);
		pstmt.setString(2, shipping_name);
		pstmt.setString(3, shipping_shippingDate);
		pstmt.setString(4, shipping_country);
		pstmt.setString(5, shipping_zipCode);
		pstmt.setString(6, shipping_addressName);
		pstmt.executeUpdate();
		
		//sale 테이블에 저장
		sql = "insert into sale(saledate,sessionId,productId,unitprice,saleqty,status) values(?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);

		ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist"); 
		for(int i=0;i<list.size();i++){ 
			pstmt.setString(1, sdf.format(saleDate));
			pstmt.setString(2, shipping_cartId);
			pstmt.setString(3, list.get(i).getProductId()); 
			pstmt.setInt(4, list.get(i).getUnitPrice()); 
			pstmt.setInt(5, list.get(i).getQuantity());
			pstmt.setInt(6, 1);
			pstmt.executeUpdate();
		} 
		//db에 반영
			con.commit();
	}catch(Exception e){
		//이전 상태로 되돌리기
		con.rollback();		
	}finally{
		con.setAutoCommit(true);
		/* if(con != null) con.close(); */
	}
%>
<jsp:include page="menu2.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">주문완료</h1>
	</div>
</div>
<div class="container">
	<h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>
	<p> 주문은 <%=shipping_shippingDate %>에 배송된 예정입니다!
	<p> 주문번호 : <%=shipping_cartId %>
</div>
<div class="container">
	<p><a href="./products.jsp" class="btn btn-success">&laquo;상품목록</a>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
<%
	//세션정보 삭제
	session.invalidate();
	//쿠키에 저장된 장바구니 정보 삭제
	for(int i=0;i<cookies.length;i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		//쿠키 유효기간 설정 0(즉시삭제)
		if(n.equals("Shipping_cartId"))       thisCookie.setMaxAge(0);
		if(n.equals("Shipping_name"))         thisCookie.setMaxAge(0);
		if(n.equals("Shipping_shippingDate")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_country"))      thisCookie.setMaxAge(0);
		if(n.equals("Shipping_zipCode"))      thisCookie.setMaxAge(0);
		if(n.equals("Shipping_addressName"))  thisCookie.setMaxAge(0);
		
		//응답객체 추가
		response.addCookie(thisCookie);
	}
%>