<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.TimeZone"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<script>
function bookmark(){
   alert("Ctrl+D를 누르면 즐겨찾기에 추가하실 수 있습니다.");
}
</script>
<script>
function timeChange(){   
  var aestTime = new Date().toLocaleString("en-US", {timeZone: "Pacific/Honolulu"});  
  alert("지금 하와이는 "+aestTime+"입니다.");
}
</script>
<header>
	<div class="header-area ">
		<div id="sticky-header" class="main-header-area">
			<div class="container-fluid">
				<div class="header_bottom_border">
					<div class="row align-items-center">

						<div class="col-xl-2 col-lg-2">                  
							<div class="logo">
								<a href="/">
									<img src="/resources/img/logo.png" alt="" width="160px">
								</a>
							</div>
						</div>
                  
						<div class="col-xl-6 col-lg-6">
							<div class="main-menu d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a class="active" href="/">home</a></li>
	                              
										<li><a class="active" href="/about">about</a></li>
	                              
										<c:if test="${userName.role!='admin'}">
											<li><a href="/goods/displist">products</a></li>
										</c:if>
	                               
										<c:if test="${userName.role=='admin'}">
											<li><a href="/goods/list">products</a></li>
										</c:if>   
	                                        
										<li><a href="/notice/notice">contact<i class="ti-angle-down"></i></a>
											<ul class="submenu">
												<li><a href="/notice/notice">공지사항</a></li>
												<li><a href="/qna/qna">문의사항</a></li>
												<li><a href="/review/list">여행후기</a></li>
											</ul>
										</li>
										<c:if test="${userName.role=='admin'}">
											<li><a href="/users/userlist">userlist</a></li>
										</c:if>
									
										<li>
											<input type="button" class="genric-btn warning circle" value="지금 하와이는 몇시?" onclick="timeChange()">
										</li>                                         
									</ul>
								</nav>
							</div>                  
						</div>               
                         
						<div class="col-xl-4 col-lg-4 d-none d-lg-block">
							<div class="social_wrap d-flex align-items-center justify-content-end">
								<div class="number">
									<c:if test="${userName==null}">
										<a href="/userlogin/login"><i class="fa fa-lock">&nbsp;로그인</i></a>&nbsp;&nbsp;                              
										<a href="/users/register"><i class="fa fa-user">&nbsp;회원가입</i></a>&nbsp;&nbsp;
										<a href="#" onclick="return bookmark()"><i class="fa fa-bookmark">&nbsp;즐겨찾기</i></a>
									</c:if>

									<c:if test="${userName!=null}">
										${userName.name}님 환영합니다.<br>
										<a href="/users/logout"><i class="fa fa-unlock">&nbsp;로그아웃</i></a>&nbsp;&nbsp;
										<c:if test="${userName.role!='admin'}">
										<a href="/goods/orderList?id=${userId}"><i class="fa fa-shopping-cart">&nbsp;주문내역 조회</i></a>&nbsp;&nbsp;
										</c:if>
										<a href="/users/myInfo?id=${userId}"><i class="fa fa-user">&nbsp;내 정보 조회</i></a>   
									</c:if>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- header-end -->