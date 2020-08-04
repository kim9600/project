<%@page import="com.sun.xml.internal.bind.v2.runtime.Name"%>
<%@page import="javax.management.relation.Role"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <% /* 로그인 여부확인  */
	String sessionId=(String)session.getAttribute("sessionId");
   String search=request.getParameter("search");
  	
 
%>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  
  </style>
<html>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/home.jsp">PET GALLERY</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회사소개 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="contacts.jsp">오시는길</a></li>
          <li><a href="history.jsp">연혁</a></li>         
        </ul>
      </li>
      <li><a href="products.jsp">전체 상품</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">멍이<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${pageContext.request.contextPath}/productsDog.jsp">멍이용품</a></li>
    
        </ul>
      </li>
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">냥이<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${pageContext.request.contextPath}/productsCat.jsp">냥이용품</a></li>
          
        </ul>
      </li>
     
      <li><a href="${pageContext.request.contextPath}/BoardListAction.do">게시판</a></li>
    </ul>
      <ul class="nav navbar-nav navbar-right">
      <c:choose>
      
       <c:when test="${empty sessionId}">
       
      <li><a href="${pageContext.request.contextPath}/member/loginMember.jsp"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
      <li><a href="${pageContext.request.contextPath}/member/addMember.jsp"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
      </c:when>
       <c:otherwise>
       	<li style="padding-top:7px;color:white">[<%=sessionId%>님]</li>
       	<%if(sessionId.equals("admin")) {
       		
       	%>
       	<li class="nav-item"><a class="nav_link" href="${pageContext.request.contextPath}/admin.jsp">관리자계정</a>
       	<%} %>
        <li class="nav-item"><a class="nav-link" 
       		href='${pageContext.request.contextPath}/member/logoutMember.jsp'>로그아웃</a>
       	<li class="nav-item"><a class="nav-link" 
       		href="${pageContext.request.contextPath}/member/updateMember.jsp">회원수정</a>
       </c:otherwise>
     </c:choose>  
</ul>
	<form class="navbar-form navbar-left" action="products_search.jsp">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>

  </div>  
</nav>
  
</body>
</html>