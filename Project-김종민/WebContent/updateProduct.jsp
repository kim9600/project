<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">상품수정</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script src="./resources/js/validation.js"></script>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-4">상품수정</h1>
	</div>
</div>
<div class="container">
	<%@ include file="dbconn.jsp" %>
	<%
		String p_id = request.getParameter("id");
		System.out.println("p_id:"+p_id);
		String sql = "select * from product where p_id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, p_id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		//category값 저장
		String category = rs.getString("p_category");
		//상태값 저장
		String condition = rs.getString("p_condition");
	%>
	<form name="newProduct" action="./processUpdateProduct.jsp"
		  class="form-horizontal" method="post" enctype="multipart/form-data">
	
		<div class="form-group row">
			<label class="col-sm-2">상품코드</label>
			<div class="col-sm-3">
				<input type="text" name="productId" id="productId" class="form-control" value="<%=rs.getString("p_id")%>" readonly>
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">상품명</label>
			<div class="col-sm-3">
				<input type="text" name="pname" id="pname" class="form-control" value="<%=rs.getString("p_name")%>">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">가격</label>
			<div class="col-sm-3">
				<input type="text" name="unitPrice" id="unitPrice" class="form-control" value="<%=rs.getInt("p_unitPrice")%>">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">상세설명</label>
			<div class="col-sm-5">
				<textarea rows="2" cols="50" name="description" id="description" class="form-control" required><%=rs.getString("p_description") %></textarea>
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">제조사</label>
			<div class="col-sm-3">
				<input type="text" name="manufacturer" id="manufacturer" class="form-control" required value="<%=rs.getString("p_manufacturer")%>">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">분류</label>
			<div class="col-sm-3">
 				<select name="category" class="form-control" id="category">
				<%
					String sql2 = "select categoryName from category order by seq";
					PreparedStatement pstmt2 = con.prepareStatement(sql2);
					ResultSet rs2 = pstmt2.executeQuery();
				%>
				<%
					while(rs2.next()){
						out.print("<option value='"+rs2.getString(1)+"'"
																	 	   +(rs2.getString(1).equals(category)?"selected":"")+">"
																			 +rs2.getString(1)+"</option>");
					}
				%>
				</select>		
			</div>
		</div>
			<%
			if(rs2 != null) rs2.close();
			if(pstmt2 != null) pstmt2.close();
		%>
		<div class="form-group row">
			<label class="col-sm-2">재고수</label>
			<div class="col-sm-3">
				<input type="text" name="unitsInStock" id="unitsInStock" class="form-control" value="<%=rs.getLong("p_unitsInStock")%>">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">상태</label>
			<div class="col-sm-3">
				<input type="radio" name="condition" value="New"
				                                     <%=condition.equals("New")?"checked":""%>>소형견
				<input type="radio" name="condition" value="Old"
																						 <%=condition.equals("Old")?"checked":""%>>중형견
				<input type="radio" name="condition" value="Referbished"
				                                     <%=condition.equals("Referbished")?"checked":""%>>대형견
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">이미지</label>
			<div class="col-sm-5">
				<input type="file" name="productImage" class="form-control">
			</div>
		</div>
		
		<div class="form-group row">	
			<div class="col-sm-offset-2 com-sm-10">
				<input type="submit" class="btn btn-primary" value='등록' onclick="CheckAddProduct()">
			</div>
		</div>
	</form>
</div>
<%
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(con != null) con.close();
%>
<jsp:include page="footer.jsp"/>
</body>
</html>