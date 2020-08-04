<%@page import="dto.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ page errorPage="exceptionNoProductid.jsp" %>
 <%@ include file="dbconn.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>상품상세정보</title>
<script>
/* javascript 함수 선언 function 함수명(){실행문}*/
function addToCart(){
	if(confirm("상품을 장바구니에 추가하시겠습니까?")){
		document.addForm.submit();
	}else{
		document.addForm.reset();
	}
}
</script>

<jsp:include page="menu.jsp"/>
<body>
<div class="jumbotron">
	<div class="container">
	<div class="display-3"><h1>상품정보</h1></div>
	</div>
</div>
<%
	String id=request.getParameter("id");
	System.out.println("넘어온 id:"+id);
	String sql="select * from product where p_id=?";
	PreparedStatement pstmt= con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs= pstmt.executeQuery();
	Product product= new Product();
	if(rs.next()) {
		product.setProductId(rs.getString(1));
		product.setPname(rs.getString(2));
		product.setUnitPrice(rs.getInt(3));
		product.setDescription(rs.getString(4));
		product.setCategory(rs.getString(5));
		product.setManufacturer(rs.getString(6));
		product.setUnitsInStock(rs.getLong(7));
		product.setCondition(rs.getString(8));
		product.setFilename(rs.getString(9));
	}
	if(rs!=null) rs.close();
	if(pstmt!=null) pstmt.close();
	if(con!=null) con.close();
	
%>
<div class="container">
<div class="row">
	<div class="col-md-5">
<img src="./resources/images/<%=product.getFilename()%>" style="width: 100%"/>
	</div>
<div class="col-md-6">


<h3><%=product.getPname() %></h3>
<p><%=product.getDescription() %></p>
<p><b>상품코드:</b><span class="badge badge-danger"><%=product.getProductId() %> </span>
<p><b>제조사</b>:<%=product.getManufacturer() %>
<p><b>분류</b>:<%=product.getCategory() %>
<p><b>재고수</b>:<%=product.getUnitsInStock() %>
<h4><%=product.getUnitPrice() %>원</h4>
<p><form name="addForm" action="./addCart.jsp?id=<%=product.getProductId()%>" method="post">

<a href="#" class="btn btn-info" onclick="addToCart()">상품주문&raquo;</a>
<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
<a href="./products.jsp" class="btn btn-success">상품 목록&raquo;</a>
</form>
</div>
</div>
</div><!-- container 끝 -->
<jsp:include page="footer.jsp"/>

</body>
</html>