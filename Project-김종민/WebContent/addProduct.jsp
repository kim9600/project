<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>  
<%
	String sql = "select concat('P',cast(substr(max(p_id),2) as unsigned)+1) from product";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	String pid = "";
	if(rs.next()) pid = rs.getString(1).trim();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script src="./resources/js/validation.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">상품목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">로그아웃</a>
		</div>
		<form name="newProduct" action="./processAddProduct.jsp"
			  class="form-horizontal" method="post" enctype="multipart/form-data">
		
			<div class="form-group row">
				<label class="col-sm-2">삼품코드</label>
				<div class="col-sm-3">
					<input type="text" name="productId" id="productId" class="form-control" value="<%=pid%>" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="pname" id="pname" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" id="unitPrice" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상세설명</label>
				<div class="col-sm-5">
					<textarea rows="2" cols="50" name="description" id="description" class="form-control" required></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" id="manufacturer" class="form-control" required>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
				<select name="category" class="form-control" id="category">
				<%
					sql = "select categoryName from category order by seq";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
				%>
				<%
					while(rs.next()){
						out.print("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
					}
				%>
				</select>		
				</div>
			</div>
			<%
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			%>
			<div class="form-group row">
				<label class="col-sm-2">재고수</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" id="unitsInStock" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-3">
					<input type="radio" name="condition" value="New" checked>소형견
					<input type="radio" name="condition" value="Old"        >중형견
					<input type="radio" name="condition" value="Referbished">대형견
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
					<input type="submit" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>