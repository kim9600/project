<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/css.jsp" %>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>UserList</title>
</head>
<body>
<!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_4">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>elements</h3>
                        <p>Pixel perfect design with awesome contents</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->
    	<!-- Start Align Area -->
	<div class="whole-wrap">
		<div class="container box_1170">
			<div class="section-top-border">
				<h3 class="mb-30">Table</h3>
				<!-- <div class="progress-table-wrap"> -->
					<div class="progress-table">
						<div class="table-head">
							<div class="visit">ID</div>
							<div class="visit">Name</div>
							<div class="visit">Lastname</div>
							<div class="visit">Firstname</div>
							<div class="visit">Gender</div>
							<div class="visit">Birth</div>
							<!-- <div class="percentage">Email</div> -->
							<div class="visit">Phone</div>
							<div class="visit">Role</div>
						</div>
						<c:forEach items="${userlist}" var="user">
						<div class="table-row">
							<div class="visit"><a href="/users/modifyInfo?id=${user.id}"><c:out value="${user.id}" /></a></div>
							<div class="visit"><c:out value="${user.name}"/></div>
							<div class="visit"><c:out value="${user.eng_Lastname}"/></div>
							<div class="visit"><c:out value="${user.eng_Firstname}"/></div>
							<div class="visit"><c:out value="${user.gender}"/></div>
							<div class="visit"><c:out value="${user.birth}"/></div>
							<%-- <div class="percentage"><c:out value="${user.email}"/></div> --%>
							<div class="visit"><c:out value="${user.phone}"/></div>
							<div class="visit"><a href="/users/modifyInfo?id=${user.id}"><c:out value="${user.role}"/></a></div>
							<%-- <input type="button" class="genric-btn info" value="상세" onclick="location.href='/users/modifyInfo?id=${user.id}' "/> --%>
						</div>
						</c:forEach>
					</div>
				<!-- </div> -->
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="../includes/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function() {

	var result = '<c:out value="${result}"/>';//입력,수정,삭제 결과 rttr.addFlashAttribute("result","success");

	checkModal(result);

	//html5에서 추가된 함수
	history.replaceState({}, null, null);//false

	function checkModal(result) {

		if (result === '' || history.state) {// 글목록으로 바로 진입했거나, history.back으로 이동시 모달창을 띄우지 않음.
			return;
		}
	$(".paginate_button a").on("click",function(e) {

		e.preventDefault();// 페이지 이동 막기

		console.log('click');

		actionForm.find("input[name='pageNum']").val($(this).attr("href"));//이동 페이지 설정
		actionForm.submit();
	});

	$(".move").on("click",function(e) {
		e.preventDefault();//<a태그 클릭시 자동으로 이동 방지 처리
		actionForm.append("<input type='hidden' name='id' value='"+ $(this).attr("href")+ "'>");
		actionForm.attr("action","/users/updateInfo?id='+id");
		actionForm.submit();
	});

	var searchForm = $("#searchForm");

	$("#searchForm button").on("click",	function(e) {
		if (!searchForm.find("option:selected").val()) {
			alert("검색종류를 선택하세요");
			return false;
		}

		if (!searchForm.find(	"input[name='keyword']").val()) {
			alert("키워드를 입력하세요");
			return false;
		}

		searchForm.find("input[name='pageNum']").val("1");//pageNum에 값을 1로 세팅
		e.preventDefault();

		searchForm.submit();
	});
});