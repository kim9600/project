<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String categoryName = request.getParameter("categoryName");
	String description  = request.getParameter("description");
	//db에 저장
	//쿼리객체 생성
	String sql = "insert into category(categoryName,description) values(?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	//바인딩변수 설정
	pstmt.setString(1, categoryName);
	pstmt.setString(2, description);
	//입력실행
	pstmt.executeUpdate();
	//자원해제
	if(pstmt != null) pstmt.close();
	if(con != null) con.close();

	response.sendRedirect("./products.jsp");

%>

