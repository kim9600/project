<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/css.jsp" %>

    
<div class="row">
 	<div class="col-lg-12">
 		<h1 class="page-header">여행상품 수정</h1>
 	</div>
 	<!-- /.col-lg-12 -->
</div>   
<!-- /.row -->
				
<div class="recent_trip_area">
    <div class="container">
	 			<form role="form" action="/goods/modify" method="post" enctype="multipart/form-data">
	 				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>		
	 				<input type="hidden" name="amount"  value='<c:out value="${cri.amount }"/>'>		
	 				<input type="hidden" name="type"    value='<c:out value="${cri.type }"/>'>		
	 				<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>		

	        <div class="row">
	            <div class="col-lg-6 col-md-12">
	                <div class="single_trip">
	                    <div class="thumb">
							<input type="file" name="uploadFile" id="myFile" value=' <c:out value="${goods.images}"/>'>
           					<img src='<c:url value="/img/${goods.images}"/>' id="myImg" style="width:100%" alt="Image"/>							
	                    </div>
	                    <div class="info">
							<label>상품코드</label>
							<input class="form-control" name="gcode" value='<c:out value="${goods.gcode}"/>' readonly>
							<label>여행삼품명</label>
							<input class="form-control" name="gname" value='<c:out value="${goods.gname}"/>'>
							<label>여행경비</label>
							<input class="form-control" name="gcost" value='<c:out value="${goods.gcost}"/>'>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-3 col-md-12">
	                <div class="single_trip">
	                    <div class="info">
							<label>여행타입</label>
							<input class="form-control" name="gtype" value='<c:out value="${goods.gtype}"/>'>
							<label>교통수단</label>
							<input class="form-control" name="gtransit" value='<c:out value="${goods.gtransit}"/>'>
							<label>출발일자</label>
							<input class="form-control" id="fdate" name="gfromDate" value='<fmt:formatDate value="${goods.gfromDate}" pattern="yyyy-MM-dd"/>'>
							<label>도착일자</label>
							<input class="form-control" id="tdate" name="gtoDate" value='<fmt:formatDate value="${goods.gtoDate}" pattern="yyyy-MM-dd"/>'>
							<label>여행기간</label>
							<input class="form-control" name="gterm" value='<c:out value="${goods.gterm}"/>'>
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
							<input class="form-control" name="gminQty" value='<c:out value="${goods.gminQty}"/>'>
							<label>최대인원</label>
							<input class="form-control" name="gmaxQty" value='<c:out value="${goods.gmaxQty}"/>'>
							<label>확정인원</label>
							<input class="form-control" name="gconfirmQty" value='<c:out value="${goods.gconfirmQty}"/>'>
							<label>인솔자</label>
							<input class="form-control" name="gleader" value='<c:out value="${goods.gleader}"/>'>
							<label>할인금액</label>
							<input class="form-control" name="gdiscount" value='<c:out value="${goods.gdiscount}"/>'>
							<label>할인율</label>
							<input class="form-control" name="gdisRate" value='<c:out value="${goods.gdisRate}"/>'>
							<label>확정금액</label>
							<input class="form-control" name="gconfirmCost" value='<c:out value="${goods.gconfirmCost}"/>'>
	                    </div>
	                </div>
	            </div>
	        </div>
			<div class="single_place">
				<label>참고사항</label>
				<textarea rows="3" class="form-control" name="gcomments">${goods.gcomments}</textarea>
			</div>

			<!-- 수정,삭제,리스트가기 버튼  -->
			<button type="submit" data-oper='modify' class="btn btn-success">수정</button>
			<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
			<button type="submit" data-oper='list'   class="btn btn-info">글목록</button>
		
		</form>
   </div>
</div>
  
<!-- submit버튼 클릭시 처리 자바스크립트 -->

<script>
$(document).ready(function(){
	var formObj=$("form");// form객체 얻기
	
     //submit 버튼 클릭시 처리
	$('button').on('click',function(e){
			e.preventDefault();//기본동작(submit은 페이지 이동)을 중지,

			var operation=$(this).data("oper");// data-oper값 얻기
			if(operation==='remove'){
				//alert('remove');
				//삭제 버튼 클릭시 처리
				formObj.attr("action","/goods/remove");

				//alert('remove');
			}else if(operation==='list'){
				formObj.attr("action","/goods/list").attr("method","get");
				//alert('list');
				
				var pageNumTag=$("input[name='pageNum']").clone();//객체 복제
				var amountTag =$("input[name='amount']").clone();
				var keywordTag=$("input[name='keyword']").clone();
				var typeTag   =$("input[name='type']").clone();

				formObj.empty();//초기화 

				//동적으로 생성된 form에 input tag 추가
				formObj.append(pageNumTag);  
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);

				//<form action='/board/list' method='post'>
					//<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>		
  			  		//<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>		
  			  		//<input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>		
  			  		//<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>		
				//</form>
			}
      //alert('modify');
		  formObj.submit();//url로 이동처리
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
 
<script src="/resources/js/datepicker-ko.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$('#fromdate').datepicker();
$('#todate').datepicker();
$('#termdate').datepicker();
});
</script>

<%@ include file="../includes/footer.jsp" %>    
