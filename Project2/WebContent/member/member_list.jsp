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

<table border=1 style="width: 300">
 <tr align=center><td colspan=2>회원목록</td></tr>
<% while(rs.next()){ %>
  <tr align=center>
   <td>
    <a href="member_info.jsp?id=<%=rs.getString("id") %>">
     <%=rs.getString("id")%>
    </a>
   </td>
   <td><a href="member_delete.jsp?id=<%=rs.getString("id") %>">삭제</a></td>
  </tr>
 <%} %>
</table>

</body>
</html>
