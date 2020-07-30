<%@page import="mvc.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId =(String)session.getAttribute("sessionId");
	List<BoardDTO> boardList = (List<BoardDTO>)request.getAttribute("boardList");
	int total_record=(Integer)request.getAttribute("total_record");
	int pageNum=(Integer)request.getAttribute("pageNum");
	int total_page=(Integer)request.getAttribute("total_page");
	//검색 조건 추가에 따른 조건,검색 내용 추가 받기
	String items = (String)request.getAttribute("items");
	String text = (String)request.getAttribute("text");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>제목</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>    
  .navbar {margin-bottom: 0; border-radius: 0;}    
   footer {background-color: #f2f2f2; padding: 25px;}    
  .carousel-inner img {width: 100%; margin: auto; min-height:200px;} 
  @media (max-width: 600px) {.carousel-caption {display: none;}}
  </style>
</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="container text-center">	
	<h1 class="display-3">게시판</h1>	
</div>
<div class="container">
	<form action="<c:url value="./BoardListAction.do"/>" method="post">
	<div>
		<div class="text-right">
			<span class="badge badge-success">전체<%=total_record %>건</span>
		</div>
	</div>
		<div style="padding-top:50px;">
			<table class="table table-hover">
			<tr>
				<th>번호</th><th>제목</th><th>작성일</th><th>조회</th><th>글쓴이</th>
			</tr>
			<%
					for(int i=0;i<boardList.size();i++){
						BoardDTO notice = boardList.get(i);
				%>
				<tr>
					<td><%=notice.getNum() %></td>
					<td><%=notice.getSubject() %></td>
					<td><%=notice.getRegist_day() %></td>
					<td><%=notice.getHit() %></td>
					<td><%=notice.getName() %></td>
				</tr>
				<% }%>			
			</table>
		</div>		
		<div align="center">
			<c:set var="pageNume" value="<%=pageNum %>"/>
			<c:forEach var="i" begin="1" end="<%=total_page %>">
				<a href="<c:url value="./BoardListAction.do?pageNum=${i}&items=${items}&text=${text}"/>">
					<c:choose>
						<c:when test="${pageNum==i}">
							<font color='4C5317'><b>[${i}]</b></font>
						</c:when>
						<c:otherwise>
							<font color='4C5317'>[${i}]</font>
						</c:otherwise>
					</c:choose>					
				</a>
			</c:forEach>
		</div><%-- 페이지 네이게이션 끝. --%>
		<%-- 검색조건 --%>
		<div>
			<table>
			<tr>
			<td width="100%" align="left">&nbsp;&nbsp;
				<select name="items" class="txt">
					<option value="subject">제목에서</option>
					<option value="content">내용에서</option>							
				</select>
				<input type="text" name="text">
				<input type="submit" value="검색" id="btnAdd" class="btn btn-primary">
			</td>
			<td width="100%" align="right">
			<a href="http://localhost:8080/Semi_Project/board/writeForm.jsp" onclick="checkForm(); return false" class="btn btn-primary">&laquo;글쓰기</a>
			</td>
			</tr>			
			</table>
		</div><%-- 검색조건 끝. --%>
	</form>
	<hr>
</div>
<jsp:include page="../footer.jsp"/>	
</body>
</html>