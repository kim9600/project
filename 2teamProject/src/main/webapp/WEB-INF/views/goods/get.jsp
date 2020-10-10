<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/css.jsp"%>
<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-8">
		<h1 class="page-header">여행상품 상세 보기</h1> <%-- ${userId},${goods.gcode} --%>
	</div>
</div>

<div class="recent_trip_area">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-12">
                <div class="single_trip">
                    <div class="thumb">
                        <img src='<c:url value="/img/${goods.images}"/>' style="width:100%">
                    </div>
                    <div class="info">
						<label>상품코드</label>
						<input class="form-control" name="gcode" value='<c:out value="${goods.gcode}"/>' readonly>
						<label>여행삼품명</label>
						<input class="form-control" name="gname" value='<c:out value="${goods.gname}"/>' readonly>
						<label>여행경비</label>
						<input class="form-control" name="gcost" value='<fmt:formatNumber type='number' value='${goods.gcost}'/>원' readonly>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-12">
                <div class="single_trip">
                    <div class="info">
						<label>여행타입</label>
						<input class="form-control" name="gtype" value='<c:out value="${goods.gtype}"/>' readonly>
						<label>교통수단</label>
						<input class="form-control" name="gtransit" value='<c:out value="${goods.gtransit}"/>' readonly>
						<label>출발일자</label>
						<input class="form-control" name="gfromDate" value='<fmt:formatDate value="${goods.gfromDate}" pattern="yyyy-MM-dd"/>' readonly>
						<label>도착일자</label>
						<input class="form-control" name="gtoDate" value='<fmt:formatDate value="${goods.gtoDate}" pattern="yyyy-MM-dd"/>' readonly>
						<label>여행기간</label>
						<input class="form-control" name="gterm" value='<c:out value="${goods.gterm}"/>' readonly>
						<label>등록일자</label>
						<input class="form-control" name="gregDate" value='<fmt:formatDate value="${goods.gregDate}" pattern="yyyy-MM-dd"/>' readonly>
						<label>조회건수</label>
						<input class="form-control" name="gcnt" value='<c:out value="${goods.gcnt}"/>' readonly>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-12">
                <div class="single_trip">
                    <div class="info">
						<label>최소인원</label>
						<input class="form-control" name="gminQty" value='<c:out value="${goods.gminQty}"/>' readonly>
						<label>최대인원</label>
						<input class="form-control" name="gmaxQty" value='<c:out value="${goods.gmaxQty}"/>' readonly>
						<label>확정인원</label>
						<input class="form-control" name="gconfirmQty" value='<c:out value="${goods.gconfirmQty}"/>' readonly>
						<label>인솔자</label>
						<input class="form-control" name="gleader" value='<c:out value="${goods.gleader}"/>' readonly>
						<label>할인금액</label>
						<input class="form-control" name="gdiscount" value='<c:out value="${goods.gdiscount}"/>' readonly>
						<label>할인율</label>
						<input class="form-control" name="gdisRate" value='<c:out value="${goods.gdisRate}"/>' readonly>
						<label>확정금액</label>
						<input class="form-control" name="gconfirmCost" value='<fmt:formatNumber type='number' value='${goods.gconfirmCost}'/>원' readonly>
                    </div>
                </div>
            </div>
        </div>
		<div class="single_place">
			<label>참고사항</label>
			<textarea rows="3" class="form-control" name="gcomments">${goods.gcomments}</textarea>
		</div>

		<button data-oper='modify' class="btn btn-primary">수정</button>
		<button data-oper='list'   class="btn btn-default">글목록</button>

		<!-- 이동할 폼 생성  -->
		<form id='operForm' action="/goods/modify" method="get">
			<input type="hidden" id='gcode'   name='gcode'   value='<c:out value="${goods.gcode}"/>'>
			<input type="hidden" id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type='hidden' name='amount'  value='<c:out value="${cri.amount}"/>' />
			<%-- <input type="hidden" id="amount"  name="amount"  value='<c:out value="${cri.amount}"/>'> --%>
			<input type="hidden" id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>'>
			<input type="hidden" id='type'    name='type'    value='<c:out value="${cri.type}"/>'>
		</form> 
				
    </div>

</div>
<!--  /.row -->

<!-- 수정/리스트 페이지로이동 처리 스크립트  -->
<script>
 	 $(document).ready(function() {
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/goods/modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#gcode").remove();
			operForm.attr("action", "/goods/list").submit();
		});
	}); 
</script>

<%@ include file="../includes/footer.jsp"%>