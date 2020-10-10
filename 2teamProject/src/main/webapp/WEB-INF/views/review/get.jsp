<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/css.jsp" %>
<%@ include file="../includes/css1.jsp" %>

<input type="hidden" id='amount' name='amount' value='<c:out value="${cri.amount}"/>'>
<!-- 본문  -->
<div id="container" style="height: 850px;">
	<div id="contBody">
		<div class="stop_category board">
			<ul>
				<li class="on"><a href="/notice/notice">공지사항</a></li>
				<li class=""><a href="/qna/qna">문의사항</a></li>
				<li class=""><a href="/review/list">여행후기</a></li>
			</ul>
		</div>

		<!-- lNavi_wrap -->
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
				<dt class="btn" style="text-align: center; margin: auto; font-size: 13px; width: 156px; height: 34px;
								border-right-width: 1px; border-left-width: 1px; padding-top: 1px;">
					<li class="line"><a href="/qna/qna">문의사항</a></li>
				</dt>
			</div>
			<!-- /left_cs_center -->		
		</div>
		<!-- /lNavi_wrap -->		
		<!-- contents -->
		<div id="contents">
			<!-- title -->
			<div id="title" style="padding: 8px; height: auto; pa">
				<div id="location"><a href="/">Home</a>&nbsp;&gt;&nbsp;고객센터&nbsp;&gt;&nbsp;<strong>여행후기</strong></div>
					<h3 class="cont_tit">게시글 상세보기</h3>
			</div>
			<!-- /title -->
			<!-- contGen -->
			<div class="content" style="margin-left: 5px;">
				<div class="row" style="width: 830px; height: 646px;">
					<div class="col-lg-12" style="width: auto; height: auto;padding: 5px;">
						<table width="800px;" border="0" cellpadding="0" cellspacing="0" class="table_l" style="margin-left: 20px;">
							<colgroup>
								<col width="12%">
								<col width="88%">
							</colgroup>
							<tbody>
								<tr>
									<th>글 번호</th>
										<td><input type="text"  name="bno" value= '<c:out value="${review.bno }"/>' readonly style="height: 30px; width: 70px;"></td>
								</tr>
								<tr>
									<th>제목</th>
									<%-- <c:if test="${!SECRET.value='Y'}"> --%>
										<td><input class="form-control" size="60" name="title" value='<c:out value="${review.title }"/>' readonly style="height: 30px;"></td>
									<%-- </c:if> --%>
	
									<%-- <td><i class="fa fa-lock"><input class="form-control" size="60" name="title" value='<c:out value="${review.title }"/>' readonly style="height: 30px;"></i></td> --%>
	
								</tr>
	
								<tr>
									<th>작성자</th>
										<td><input type="text" name="writer" value='<c:out value="${review.writer }"/>' style="height: 30px;" readonly></td>
								</tr>
	
								<tr>
									<td colspan="2" style="width: 730px; height: 350px;">
										<textarea style="width: 800px; height: 350px; resize:none; font-size: 14px; text-align: left;" name="content" readonly><c:out value="${review.content }" /></textarea>
									</td>
								<tr>
									<td colspan="2" style="width: 200px; height: 40px;">
										<div class="thumb text-center">
											<img src='<c:url value="/img/${review.images}"/>' style="width:30%">
										</div> 
									</td>
								</tr>
	
							</tbody>
						</table>
						<br>
						<c:if test="${userName.name==review.writer && userName!=null}">
						<button data-oper='modify' class="btn btn-primary" style="float: right; width: 66px; margin-left: 5px ">수정</button>
						</c:if>
						<button data-oper='review' class="btn btn-default" style="float: right;">글목록</button>
	
			            <!-- 이동할 폼 생성  -->
			            <form id='operForm' action="/review/modify" method="get">
			               <input type="hidden" id='bno'     name='bno'     value='<c:out value="${review.bno}"/>'>
			               <input type="hidden" id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			               <input type="hidden" id='amount'  name='amount'  value='<c:out value="${cri.amount}"/>'>
			               <input type="hidden" id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>'>
			               <input type="hidden" id='type'    name='type'    value='<c:out value="${cri.type}"/>'>
			            </form>
	            
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="tflase">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true" >&times;</button>
										<h4 class="modal-title" id="myModalLabel">댓글 팝업창</h4>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label>답변내용</label>
											<input type="text" class="form-control" name='reply' value='새로운 댓글!!!' style="height: auto;">
										</div>
										<div class="form-group">
											<label>작성자</label>
											<input type="text" class="form-control" name='replyer' value='<c:out value="${userName.id }"/>' style="height: auto;">
										</div>
										<div class="form-group">
											<label>작성일자</label>
											<input type="text" class="form-control" name='replyDate' value='replyDate'>
										</div>
	                                            
									</div>
									<div class="modal-footer">
										<button id='modalModBtn'      type="button" class="btn btn-warning">수정</button>
										<button id='modalRemoveBtn'   type="button" class="btn btn-danger">삭제</button>
										<button id='modalRegisterBtn' type="button" class="btn btn-default" >등록</button>
										<button id='modalCloseBtn'    type="button" class="btn btn-primary">닫기</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
<!-- 수정/리스트 페이지로이동 처리 스크립트  -->
<script type="text/javascript">
   $(document).ready(function() {
      var operForm = $("#operForm");
      $("button[data-oper='modify']").on("click", function(e) {
         operForm.attr("action", "/review/modify").submit();
      });

      $("button[data-oper='review']").on("click", function(e) {
         operForm.find("#bno").remove();
         operForm.attr("action", "/review/list").submit();
      });
   });
</script>

<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/review/modify").submit();
    
  });
  
    
  $("button[data-oper='review']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/review/list")
    operForm.submit();
    
  });  
});
</script>
<script type="text/javascript">
function readURL(input) {
    /* alert('image'); */
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#myImg').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#myFile").change(function() {
    readURL(this);
});
</script>
</div>
</div>
</div>
</div>
</div>


<%@ include file="../includes/footer.jsp"%>