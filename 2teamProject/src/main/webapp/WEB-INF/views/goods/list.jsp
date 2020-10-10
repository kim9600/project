<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/css.jsp" %>

<c:if test="${userName.role!='admin'}">
	<a href="/goods/displist"></a>
</c:if>

<c:if test="${userName.role=='admin'}">

<div class="container col-sm-12">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">여행상품 목록</h1>
		
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<%--  <div class="panel-heading">여행상품 목록 페이지 ${userName.id}
			</div> --%>
				<button id='regBtn' type="button" class="btn btn-xs pull-right">새여행상품 등록</button>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr style="text-align:center;">
							<th>상품코드</th>
							<th>여행상품명</th>
							<th>여행경비</th>
							<th>여행타입</th>
							<th>출발일자</th>
							<th>도착일자</th>
							<th>여행기간</th>
							<th>최소/최대/확정인원</th>
							<!-- <th>확정인원</th>
							<th>할인금액</th>
							<th>할인율</th>
							<th>확정금액</th> --> 
							<th>교통수단</th>
							<th>인솔자</th>
							<th>등록일자</th>
							<th>조회건수</th>
							<th>참고사항</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="goods">
						<tr>
							<td><c:out value="${goods.gcode}" /></td>
							<%-- <td><a href='/goods/get?gcode=<c:out value="${goods.gcode}"/>'><c:out value="${goods.gname}"/></a></td> --%>

							<%-- 자바스크립트로 get으로 이동 --%>
							<td><a class='move' href='<c:out value="${goods.gcode}"/>'><c:out value="${goods.gname}" /></a></td>

							<td class="text-right"><fmt:formatNumber type='number' value='${goods.gcost}' />원</td>
							
							<td><c:out value="${goods.gtype}" /></td>
							<td><fmt:formatDate pattern="yy-MM-dd" value="${goods.gfromDate}" /></td>
							<td><fmt:formatDate pattern="yy-MM-dd" value="${goods.gtoDate}" /></td>
							<td><c:out value="${goods.gterm}" /></td>
							<td class="text-center"><c:out value="${goods.gminQty}/${goods.gmaxQty}/${goods.gconfirmQty}" /></td>
							<td><c:out value="${goods.gtransit}" /></td>
							<td><c:out value="${goods.gleader}" /></td>
							<td><fmt:formatDate pattern="yy-MM-dd" value="${goods.gregDate}" /></td>
							<td class="text-center"><c:out value="${goods.gcnt}" /></td>
							<td><c:out value="${goods.gcomments}" /></td>
						</tr>
					</c:forEach>
				</table>

				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/goods/list" method='get'>
							<select name='type'>
								<option value=""    <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"   <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>상품코드</option>
								<option value="C"   <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>여행상품명</option>
								<option value="W"   <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>여행타입</option>
								<option value="D"   <c:out value="${pageMaker.cri.type eq 'D'?'selected':''}"/>>출발일자</option>
								<option value="G"   <c:out value="${pageMaker.cri.type eq 'G'?'selected':''}"/>>인솔자</option>
								<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':''}"/>>상품코드 or 여행상품명 or 여행타입</option>
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

						<%-- <c:if test="${pageMaker.prev}">
			              <li class="paginate_button previous"><a href="#">Previous</a>
			              </li>
			            </c:if>
			
			            <c:forEach var="num" begin="${pageMaker.startPage}"
			              end="${pageMaker.endPage}">
			              <li class="paginate_button"><a href="#">${num}</a></li>
			            </c:forEach>
			
			            <c:if test="${pageMaker.next}">
			              <li class="paginate_button next"><a href="#">Next</a></li>
			            </c:if> --%>

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
								<a href="${pageMaker.startPage -1}">Previous</a>
							</li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cri.pageNum==num?'active':''}">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						
						<!-- 다음 페이지 표시 -->
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next">
								<a href="${pageMaker.endPage +1}">Next</a>
							</li>
						</c:if>

					</ul>
				</div>
				<!--  end Pagination -->
			</div>

			<form id='actionForm' action="/goods/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount'  value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type'    value='<c:out value="${pageMaker.cri.type }"/>'>
				<input type='hidden' name='keyword'	value='<c:out value="${pageMaker.cri.keyword }"/>'>
			</form>

			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">확인</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
</div>
</c:if>

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

		//새글 입력후 결과값이 넘어오면 처리 
		if (result == 'register') {
			//$(".modal-body").html("여행상품 " + result+ " 번이 등록되었습니다.");
			$(".modal-body").html("등록이 완료되었습니다.");
		}

		if (result == 'modify') {
			$(".modal-body").html("수정이 완료되었습니다.");
		}

		if (result == 'remove') {
			$(".modal-body").html("삭제가 완료되었습니다.");
		}

		$("#myModal").modal("show");
	}//

	$("#regBtn").on("click", function() {

		self.location = "/goods/register";

	});

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
		actionForm.attr("action","/goods/get");
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

<%@ include file="../includes/footer.jsp" %>	
