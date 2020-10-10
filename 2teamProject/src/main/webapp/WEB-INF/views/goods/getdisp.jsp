<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/css.jsp"%>
<link rel="stylesheet" href="/resources/css/reservation.css">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">여행상품 상세 보기</h1>
	</div>
</div>
<div class="activity-product">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-info">
				<div class="recent_trip_area">
					<div class="container">
						<div class="row">
							<div class="col-lg-8 col-md-12">
								<div class="single_trip">
									<div class="thumb text-center">
										<img src='<c:url value="/img/${goods.images}"/>'
											style="width: 100%">
										<h3>${goods.gname}</h3>
										<h5>(${goods.gcode})</h5>
									</div>
								</div>
								<section
									class="product-content-block timeline-container mt-4 pt-4 mb-4 pb-2">
									<h5 class="block-title">일정표</h5>
									<ul class="timeline timeline-type-standard">
										<li>
											<div class="timeline-icon">
												<span class="fa-stack fa-2x"> <i
													class="fa fa-map-marker"></i>
												</span>
											</div>
											<div class="row">
												<div class="col-sm-3 order-1 order-sm-1">
													<div class="timeline-image img-thumbnail">
														<img
															src="https://s3-ap-northeast-1.amazonaws.com/media.gajahawaii.com/schedules/1126.jpg"
															class="img-fluid" alt="1일차">
													</div>
												</div>
												<div class="col-sm-9 order-1 order-sm-1">
													<div class="title">1일차</div>
													<div class="subtitle">인천&gt;오아후</div>
													<div class="description">
														<p>
															공항 도착 후, 입국심사 및 세관심사 후&nbsp;그룹출구에서 가이드 미팅<br> 합류차량으로
															<strong>공항 픽업+시내관광(하와이 주정부청사, 이올라니궁전, 카메하메하동상) +
																점심식사</strong><br> 호텔 이동하여 체크인 후 개별 자유 일정.&nbsp;
														</p>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="timeline-icon">
												<span class="fa-stack fa-2x"> <i
													class="fa fa-map-marker"></i> <i
													class="fas fa-map-marker-alt fa-stack-1x fa-inverse"></i>
												</span>
											</div>
											<div class="row">
												<div class="col-sm-3 order-1 order-sm-1">
													<div class="timeline-image img-thumbnail">
														<img
															src="https://s3-ap-northeast-1.amazonaws.com/media.gajahawaii.com/schedules/1127.jpg"
															class="img-fluid" alt="2일차">
													</div>
												</div>
												<div class="col-sm-9 order-1 order-sm-1">
													<div class="title">2일차</div>
													<div class="subtitle">오아후</div>
													<div class="description">
														<p>개별조식 후,&nbsp;지정된 시간에 가이드 미팅하여&nbsp;</p>

														<p>
															<strong>합류 오아후 1일 섬투어(와이켈레 코스)<br>
																다이아몬드헤드-한국지도마을-하나우마베이-마카푸포인트-블로우홀-중국인모자섬-노스쇼어-돌플랜테이션-와이켈레아울렛
															</strong>
														</p>

														<p>와이키키 귀환 후 휴식</p>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="timeline-icon">
												<span class="fa-stack fa-2x"> <i
													class="fa fa-map-marker"></i> <i
													class="fas fa-map-marker-alt fa-stack-1x fa-inverse"></i>
												</span>
											</div>
											<div class="row">
												<div class="col-sm-12">
													<div class="title">3~4일차</div>
													<div class="subtitle">오아후</div>
													<div class="description">
														<p>전일 자유일정</p>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="timeline-icon">
												<span class="fa-stack fa-2x"> <i
													class="fa fa-map-marker"></i> <i
													class="fas fa-map-marker-alt fa-stack-1x fa-inverse"></i>
												</span>
											</div>
											<div class="row">
												<div class="col-sm-12">
													<div class="title">5일차</div>
													<div class="subtitle">오아후&gt;인천</div>
													<div class="description">
														<p>
															지정된 시간에 가이드 미팅하여<br> 공항샌딩 서비스
														</p>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="timeline-icon">
												<span class="fa-stack fa-2x"> <i
													class="fa fa-map-marker"></i> <i
													class="fas fa-map-marker-alt fa-stack-1x fa-inverse"></i>
												</span>
											</div>
											<div class="row">
												<div class="col-sm-12">
													<div class="title">6일차</div>
													<div class="subtitle">인천</div>
													<div class="description">
														<p>인천국제공항 도착</p>
													</div>
												</div>
											</div>
										</li>
									</ul>
									<div class="alert alert-warning">
										<i class="fa fa-exclamation-triangle"></i> 구체적인 픽업시간 및 장소는 확정된
										바우처로 안내드릴 예정입니다.
									</div>
								</section>
							</div>
							<div class="col-lg-3 col-md-12">
								<div class="single_trip">
									<div class="info">
										<br>
										<label>출발일자</label>
										<input class="form-control" value='<fmt:formatDate value="${goods.gfromDate}" pattern="yyyy-MM-dd"/>' readonly>
										<label>도착일자</label>
										<input class="form-control" value='<fmt:formatDate value="${goods.gtoDate}" pattern="yyyy-MM-dd"/>'	readonly>
										<div>
											<label>확정인원</label>
											<br>
											<select name="gsetQty" id="gsetQty">
												<option value="1">1</option>											
												<option value="2">2</option>											
												<option value="3">3</option>											
												<option value="4">4</option>											
												<option value="5">5</option>											
												<option value="6">6</option>											
												<option value="7">7</option>											
												<option value="8">8</option>											
												<option value="9">9</option>											
												<option value="10">10</option>											
												<option value="11">11</option>											
											</select>
										</div><br><br>
											 
										<label>여행경비</label>
										<input class="form-control" value='<fmt:formatNumber type='number' value='${goods.gcost}'/>원' readonly>
										<label>여행 코멘트</label>
										<textarea class="form-control" readonly>${goods.gcomments}</textarea>
									</div>
								</div>
							</div>
						</div>
						<c:if test="${userName.role ne 'admin'}">
							<button data-oper='reservation' class="btn btn-success">예약</button>
						</c:if>
						<button data-oper='displist' class="btn btn-default">상품목록</button>

						<form id="reserForm" action="/goods/reservation" method="get">
							<input type="hidden" id="user_id" name="user_id" value='<c:out value="${userId}"/>'>
							<input type="hidden" id="gcode"   name="gcode"   value='<c:out value="${goods.gcode}"/>'>
							<input type="hidden" id="gname"   name="gname"   value='<c:out value="${goods.gname}"/>'>
							<input type="hidden" id="gcost"   name="gcost"   value='<c:out value="${goods.gcost}"/>'>
							<input type="hidden" id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
							<input type="hidden" name="amount" value='<c:out value="${amount}"/>'>
							<input type="hidden" id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>'>
							<input type="hidden" id='type'    name='type'    value='<c:out value="${cri.type}"/>'>
							<input type="hidden" id="gconfirmQty" name="gconfirmQty" value="">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 수정/리스트 페이지로이동 처리 스크립트  -->
<script>
	$(document).ready(function(){
		var reserForm= $("#reserForm");
		$("button[data-oper='displist']").on("click", function(e) {
			reserForm.attr("action", "/goods/displist");
			reserForm.find("#user_id").remove();
			reserForm.find("#gcode").remove();
			reserForm.find("#gname").remove();
			reserForm.find("#gcost").remove();
			reserForm.submit();
		});

		$("button[data-oper='reservation']").on("click",function(e){
			if(${userName== null}){
				alert('로그인을 해주세요');
				return history.back();
			}else{
				reserForm.attr("action", "/goods/reservation");
				reserForm.find("#gcode").remove();
				reserForm.find("#user_id").remove();
				reserForm.find("#pageNum").remove();
				reserForm.find("#amount").remove();
				reserForm.find("#keyword").remove();
				reserForm.find("#type").remove();
				var qty=$("#gsetQty option:selected").val();
				$('#gconfirmQty').val(qty);
				
				reserForm.submit();
			}
		});
	});
</script>

<%@ include file="../includes/footer.jsp"%>