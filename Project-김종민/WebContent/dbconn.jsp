<%@page import="java.sql.DriverManager"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection con = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ShoppingDB?useSSL=false",
																			"root",
																			"1234");
 	} catch (Exception e) {
 		out.print("데이타베이스 연결에 실패했습니다.<br>");
		out.print("Excption:"+e.getMessage());
	}
%>