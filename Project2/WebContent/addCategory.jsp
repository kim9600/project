<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>카테고리등록</title>
<script>
function check(){
	alert('등록되었습니다');
}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">카테고리등록</h1>
		</div>
	</div>
	<div class="container" align="center">
		<form action="processAddCategory.jsp" method="post" class="form-horizontal"> 
			<div class="form-group row">
				<label class="col-sm-4">카테고리명</label> 
				<div class="col-sm-3"> 
					<input type="text" name="categoryName" id="categoryName" class="form-control"> 
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-4">카테고리설명</label> 
				<div class="col-sm-3">
					<input type="text" name="description" id="description" class="form-control"> 
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" onclick="check()">
					<input type="reset" class="btn btn-primary" value="취소">
				</div>
			</div>
		</form>
	</div>
</body>
<jsp:include page="footer.jsp"/>
</html>
