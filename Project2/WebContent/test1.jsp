<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu2.jsp"/>

<div class="jumbotron">
<div class="container">
	<div class="display-3" align="center">
		<h2><b>상품 목록</b></h2>
	</div>
</div>
</div>

<%@include file="dbconn.jsp" %>
<%
	String sql="select * from product order by p_id";
	PreparedStatement pstmt=con.prepareStatement(sql);
	ResultSet rs= pstmt.executeQuery();
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
			<p><%=rs.getInt("p_unitPrice") %></p>
			<p><a href="./product.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-secondary" role="button">상세정보&raquo;</a>
			</p>
		</div>
		
	<%
	}
	%>
</div>
<hr>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>