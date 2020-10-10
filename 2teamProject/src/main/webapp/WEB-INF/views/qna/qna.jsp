<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@ include file="../includes/css.jsp" %>
<%@ include file="../includes/css1.jsp" %>
<!DOCTYPE html>
<html>
<head>	
<title>문의사항</title>
</head>
<body>
<!-- 내용 -->
<!-- container -->
	<div id="container">
		<div id="contBody">
			<div class="stop_category board">
	<ul>
				
		<li class="on"><a href="/notice/notice">공지사항</a></li>
				
		<li class=""><a href="/qna/qna">문의사항</a></li>
				
		<li class=""><a href="/review/list">여행후기</a></li>
				
	</ul>
</div>				<!-- lNavi_wrap -->
	<div id="lNavi_wrap">
		<!-- lNavi -->
		<div id="lNavi">
			<h2 id="lnb_tit" style="width: 185px;"><strong>고객센터</strong></h2>
			<ul class="lNavi_list">
							<li class="on"><a href="/notice/notice">공지사항</a></li>
							<li class=""><a href="/qna/qna">문의사항</a></li>
							<li class=""><a href="/review/list">여행후기</a></li>
						</ul>
		</div>
		<!-- /lNavi -->
		<!-- left_cs_center -->
		<!-- left_cs_center -->
				<div class="left_cs_center">
					<h3>고객센터</h3>
					<dl><img src="/resources/img/notice/call1.gif" style="width: 168px; height:143px; text-align: center;">
						<dt style="height: 143px; width: 168px; height: 80px;"><span style="padding: 5px; text-align: top;">여행상담 문의전화</span><strong>02-732-1505</strong></dt>
						<dd>
							<ul class="time">
								<li><strong>평일</strong><span>09:00~18:00</span></li>
								<li><strong style="padding-right: 0px;">토요일</strong><span>09:00~18:00</span></li>
								<li><strong>휴무</strong><span>일요일 및 공휴일</span></li>
							</ul>
						</dd>
					</dl>
					<dt class="btn" style="text-align: center; margin: auto; font-size: 13px;
					                                   width: 156px; height: 34px; border-right-width: 1px;
					                                    border-left-width: 1px; padding-top: 1px;">
						<li class="line"><a href="/qna/qna">문의사항</a></li>
					</dt>
				</div>
				<!-- /left_cs_center -->		
				<!-- /left_cs_center -->
	</div>
	<!-- /lNavi_wrap -->		
		<!-- contents -->
			<div id="contents">
				<!-- title -->
				<div id="title" style="padding-top: 0px;">
					<div id="location"><a href="/">Home</a>&nbsp;&gt;&nbsp;고객센터&nbsp;&gt;&nbsp;<strong>문의사항</strong></div>
					<h3 class="cont_tit">문의사항</h3>
				</div>
				<!-- /title -->
				<!-- contGen -->

	<div class="contents_wrap">
  	<!--<div class="title_wrap">
								<h3 class="title"></h3>
     </div>-->



				<!-- 내용 -->
	<!-- 타이틀 //게시판 공통 파일은 /include/top.inc.html 에 정의 -->
	<!--<div class="title">
		<img src="" />
		<div><a href="/">홈으로</a> > 커뮤니티 > <span>공지사항</span></div>
	</div> -->
	<!-- //타이틀 -->


	<!-- 검색 -->
  <div class="board_search" style="float: right;">
	<form id='searchForm' action="/qna/qna" method='get' style="padding-bottom: 10px;">
				<select name='type' style="height: 30px; font-size: 13px;">
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>

							</select> 					
				<input type="text" name="keyword" value="${pageMaker.cri.keyword}" style="height:30px;"/>
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							
				<button class="genric-btn info radius" style="font-size: small; width: auto; padding-left: 15px; padding-right: 15px;">검색</button>
		</form>
	</div>
	<!-- //검색 -->

	<!-- 리스트 -->
		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="게시판의 제목,작성자,작성일,조회수를 확인하실수있습니다." class="table_t">
    	<caption>게시판</caption>
    	<colgroup>
      	<col width="80">
		<col width="">
        <col width="100">
        <col width="120">
        <col width="120">
      </colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">수정일</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="qna">
						<tr>
						
							<td><c:out value="${qna.qno}" /></td>
							<%--<td><a href='/board/get?=<c:out value="${board.}"/>'><c:out value="${board.title}"/></a></td>--%>
                             <%-- 자바스크립트로 get으로 이동 --%>
							<td style="color: red;"><a class='move' href='<c:out value="${qna.qno}"/>'>	<c:out value="${qna.title}"/></a></td>

							<td><c:out value="${qna.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${qna.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${qna.updateDate}" /></td>
						</tr>
					</c:forEach>
		</table>
	<!-- //리스트 -->

		<!-- 페이징 -->
		<div class="paging mt20">
            <nav aria-label="..." style="position: absolute; left: 50%;">
  <ul class="pagination">
    
    <!-- 이전 페이지 출력 -->
    <c:if test="${pageMaker.prev}">
    <li class="page-item enabled">
      <a class="page-link" href="${pageMaker.startPage -1}" tabindex="-1" aria-disabled="true">이전</a>
      </li>
      </c:if>
      
    <c:if test="${!pageMaker.prev}">
    <li class="page-item disabled">
      <a class="page-link" href="${pageMaker.startPage -1}" tabindex="-1" aria-disabled="false">이전</a>
      </li>
      </c:if>
      
    <!-- 현재 페이지 출력 -->
    <c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
			<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
				<a href="${num}">${num}</a>
			</li>
	</c:forEach>

    <!-- 다음 페이지 출력 -->
   <c:if test="${pageMaker.next}">
			<li class="page-item enabled ">
			<a class="page-link" href="${pageMaker.endPage +1 }" tabindex="+1" aria-disabled="true">다음</a>
			</li>
	</c:if>
	
    <c:if test="${!pageMaker.next}">
			<li class="page-item disabled ">
			<a class="page-link" href="${pageMaker.endPage +1 }" tabindex="+1" aria-disabled="false">다음</a>
			</li>
	</c:if>
 
  </ul>
