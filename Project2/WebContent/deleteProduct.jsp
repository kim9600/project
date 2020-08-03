<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	//파라미터로 넘어온 상품id를 받아서 db에서 삭제처리
	String id=request.getParameter("p_id");
	String sql="delete from product where p_id=?";
	con.setAutoCommit(false);
	PreparedStatement pstmt =con.prepareStatement(sql);
	pstmt.setString(1, id);
	//삭제처리
	//executeUpdate()리턴값은 삭제된 행의 수
	int result =pstmt.executeUpdate(); //mysql -> select 할땐 resultset 사용해서 executeQuery 사용
									//delete,update,insert 할땐 executeUpdate 사용(int값)
	//삭제된 행의 수가 있으면 db에 반영								
	if(result>0) con.commit();
	//삭제된 행의 수가 없으면 되돌림.
	if(result==0) con.rollback();
	con.setAutoCommit(true);
	
	//이전페이지로 돌아가기
	response.sendRedirect("./editProduct.jsp?edit=delete");
%>