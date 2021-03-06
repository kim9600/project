<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>카테고리등록</title>
<script>
function check(){
	alert('등록되었습니다');
}
</script>
</head>
<body>
<%
	String sql="select * from category";
	PreparedStatement pstmt=con.prepareStatement(sql);
	ResultSet rs= pstmt.executeQuery();

		

	
	%>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">카테고리등록</h1>
		</div>
	</div>
<table class="table table-hover col-sm-4" border="1" style="width: 150px">


<tr>
<th align="center">카테고리(이름-설명)</th>
</tr>
<tr>
<% while(rs.next()){ %>
<td>
  <%=rs.getString("categoryName")%>:<br><%=rs.getString("description") %>
</td>
 </tr>
 <%} %>
</table>
<br>
	<div class="container" align="left">
		<form action="processAddCategory.jsp" method="post" class="form-horizontal"> 
			<div class="form-group-row">
				<label class="col-sm-2">카테고리명</label> 
				<div class="col-sm-3"> 
					<input type="text" name="categoryName" id="categoryName" class="form-control"> 
				</div>
			</div>
			<div class="form-group-row">
				<label class="col-sm-2">카테고리설명</label> 
				<div class="col-sm-3">
					<input type="text" name="description" id="description" class="form-control"> 
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
				<br><br>
					<input type="submit" class="btn btn-primary" value="등록" onclick="check()">
					<input type="reset" class="btn btn-primary" value="취소">
				</div>
			</div>
		</form>
	</div>
</body>
<jsp:include page="footer.jsp"/>
</html>
