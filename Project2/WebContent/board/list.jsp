<%@page import="mvc.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
 String sessionId=(String)session.getAttribute("sessionId");
	List<BoardDTO> boardList =(List<BoardDTO>) request.getAttribute("boardlist");
	int total_record= (Integer)request.getAttribute("total_record");
	int pageNum= (Integer)request.getAttribute("pageNum");
	int total_page=(Integer)request.getAttribute("total_page");

	//검색조건 추가에 따른 조건,검색내용 추가 받기
	String items=(String)request.getAttribute("items");
	String text=(String)request.getAttribute("text");
%>
	<script>
function checkForm(){
	if(${sessionId==null}){
		alert("로그인 해주세요");
		return false;
	}
	//writeForm으로 이동
	location.href="./BoardWriteForm.do?id=<%=sessionId%>";
}
</script>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">

<title>게시판</title>
</head>
<body>
<jsp:include page="../menu2.jsp"/>
<div class="jumbotron">
<div class="container">
	<h1 class="display-3">게시판</h1>
</div>

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
	<th>번호</th>	<th>제목</th>	<th>작성일</th><th>조회</th><th>글쓴이</th>

</tr>
 <%
	for(int i=0; i<boardList.size(); i++){
		BoardDTO notice=boardList.get(i);
	%>
	<tr>
<td> <%=notice.getNum() %></td>
<td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject() %></a></td>
<td><%=notice.getRegist_day() %></td>
<td><%=notice.getHit()%></td>
<td><%=notice.getName() %></td>
</tr>
 <%} %> 

</table>
</div><%--리스트 끝 --%>
<%--페이지 네비게이션 --%>
<div align="center">
	<c:set var="pageNum" value="<%=pageNum%>"/>
	<c:forEach var="i" begin="1" end="<%=total_page%>">
		<a href="<c:url value="./BoardListAction.do?pageNum=${i}&items=${items}&text=${text}"/>">
		<c:choose>
			<c:when test="${pageNum==i}">
				<font color='4C5317'><b>[${i}]</b></font>
			</c:when>
			<c:otherwise>
			<font color='4C5317'><b>[${i}]</b></font>
			</c:otherwise>
	
		</c:choose>
		</a>
	</c:forEach>
</div>
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
<a href="#" onclick="checkForm(); return false;"
class="btn btn-primary">&laquo;글쓰기</a>
</tr>
</table>
</div>



</form>
<hr>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>