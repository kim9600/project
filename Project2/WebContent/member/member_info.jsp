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
<title>회원관리</title>
</head>
<body>
<div class="jumbotron">
  <div class="container">
     <h1 class="display-3">회원정보</h1>
  </div>
</div>
<div class="container">
   <div style="padding-top:50px;">
      <table class="table table-bordered" >   
          <tr align=center><td><b>아이디:</b></td><td><%=rs.getString("id") %></td></tr>
          <tr align=center><td><b>비밀번호 :</b></td><td><%=rs.getString("password") %></td></tr> 
          <tr align=center><td><b>나이:</b></td><td><%=rs.getString("name") %></td></tr>
          <tr align=center><td><b>성별:</b></td><td><%=rs.getString("gender") %></td></tr>
          <tr align=center><td><b>생년월일:</b></td><td><%=rs.getString("birth") %></td></tr> 
          <tr align=center><td><b>이메일 주소:</b></td><td><%=rs.getString("mail") %></td></tr> 
          <tr align=center><td><b>전화번호:</b></td><td><%=rs.getString("phone") %></td></tr> 
          <tr align=center><td><b>우편번호:</b></td><td><%=rs.getString("postcode") %></td></tr> 
          <tr align=center><td><b>주소:</b></td><td><%=rs.getString("address") %></td></tr> 
          <tr align=center><td><b>상세주소:</b></td><td><%=rs.getString("detailAddress") %></td></tr> 
          <tr align=center><td><b>참고:</b></td><td><%=rs.getString("extraAddress") %></td></tr> 
          <tr align=center><td><b>가입일자:</b></td><td><%=rs.getString("regist_day") %></td></tr> 
          <tr align=center><td colspan=2><a href="member_list.jsp">리스트로 돌아가기</a></td>
      </table>
   </div>
</div>
</body>
</html>