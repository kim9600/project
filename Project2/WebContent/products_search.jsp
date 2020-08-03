<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="menu2.jsp"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="jumbotron">
<div class="container">
	<div class="display-3" align="center">
		<h2><b>상품 검색 결과</b></h2>
	</div>
</div>
</div> <!-- 점보트론 끝 -->
<%@include file="dbconn.jsp" %>

<% 
	request.setCharacterEncoding("utf-8");
	String search=request.getParameter("search");
	String sql= "select * from product where p_name like ?";
	PreparedStatement pstmt =con.prepareStatement(sql);
	pstmt.setString(1, "%"+search+"%");
	ResultSet rs= pstmt.executeQuery();
	while(rs.next()){
	
   
 	
		
		
			
		
			
		
 	
 
	
	%>

	<!--  이미지 src경로를 프로젝트에 resource/images 경로말고 다른경로 확인필요 -->
	

	  <div class="col-md-4">
		<img src="./resources/images/<%=rs.getString("p_fileName")%>" style="width:100%">
		
			<h3><%=rs.getString("p_name")%></h3>
			<p><%=rs.getString("p_description")%></p>
			<p><%=rs.getInt("p_unitPrice") %></p>
			<p><a href="./product.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-secondary" role="button">상세정보&raquo;</a>
			</p>
		</div>  
<%} %>
<%
if(rs!=null) rs.close();
if(pstmt!=null) pstmt.close();
if(con!=null) con.close();
%>
</body>
</html>