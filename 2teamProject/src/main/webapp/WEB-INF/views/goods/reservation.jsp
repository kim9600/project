<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@include file="../includes/css.jsp" %>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/reservation.css">

<div class="bradcam_area bradcam_bg_1"> 
<div class="container">
 <div class="row">
<div class="col-xl-12">
<div class="bradcam_text text-center">
<h3>여행상품 결제페이지</h3>
<p>알로하오에</p>
</div>
</div>
</div>
</div>
</div>
<!-- /.row -->
<div class="container pb-4 mb-2">
  <div class="row">
    <div class="col-12">
        </div>
    <div class="col-xl-9 col-lg-8 pb-5">
      <div class="wizard">
        <div class="wizard-steps d-flex flex-wrap flex-sm-nowrap justify-content-between">
          <div class="wizard-step active">주문확인 및 결제</div>
        
        </div>

        <div class="wizard-body">
          <div class="alert alert-warning">
            <h6 class="“m-t-0”">하와이 여행 결제안내</h6>
            <p>홈페이지의 신청 내용대로 결제가 진행됩니다. 요청주신 결제 내용(선택 날짜-하와이 현지 기준/참가 인원수) 을 다시 한 번 꼼꼼히 확인해 주시기 바랍니다.</p>
<p>저희 알로하오이를 통해 이용 가능 하신 모든 상품의 결제 확정은 결제 완료 기준으로 이루어지고 있으며, 결제를 확정하시는 시점에 가능여부가 적용되는 점 참고해 주시기 바랍니다. </p>          </div>
          <h3 class="h5 pb-3">주문확인</h3>
                    <div class="cart-item d-md-flex justify-content-between">
           
            <div class="px-3 my-3">
              <a class="cart-item-product" href="/goods/getdisp?gcode=${goods.gcode}">
                <div class="cart-item-product-thumb">
                  <img src="/img/${goods.images}" alt="[스페셜 특선상품] 우리가족 단독 섬투어">
                </div>
                <div class="cart-item-product-info">
                  <h4 class="cart-item-product-title">${goods.gname} - ${goods.gterm}</h4>
                  <!-- <div class="cart-item-product-subtitle mb-2">[스페셜 특선상품] 우리 가족 8시간 단독 섬투어</div> -->
                                    <span><strong>여행타입:</strong> ${goods.gtype}</span>
                                    <span><strong>출발날짜:</strong><fmt:formatDate value="${goods.gfromDate}" pattern="yyyy-MM-dd"/></span>
                                    <span><strong>도착날짜:</strong><fmt:formatDate value="${goods.gtoDate}" pattern="yyyy-MM-dd"/></span>
                                    <span><strong>교통편:</strong>${goods.gtransit}</span>
                                    <span><strong>이용 인원수:</strong><%=request.getParameter("gconfirmQty") %></span>                 <hr class="my-2">
                 <!--  <span><strong>버스 단독 투어 (기본 8시간 / 8명):</strong> 2 ( <span class="currency_type">$</span>350 <span class="small exchange-rate">(441,294원)</span>)</span> -->                
                  </div>
              </a>
            </div>
                        <div class="px-3 my-3 text-center">
              <div class="cart-item-label">소계</div><span class="text-xl font-weight-medium"> <span class="currency_type"><fmt:formatNumber value="${goods.gcost}" pattern="000,000"/></span>원 <!-- <span class="small exchange-rate">(882,588원)</span> --></span>
            </div>
            <div class="px-3 my-3 text-center">
              <div class="cart-item-label">할인가</div>
              <span class="text-xl font-weight-medium">-</span>
            </div>
                      </div>
                    <div class="text-right pb-4">
            <span class="text-muted">총계:</span>
            <span class="text-xl font-weight-medium">&nbsp; <span class="currency_type"><fmt:formatNumber value="${goods.gcost}" pattern="000,000"/></span>원 <!-- <span class="small exchange-rate">(882,588원)</span> --></span>
          </div>

          <h3 class="h5 pt-5 ">결제방식</h3>
          <div class="alert alert-info">
            <h6 class="m-t-0 regular-title">예약 결제방식 선택 안내</h6>
            <p>모든 예약건은 결제가 완료 된 건에 한하여 순차적으로 확정을 진행하고 있습니다. 이하 내용을 참고 하시어 원하시는 결제 방식을 선택하여 주십시요.</p><p>단, 카드 결제시 3.5%의 이용수수료가 부과됩니다.</p>          </div>
          <div class="accordion accordion-style-2 payment-accordion" id="accordion" role="tablist">
                        <div class="card">
              <div class="card-header" role="tab">
                <h6>
                  <a class="collapsed pl-0" href="#card" data-toggle="collapse">
                    
                    <div class="text">
                     간편 결제  </div>
                  </a>
                </h6>
              </div>
              <div class="collapse" id="card" data-parent="#accordion" role="tabpanel">
                <div class="card-body px-0">
                  <p>결제 가능한 결제수단:&nbsp;&nbsp; 
                  KAKAO PAY 	                 </p>
                  <img class="d-inline-block align-middle" src="/img/kakaopay.png" style="height: 35px;" alt="Cerdit Cards">
                  
             <input type="hidden" id="amount" name="amount" value='<c:out value="${goods.gcost}" />'>
			<form action="/goods/reservation" method="post" name="orderForm">

                    <div class="jumbotron py-4 mb-3 w-100">
                    <h6 class="mb-3 regular-title"><strong>간편결제 이용시, 결제 확정이 바로 진행됩니다</strong></h6><ul class="mb-0"><li>날씨 또는 예약 만석, 기타 부득이한 이유로 확정이 불가할 시, 일정 변경을 위해 상담원이 등록하신 연락처로 연락 드립니다. 연락을 계속적으로 시도 했음에도 불구하고 연결이 어려울 시 요청주신 모든 문의는 자동취소 되는 점 사전 양해 부탁드립니다.</li><li>하와이 현지에서 결제가 진행(USD결제) 되며, 해외 승인으로 처리됩니다. 결제 시점에 따라 청구되는 원화 금액은 환율 변동으로 인해 홈페이지에서 표시되는 원화 금액과 상이 할 수 있습니다. </li></ul>
                    </div>
                    <div class="form-group col-sm-7">
                      <div class="py-3">
                        <div class="float-left">최종 결제금액:</div>
                        <div class="float-right"> <span class="price-emphasize"><fmt:formatNumber value="${goods.gcost}" pattern="000,000"/></span>원   </div>
                        <div class="clearfix"></div>
                      </div>
                    </div>	
                      <div class="form-group col-sm-5">
                      <div class="alert alert-danger text-small py-3">최종 결제금액을 확인해 주세요.</div>
                    </div>
                     <div class="col-sm-4">
                     <button type="button" id="payKaKao" class="alert alert-default">카카오페이</button>
                     </div>
                    
                    <input type="hidden" id="user_id" name="user_id" value="${userId}">
                      <input type="hidden" id="amount" name="amount" value='<c:out value="${goods.gcost}" />'>
                      <input type="hidden" id="gcode" name="gcode" value='<c:out value="${gcode}" />'>
                      <input type="hidden" id="gname" name="gname" value='<c:out value="${goods.gname}" />'>
                      <input type="hidden" id="gtransit" name="gtransit" value='<c:out value="${goods.gtransit}" />'>
                      <input type="hidden" id="gfromDate" name="gfromDate" value='<fmt:formatDate value="${goods.gfromDate}" pattern="yyyy-MM-dd"/>'>
                      <input type="hidden" id="gtoDate" name="gtoDate" value='<fmt:formatDate value="${goods.gtoDate}" pattern="yyyy-MM-dd"/>'>
                    <input type="hidden" id="gconfirmQty" name="gconfirmQty" value="<%=request.getParameter("gconfirmQty") %>"/>
                    
                     
                       
              	</form>
                              
                </div>
              </div>
            </div>
                      
                      </div>
          <div class="wizard-footer d-flex justify-content-between px-0">
            <a class="btn btn-secondary my-2" href="/goods/getdisp?gcode=${gcode}">
              <i class="fa fa-arrow-left"></i><span class="d-none d-sm-inline-block">장바구니로 돌아가기</span>
            </a>
          </div>
        </div>
      </div>
    </div>
    <!-- Sidebar-->
    <aside class="col-xl-3 col-lg-4 pb-4 mb-2">
      <div class="card border card-reservation-contact mb-4">
	<div class="card-body">
		<div class="mb-2">
			<h5 class="card-title">알로하오에</h5>
			<p class="contact-info-item">여행중 선택관광 문의</p>
			<p class="contact-info-item">[한국] 오전 3시 - 오후 1시</p>			
		</div>
		
		<p class="contact-info-item">출발전 선택관광/호텔/항공 예약 문의</p>
		<p class="contact-info-item">평일 [한국] 월~금: 오전 9시 - 오후 6시 <br>주말 [한국] 토요일: 오전 9시 - 오후 2시 / 일요일, 공휴일 휴무</p>
		<p class="contact-info-phone"><i class="fa fa-phone-square ml-2 mr-1"></i>02-732-1505</p>
		</div>
</div>      
    </aside>
  </div>
</div>

            
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
        
        
       
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        return;
    }

    	alert(msg);
    	 orderForm.submit();
});
});

</script>		


<!-- <script src="https://gajahawaii.com/assets/js/vendor-min.js?v=699c38a635f8f0be105430cfbae9bbc0"></script> -->
 




<%@include file="../includes/footer.jsp"%>
