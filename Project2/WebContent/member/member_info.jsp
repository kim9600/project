<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../dbconn.jsp" %> 
<jsp:include page="../menu.jsp"/>
<% String id= request.getParameter("id");
	String sql="select * from member where id=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs= pstmt.executeQuery();
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
</head>
<body>

<table border=1 style="width: 300">
 <tr align=center><td>아이디:</td><td><%=rs.getString("id") %></td></tr>
 <tr align=center><td>비밀번호 : </td><td><%=rs.getString("password") %></td></tr> 
 <tr align=center><td>나이:</td><td><%=rs.getString("name") %></td></tr>
 <tr align=center><td>성별:</td><td><%=rs.getString("gender") %></td></tr>
 <tr align=center><td>이메일 주소:</td><td><%=rs.getString("birth") %></td></tr> 
 <tr align=center><td>이메일 주소:</td><td><%=rs.getString("mail") %></td></tr> 
 <tr align=center><td>이메일 주소:</td><td><%=rs.getString("phone") %></td></tr> 
 <tr align=center><td>이메일 주소:</td><td><%=rs.getString("postcode") %></td></tr> 
 <tr align=center><td>이메일 주소:</td><td><%=rs.getString("address") %></td></tr> 
 <tr align=center><td>이메일 주소:</td><td><%=rs.getString("detailAddress") %></td></tr> 
 <tr align=center><td>이메일 주소:</td><td><%=rs.getString("extraAddress") %></td></tr> 
 <tr align=center><td>이메일 주소:</td><td><%=rs.getString("regist_day") %></td></tr> 
 <tr align=center><td colspan=2><a href="member_list.jsp">리스트로 돌아가기</a></td>
</table>

</body>
</html>
