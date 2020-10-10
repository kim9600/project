<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/css.jsp" %>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>interior</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    
    <!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_1">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>orderList </h3>
                        <p>Aloha-oe</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->


    <!--================Blog Area =================-->
   <section class="blog_area section-padding">
      <div class="travelo_container">
         <div class="row">         
            <div class="col-lg-3">
               <div class="blog_right_sidebar">
                  <aside class="single_sidebar_widget post_category_widget travelo_sidebar">
                     <h4 class="widget_title">마이페이지</h4>
                     <ul class="list cat-list">
                        <li><a href="/users/myInfo?id=${userId}" class="d-flex"><p>내 정보</p></a></li>

                        <li><a href="/users/updateInfo?id=${userId}" class="d-flex"><p>회원정보 수정</p></a></li>

                        <li><a href="/goods/orderList" class="d-flex"><p>결제내역</p></a></li>
                     </ul>
                  </aside>
               </div>
            </div>  <!-- 사이드바 끝 -->
                
                <div class="col-lg-8">
                <div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
	<c:forEach items="${orderList}" var="order">
		<tr style="text-align:center">
		<th><p>결제번호</p>
			<p>[결제일자]</p>
		</th>
		<th style="width:50px;">이미지</th>
		<th>패키지이름</th>
		<th>주문가격</th>
		<th>교통편</th>
		<th>확정인원</th>
		<th>출발 - 도착 날짜 </th>
		<th>예약확정</th>
		
		</tr>
		<tr style="text-align:center">
		<td><p>${order.order_id}</p>
			<p><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd"/></p>
		</td>
		<td style="width:50px;"><div class="cart-item-product-thumb">
				<a href="/goods/getdisp?gcode=${order.gcode}">
                  <img src="/img/${order.images}" alt="${order.gname}" width="100px" height="100px">
				</a>
                </div> </td>
		 <td>
		 <a href="/goods/getdisp?gcode=${order.gcode}">
		 <c:out value="${order.gname}" />
		 </a></td>
		<td><c:out value="${order.amount}" /></td>
		<td><c:out value="${order.gtransit}" /></td>
		<td><c:out value="${order.gconfirmQty}" /></td>
		<td><p><fmt:formatDate value="${order.gfromDate}" pattern="yyyy-MM-dd"/></p>~<p><fmt:formatDate value="${order.gtoDate}" pattern="yyyy-MM-dd"/></p> </td>
		<td>
		<form action="/goods/confirm" method="post">
		 <input type="hidden" value="${order.gcode}" name="gcode">
		 <input type="hidden" value="${order.gconfirmQty}" name="gconfirmQty">
		 <c:if test="${order.flag==0}">
			<button id="order" onclick="order_check();">예약확정</button>
		 </c:if>
		<c:if test="${order.flag!=0}">
			확정완료
		 </c:if>
		 <!-- <button>예약확정</button> -->
		</form>
		</td>
		
		</tr>
		</c:forEach>
</table>
	
</div>
 <p> < 취소/환불은 7일 이내로 가능합니다.> </p>
    </div>            
                
                
                
                
                
                
                
                
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
 <script>
function order_check(){
	alert('예약 확정 되었습니다.');
}
 </script>
 
   

    

   
</body>
</html>
<%@ include file="../includes/footer.jsp"%>