<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/css.jsp" %>
<%@ include file="../includes/header.jsp"%>

<div class="container col-sm-12">
	<!-- 본문  -->
	<div class="row">
		<div class="col-log-12">
			<h1 class="page-header">여행상품 등록</h1>
		</div>
	</div>
	
	<div class="recent_trip_area">
		<div class="container">
    
			<form role="form" action="/goods/register" method="post" enctype="multipart/form-data">

	        <div class="row">
	            <div class="col-lg-6 col-md-12">
	                <div class="single_trip">
	                    <div class="thumb">
							<input type="file" name="uploadFile" id="myFile">
   							<img src="https://placehold.it/160x90?text=IMAGE" id="myImg" style="width:100%" alt="Image"/>
	                    </div>
	                    <div class="info">
							<label>여행삼품명</label>
							<input class="form-control" name="gname">
							<label>여행경비</label>
							<input class="form-control" name="gcost">
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-3 col-md-12">
	                <div class="single_trip">
	                    <div class="info">
							<label>여행타입</label>
							<input class="form-control" name="gtype">
							<label>교통수단</label>
							<input class="form-control" name="gtransit">
							<label>출발일자</label>
							<input class="form-control" id="fdate" name="gfromDate">
							<label>도착일자</label>
							<input class="form-control" id="tdate" name="gtoDate">
							<label>여행기간</label>
							<input class="form-control" name="gterm">
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-3 col-md-12">
	                <div class="single_trip">
	                    <div class="info">
							<label>최소인원</label>
							<input class="form-control" name="gminQty">
							<label>최대인원</label>
							<input class="form-control" name="gmaxQty">
							<!-- <label>확정인원</label>
							<input class="form-control" name="gconfirmQty"> -->
							<label>인솔자</label>
							<input class="form-control" name="gleader">
							<label>할인금액</label>
							<input class="form-control" name="gdiscount">
							<label>할인율</label>
							<input class="form-control" name="gdisRate">
							<!-- <label>확정금액</label>
							<input class="form-control" name="gconfirmCost"> -->
	                    </div>
	                </div>
	            </div>
	        </div>
			<div class="single_place">
				<label>참고사항</label>
				<textarea rows="3" class="form-control" name="gcomments"></textarea>
			</div>

			<button type="submit" class="btn btn-success">등록</button>
			<button type="reset"  class="btn btn-success">초기화</button>

		    </form>
		</div>
	</div>
</div>
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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="/resources/jquery-ui-1.12.1/datepicker-ko.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $("#date1").datepicker();
   $('#fdate').datepicker();
   $('#tdate').datepicker();
   $('#termdate').datepicker();
});
</script>

<%@ include file="../includes/footer.jsp"%>