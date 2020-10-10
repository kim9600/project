<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@include file="../includes/css.jsp" %>

<%@include file="../includes/header.jsp"%>

<div class="bradcam_area bradcam_bg_1"> 
<div class="container">
 <div class="row">
<div class="col-xl-12">
<div class="bradcam_text text-center">
<h3>여행상품 결제페이지</h3>
<p>알로하오이</p>
</div>
</div>
</div>
</div>
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">여행상품 목록 페이지 
				
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							
							<th>여행상품명</th>
							<th>여행경비</th>
							
							<th>출발일자</th>
							<th>도착일자</th>
							<th>여행기간</th>
							
							<th>할인금액</th>
							<th>할인율</th>
							<th>교통수단</th>
							<th>인솔자</th>
							
						</tr>
					</thead>

					
						<tr>
							<td><c:out value="${goods.gname}" /></td>

							<td><c:out value="${goods.gcost}" /></td>
							
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${goods.gfromDate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${goods.gtoDate}" /></td>
							<td><c:out value="${goods.gterm}" /></td>
							
							<td><c:out value="${goods.gdiscount}" /></td>
							<td><c:out value="${goods.gdisRate}" /></td>
							<td><c:out value="${goods.gtransit}" /></td>
							<td><c:out value="${goods.gleader}" /></td>
							
							
							
						</tr>
				
				</table>

				</div><!-- panel body -->
				
		
	
				</div><!-- panel default -->

				
</div><!-- col-lg-12 -->
</div><!-- row -->
             <h3 class="h5 pt-5 ">결제방식</h3>
                  		 <%-- <form action="/goods/reservation" method="post">
             
                 		<input type="hidden" id="user_id" name="user_id" value="${userId}">
                      <input type="hidden" id="amount" name="amount" value='<c:out value="${goods.gcost}" />'>
                      <input type="hidden" id="gcode" name="gcode" value='<c:out value="${gcode}" />'>
                 		<button type="submit">이동</button>
                 		</form>  --%>
                 		<input type="hidden" id="amount" name="amount" value='<c:out value="${goods.gcost}" />'>
						<form action="/goods/reservation" method="post" name="orderForm">
                    	
                      <div class="form-group col-sm-7">
                      <div class="py-3">
                         <div class="float-left">
                         <div class="form-group col-sm-12">
                      <div class="alert alert-danger text-small">최종 결제금액을 확인해 주세요.<br>
                      </div>
                      	<p class="alert alert-success">최종 결제금액: <c:out value="${goods.gcost}" />원 </p>
                      <!-- <input type="hidden" id="order_id" name="order_id"> -->
                      <input type="hidden" id="user_id" name="user_id" value="${userId}">
                      <input type="hidden" id="amount" name="amount" value='<c:out value="${goods.gcost}" />'>
                      <input type="hidden" id="gcode" name="gcode" value='<c:out value="${gcode}" />'>
                      <input type="hidden" id="gname" name="gname" value='<c:out value="${goods.gname}" />'>
                      <input type="hidden" id="gtransit" name="gtransit" value='<c:out value="${goods.gtransit}" />'>
                      <input type="hidden" id="gconfirmQty" name="gconfirmQty" value='<c:out value="${goods.gconfirmQty}" />'>
                      <input type="hidden" id="gfromDate" name="gfromDate" value='<fmt:formatDate value="${goods.gfromDate}" pattern="yyyy-MM-dd"/>'>
                      <input type="hidden" id="gtoDate" name="gtoDate" value='<fmt:formatDate value="${goods.gtoDate}" pattern="yyyy-MM-dd"/>'>
                      
                      
                      
                      
                      
                       
                    </div>
                        </div>
                        <div class="clearfix"></div>
                      </div>
                    </div>
                    
                    <div class="col-sm-5">
                    <button  type="button" id="payKaKao">결제하기</button>
                    
               
                      
                    </div>
                         </form>   
                <!-- </div>
              </div>
            </div> -->
<!--                         <div class="card">
              <div class="card-header" role="tab">
                <h6>
                  <a class="pl-0" href="#bank_transfer" data-toggle="collapse" aria-expanded="true">
                    <i class="fas fa-money-check"></i>
                    <div class="text">
                      계좌이체                    </div>
                  </a>
                </h6>
              </div>
              <div class="collapse show" id="bank_transfer" data-parent="#accordion" role="tabpanel" style="">
                <div class="card-body px-0">
                  <form action="#" class="row" method="post" autocomplete="off" accept-charset="utf-8">

<input type="hidden" name="payment_type" value="bank">
                    <div class="jumbotron py-4 w-100 mb-3">
                    <h6 class="mb-3 regular-title"><strong>계좌이체 이용시, 투어의 송금 내역이 확인된 후 예약 확정이 진행됩니다.</strong></h6><ul><li>정확한 입금자명을 기입한 후, 하단에 있는 [예약 요청 완료] 버튼을 누르시면 72시간 이내로 이용 가능여부를 확인 한 후 등록하신 이메일로 입금기한을 포함한 자세한 내용을 발송해드립니다.</li><li>송금 내역이 확인되기 전까지 요청하여 주신 모든 문의는 [예약대기] 상태에 있으며, 기한내에 송금이 완료되지 않은 요청건은 자동취소 되는 점 사전 양해 부탁드립니다.</li><li>송금 내역이 확인된 후, 예약 확정이 진행되기 때문에 실시간 좌석 상황에  따라 희망하셨던 일자에 투어 예약이 어려우실 수 있습니다.</li><li>송금 안내 메일에 안내해드린 송금 기한을 넘기실 경우 환율 변동으로 인하여 송금 금액이 달라질 수 있습니다. </li><li>예약자명과 입금자명이 다르신 경우 당사로 꼭 연락 주시기 바랍니다.</li></ul>                    </div>
                    <div class="col-12">
                      <p class="text-danger">송금 요청 메일을 받기 전까지 입금하지 말아주세요.</p>
                    </div>
                                        <div class="col-sm-4">
                      <div class="form-group">
                        <input class="form-control" type="text" name="guest__pronounce" placeholder="성명 (한글)" required="">
                      </div>
                    </div>
                                        <div class="col-sm-4">
                      <div class="form-group">
                        <input class="form-control" type="text" name="guest__lastname" placeholder="성 (영문)" required="">
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <div class="form-group">
                        <input class="form-control" type="text" name="guest__firstname" placeholder="이름 (영문)" required="">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <input class="form-control" type="email" name="guest__email" placeholder="이메일" required="">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <input class="form-control" type="text" name="guest__phone" placeholder="전화번호" required="">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <input class="form-control" type="text" name="account_transfer_name" placeholder="입금자 이름" required="">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <select name="account_transfer_bank" class="form-control">
                        <option value="우리은행">우리은행 – (주)test: 1234-1234-124</option>                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <button class="btn btn-primary btn-block mt-0" type="submit">예약 요청 완료</button>
                    </div>
                  </form>                </div>
              </div>
            </div> -->
                      </div>
                      
                      <div class="wizard-footer d-flex justify-content-between px-0">
            <a class="btn btn-secondary my-2" href="/goods/displist">
              <span class="d-none d-sm-inline-block">상품페이지로 돌아가기</span>
            </a>
            <a class="btn btn-secondary my-2" href="javascript:history.back();">
                       <span class="d-none d-sm-inline-block">이전</span>
            </a>
          </div>
			<%-- <form id="orderForm" action="/goods/payment" method="post">
					<input type="hidden" name="user_id" value="${userId}">
					<input type="hidden" name="order_id" value="${getUser.order_id}">
					<input type="hidden" name="amount" value="${goods.gcost}">
					
				</form> --%>
<script>
$('#payKaKao').click(function () {
	
	IMP.init('imp23460056');
	var orderForm=document.orderForm;
	
IMP.request_pay({
    pg : 'kakao', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid :'merchant_' + new Date().getTime(),
    name :'${goods.gname}',
    amount :'${goods.gcost}', //판매 가격
    buyer_email: '${userEmail}',
    buyer_name:'${userName2}',
    buyer_tel: '${userPhone}'
},function(rsp){
    if ( rsp.success ) {
    	
    	
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        
       
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }

    	alert(msg);
    	 orderForm.submit();
});
});

</script>		


<!-- <script src="https://gajahawaii.com/assets/js/vendor-min.js?v=699c38a635f8f0be105430cfbae9bbc0"></script> -->
 




<%@include file="../includes/footer.jsp"%>
