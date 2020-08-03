<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../dbconn.jsp" %> 
<jsp:include page="../menu.jsp"/>
<%
   String sql="select * from member";
   PreparedStatement pstmt=con.prepareStatement(sql);
   ResultSet rs= pstmt.executeQuery();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리 시스템</title>
</head>
<body>
<div class="jumbotron">
   <div class="container">
      <h1 class="display-3">회원목록</h1>
   </div>
</div>

<div class="container">
<div style="padding-top:50px;">
<table class="table table-hover">
<tr>
<th>회원아이디</th><th>정보</th><th>삭제</th>
</tr>
<% while(rs.next()){ %>
  <tr>
  <td><%=rs.getString("id")%></td>
  <td><a href="member_info.jsp?id=<%=rs.getString("id") %>"><span class="glyphicon glyphicon-search"></span></a></td>   
  <td><a href="member_delete.jsp?id=<%=rs.getString("id") %>"><span class="glyphicon glyphicon-trash"></span></a></td> 
  </tr>
 <%} %>
</table>
</div>
</div>
</body>
</html>