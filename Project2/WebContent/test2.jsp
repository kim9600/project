<%@page import="mvc.model.BoardDTO"%>
<%@page import="mvc.model.BoardDAO" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="dbconn.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<jsp:include page="menu.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
</head>
<body>
<div class="jumbotron">
<div class="container">
	<div class="display-3" align="center">
		<h2><b>관리자 페이지</b></h2>
	</div>
</div>
</div>
<div class="container-fluid">
      <div class="row-fluid">
        <div class="col-md-2">
          <div class="well sidebar-nav">
           <ul class="nav nav-list">
           <li class="nav-header">공지사항</li>
              <li ><a href="test2.jsp">문의글</a></li>
              <li><a href="#">링크</a></li>
              <li><a href="#">링크</a></li>
           
            	
             <li class="nav-header">공지사항2</li>
              <li><a href="#">링크</a></li>
              <li><a href="#">링크</a></li>
              <li><a href="#">링크</a></li>
              
             
           </ul>
           </div> 
          </div>
        </div>
   
       
          	<div class="col-sm-10">
		
		<iframe src="http://localhost:8080/Project2/BoardListAction.do"
		width="1200px" height="500px">
		
		</iframe>
	

</div>




</div>
</body>
</html>