</nav>

				<!--  end Pagination -->
</div>
<div class="panel-heading">
      <c:if test="${userName!=null}">
		   <button id='regBtn' type="button" class="genric-btn info circle" style="font-size: 13px; float: right;">글쓰기</button>
	  </c:if>
			</div>
<form id='actionForm' action="/qna/qna" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type'	value='<c:out value="${ pageMaker.cri.type }"/>'> 
				<input type='hidden' name='keyword'  value='<c:out value="${ pageMaker.cri.keyword }"/>'>
			</form>
			
			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<!-- <button type="button" class="btn btn-primary">Save
								changes</button> -->
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
<!-- /.row -->
<script type="text/javascript">

    	$("#regBtn").on("click", function() {
			self.location = "/qna/register";
		});
		
	$(document)	.ready(	function() {

						var result = '<c:out value="${result}"/>';//입력,수정,삭제 결과 rttr.addFlashAttribute("result","success");

						checkModal(result);

						//html5에서 추가된 함수
						history.replaceState({}, null, null);//false

						function checkModal(result) {

							if (result === '' || history.state) {// 글목록으로 바로 진입했거나, history.back으로 이동시 모달창을 띄우지 않음.
								return;
							}

                            //새글 입력후 결과값이 넘어오면 처리 
							if (parseInt(result) > 0) {
								$(".modal-body").html(	"게시글 " + parseInt(result)+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}//

						$("#regBtn").on("click", function() {

							self.location = "/qna/register";

						});

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();// 페이지 이동 막기

									console.log('click');

									actionForm.find("input[name='pageNum']").val($(this).attr("href"));//이동 페이지 설정
									actionForm.submit();
								});

						$(".move").on("click",function(e) {

											e.preventDefault();//<a태그 클릭시 자동으로 이동 방지 처리
											actionForm
													.append("<input type='hidden' name='qno' value='"+ $(this).attr("href")+ "'>");
											actionForm.attr("action","/qna/get");
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
				</div>
				<!-- /contents_wrap -->
				</div>
				<!-- /contGen -->
			</div>
			<!-- /contents -->
		</div>
		<!-- /contBody -->
	</div>
	<!-- /container -->

<!-- //내용 -->
</body>
</html>
<%@ include file="../includes/footer.jsp" %>