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
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">
      	<img src="./resources/images/cat.jpg" height="30px" width="30px"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="menu.jsp">홈</a></li>
        <li><a href="#">about</a></li>
        <li><a href="products.jsp">상품정보</a></li>
        <li><a href="customerservice.jsp">고객센터</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="admin.jsp"><span class="glyphicon glyphicon-log-in"></span>Admin</a></li>
        <li><a href="./login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>

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
<a href="./products.jsp" class="btn btn-secondary">상품 목록&raquo;</a>
</form>
</div>
</div>
</div><!-- container 끝 -->
<jsp:include page="footer.jsp"/>

</body>
</html>