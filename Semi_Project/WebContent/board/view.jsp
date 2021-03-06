<%@page import="mvc.model.BoardDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	BoardDTO board = (BoardDTO)request.getAttribute("board"); 
	int num=(Integer)request.getAttribute("num");
	int nowPage=(Integer)request.getAttribute("pageNum");
%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title></head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">게시판</h1>
	</div>
</div>
<!-- 글쓰기 폼 -->
<div class="container">
	<form name="newUpdate" action="./BoardUpdateAction.do?num=<%=board.getNum()%>&pageNum=<%=nowPage%>" class="form-horizontal" method="post" onclick="return checkForm()">
		<input type="hidden" name="id" class="form-control" value="${sessionId}">
		<div class="form-group row">
			<label class="col-sm-2 control-label">성명</label>
			<div class="col-sm-3">
				<input name="name" class="form-control" value="<%=board.getName()%>" placeholder="name" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-5">
				<input name="subject" class="form-control" value="<%=board.getSubject()%>" placeholder="subject" autofocus>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-8" style="word-spacing: break-all;">
				<textarea rows="5" cols="80" name="content" class="form-control" placeholder="content"><%=board.getContent()%></textarea>				
			</div>
		</div>
		
		<div class="form-group row">			
			<div class="col-sm-10 col-sm-offset-2">
			  <c:set var="userId" value="<%=board.getId() %>"/>
			  <c:if test="${sessionId==userId}">
			  <p>
			  <a href="./BoardDeleteAction.do?num=<%=board.getNum()%>&pageNum=<%=nowPage%>" class="btn btn-danger">삭제</a>
				<input type="submit" class="btn btn-success" value="수정" >
				<input type="reset" class="btn btn-primary" value="취소">	
			  </c:if>
			  <a href="./BoardListAction.do?pageNum=<%=nowPage%>" class="btn btn-primary">목록</a>
			</div>
		</div>
	</form>
	<hr>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>