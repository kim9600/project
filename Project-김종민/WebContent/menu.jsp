<%@ page contentType="text/html; charset=UTF-8"%>
<%
   /* 로그인 여부확인  */
	String sessionId=(String)session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
  <div class="container">
     <div class="navbar-header">
       <a class="navbar-brand" href="${pageContext.request.contextPath}/welcome.jsp">Home</a>
     </div>
    <ul class="navbar-nav mr-auto">
<%--      <c:choose>  
       <c:when test="${empty sessionId}">
       	<li class="nav-item"><a class="nav-link" 
       	    href='${pageContext.request.contextPath}/member/loginMember.jsp'>로그인</a>
       	<li class="nav-item"><a class="nav-link" 
       	    href='${pageContext.request.contextPath}/member/addMember.jsp'>회원가입</a>
       </c:when>
       <c:otherwise>
       	<li style="padding-top:7px;color:white">[<%=sessionId%>님]</li>
       	<li class="nav-item"><a class="nav-link" 
         		href='${pageContext.request.contextPath}/member/logoutMember.jsp'>로그아웃</a>
       	<li class="nav-item"><a class="nav-link" 
        		href="${pageContext.request.contextPath}/member/updateMember.jsp">회원수정</a>
       </c:otherwise>
     </c:choose>   --%>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/products.jsp"   >상품목록</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/addProduct.jsp" >상품등록</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/editProduct.jsp?edit=update">상품수정</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/editProduct.jsp?edit=delete">상품삭제</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/addCategory.jsp">카테고리등록</a>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/BoardListAction.do?pageNum=1">게시판</a>
    </ul>
	</div>
</nav>
