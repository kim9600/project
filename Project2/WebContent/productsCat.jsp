<%@page import="dao.ProductDAO1"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@include file="dbconn.jsp" %>
<%
	ProductDAO1 dao = ProductDAO1.getInstance();
	int total_record = dao.getProductCount("CAT");
	int total_page = 0; 
	if(total_record%10==0) {         //나머지가 없는 경우
	 total_page = total_record/10;   //정수/정수 = 정수
	}else {                          //나머지가 있는 경우
	 total_page = total_record/10;   //정수/정수 = 정수
	 total_page = total_page + 1;    //자투리가 있는 경우 한페이지 추가
	}
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
		String sql = "select * from product where p_category = ? order by p_id DESC";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "CAT");
		ResultSet rs = pstmt.executeQuery();
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				while(rs.next()){
			%>
				<div class="col-md-4">
					<img src="./resources/images/<%=rs.getString("p_fileName")%>" style="width:100%">
					<h3><%=rs.getString("p_name")%></h3>
					<p><%=rs.getString("p_description")%></p>
					<h5><%=new DecimalFormat("#,###").format(rs.getInt("p_unitPrice"))%>원</h5>
					<p><a href="./productSlideCat.jsp?id=<%=rs.getString("p_id")%>&category=CAT&pageNum=<%=pageNum%>"
								class="btn btn-success" role="button">상품상세명세&raquo;</a>
				</div>
			<%}%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>