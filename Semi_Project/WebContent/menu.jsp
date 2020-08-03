<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <% /* 로그인 여부확인  */
	String sessionId=(String)session.getAttribute("sessionId");
%>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/home.jsp">Pet SHOP</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/company.jsp">회사소개 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${pageContext.request.contextPath}/company.jsp">오시는길</a></li>
          <li><a href="${pageContext.request.contextPath}/company.jsp">연혁</a></li>         
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">강아지 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">사료</a></li>
          <li><a href="#">간식</a></li>
          <li><a href="#">장난감</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">고양이 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">사료</a></li>
          <li><a href="#">모래</a></li>
          <li><a href="#">간식</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
      <li><a href="${pageContext.request.contextPath}/BoardListAction.do">게시판</a></li>
    </ul>
      <ul class="nav navbar-nav navbar-right">
        <c:choose>  
       <c:when test="${empty sessionId}">
      <li><a href="${pageContext.request.contextPath}/member/addMember.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${pageContext.request.contextPath}/member/loginMember.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
</c:when>
       <c:otherwise>
       	<li style="padding-top:7px;color:white">[<%=sessionId%>님]</li>
       	<li class="nav-item"><a class="nav-link" 
       		href='${pageContext.request.contextPath}/member/logoutMember.jsp'>로그아웃</a>
       	<li class="nav-item"><a class="nav-link" 
       		href="${pageContext.request.contextPath}/member/updateMember.jsp">회원수정</a>
       </c:otherwise>
     </c:choose>  
</ul>
	<form class="navbar-form navbar-left" action="/action_page.php">
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