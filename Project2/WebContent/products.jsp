<%@page import="dao.ProductDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@include file="dbconn.jsp" %>
<%
	ProductDAO dao = ProductDAO.getInstance();
	int total_record = dao.getProductCount();
	int total_page = dao.getProductPageCount();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품코드</title>
	
</head>
<body>
	<jsp:include page="menu2.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">상품목록</h1>
		</div>
	</div>

	<%
		int pageNum = 1;
		String sql = "select * from product order by p_id DESC";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				while(rs.next()){
			%>
				<div class="col-md-3 img-thumbnail" style="height: 432px">
					<img src="./resources/images/<%=rs.getString("p_fileName")%>" style=width:200px height="200px">
					<h3><%=rs.getString("p_name")%></h3>
					<p><%=rs.getString("p_description")%></p>
					<h5><%=new DecimalFormat("#,###").format(rs.getInt("p_unitPrice"))%>원</h5>
					<p><a href="./productSlide.jsp?id=<%=rs.getString("p_id")%>&pageNum=<%=pageNum%>"
								class="btn btn-success" role="button">상품상세정보&raquo;</a>
				</div>
			<%}%>
		</div>
		<hr>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>