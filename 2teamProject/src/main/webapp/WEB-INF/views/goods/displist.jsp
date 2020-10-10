<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/css.jsp" %>

<style>
.star { color: orange;}
.price { background-color: cyan; width: 10px;}
.view {color:white; background-color: blue; width: 50px; text-align: center;}
</style>

  <div class="bradcam_area bradcam_bg_5">
      <div class="container">
         <div class="row">
            <div class="col-xl-12">
               <div class="bradcam_text text-center">
                  <h3>Travel-products</h3>
                  <p></p>
               </div>
            </div>
         </div>
      </div>
   </div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-info">
			<div class="recent_trip_area">
			    <div class="container">
					<div class="row">
						<c:forEach items="${list}" var="goods">
							<div class="col-lg-3 col-md-6">
								<div class="single_place">
									<div class="img-thumbnail">
										<a class='move' href='${goods.gcode}'>
										<img src='<c:url value="/img/${goods.images}"/>' style="width:250px; height: 180px;"></a>
									</div>
									<div class="place_info">
										<p><a href="#" class="prise">￦<fmt:formatNumber type='number' value='${goods.gconfirmCost}'/>원</a></p>
										<a class='move' href='<c:out value="${goods.gcode}"/>'><c:out value="${goods.gname}"/></a>
										<div class="rating_days d-flex justify-content-between">
											<span class="d-flex justify-content-center align-items-center">
												<c:forEach var="i" begin="1" end="${goods.gstar}">
													<i class="star fa fa-star"></i>
												</c:forEach>
												<a href="#">(${goods.gscore})</a>
												<i class="fa fa-clock-o"></i>
												<a href="#">${goods.gterm}</a>
												<p class="view primary-switch fa fa-eye"><i><c:out value="${goods.gcnt}"/></i></p>
											</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<p>&nbsp;</p>
					<div class='row'>
						<div class="col-lg-12">
							<form id='searchForm' action="/goods/displist" method='get'>
								<select name='type'>
									<option value=""  <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
									<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>여행상품명</option>
									<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>여행타입</option>
									<option value="D" <c:out value="${pageMaker.cri.type eq 'D'?'selected':'' }"/>>출발일자</option>
								</select> 
								
								<input type='text'   name='keyword'	value='<c:out value="${pageMaker.cri.keyword}"/>' />
								<input type='hidden' name='pageNum'	value='<c:out value="${pageMaker.cri.pageNum}"/>' />
								<input type='hidden' name='amount'  value='<c:out value="${pageMaker.cri.amount}"/>' />
								
								<button class='btn btn-default'>찾기</button>
							</form>
						</div>
					</div>
	
					<div class='pull-right'>
						<ul class="pagination">
	
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous">
									<a href="${pageMaker.startPage - 1}">Previous</a>
								</li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':''}">
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>
							
							<!-- 다음 페이지 표시 -->
							<c:if test="${pageMaker.next}">
								<li class="paginate_button next">
									<a href="${pageMaker.endPage + 1}">Next</a>
								</li>
							</c:if>
	
						</ul>
					</div>
					<!--  end Pagination -->
				</div>
			</div>
	
			<form id='actionForm' action="/goods/displist" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount'  value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type'    value='<c:out value="${pageMaker.cri.type }"/>'>
				<input type='hidden' name='keyword'	value='<c:out value="${pageMaker.cri.keyword }"/>'>
			</form>
		</div>
	</div>
	<!--  .end col-lg-12 -->
</div>
<!-- .end row -->

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
	}

	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click",function(e) {

		e.preventDefault();// 페이지 이동 막기

		console.log('click');

		actionForm.find("input[name='pageNum']").val($(this).attr("href"));//이동 페이지 설정
		actionForm.submit();
	});

	$(".move").on("click",function(e) {
		e.preventDefault();//<a태그 클릭시 자동으로 이동 방지 처리
		actionForm.append("<input type='hidden' name='gcode' value='"+ $(this).attr("href")+ "'>");
		actionForm.attr("action","/goods/getdisp");
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
</script>

<%@ include file="../includes/footer.jsp"%>
