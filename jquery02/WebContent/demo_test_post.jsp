<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name=request.getParameter("name");
	String city=request.getParameter("city");
	String age=request.getParameter("age");
	String job=request.getParameter("job");
%>
<%="Dear "+name+". Hope you live well in "+city+" and your age is "+age+" and your job is "+job %>
