<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>상품목록</title>
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
        <li><a href="product.jsp">상품정보</a></li>
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
	<h1 class="display-3">상품 목록</h1>
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