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
	String sql= "select p_name from product ";
	PreparedStatement pstmt =con.prepareStatement(sql);
	ResultSet rs =pstmt.executeQuery();
	int result=0;
     
 	while(rs.next()){ //이름 전부출력
		for(int i=0;i<rs.getString("p_name").length();i++){ //0~이름길이까지
			for(int j=i+1;j<=rs.getString("p_name").length();j++)	{
		if(rs.getString("p_name").substring(i, j).equals(search))
			result=1;	
			}
		}
 	out.print(search);
 	}
 	if(result==1){
		String sql2="select * from product";
		PreparedStatement pstmt2 =con.prepareStatement(sql2);
		ResultSet rs2=pstmt2.executeQuery();
	
	%>

	
	

	 <div class="col-md-4">
		<%-- <img src="./resources/imgaes/<%=rs2.getString("p_fileName")%>" style="width:100%"> --%>
		
			<h3><%=rs2.getString("p_name")%></h3>
			<p><%=rs2.getString("p_description")%></p>
			<p><%=rs2.getInt("p_unitPrice") %></p>
			<p><a href="./product.jsp?id=<%=rs2.getString("p_id")%>" class="btn btn-secondary" role="button">상세정보&raquo;</a>
			</p>
		</div>  
   <%
	}else{
%> 
 <h3>검색결과가 없습니다</h3>  
 <%	}
	


%>  

</body>
</html>