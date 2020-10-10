<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/css.jsp"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>내 정보</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
   <div class="bradcam_area bradcam_bg_4">
      <div class="container">
         <div class="row">
            <div class="col-xl-12">
               <div class="bradcam_text text-center">
                  <h3>My Info</h3>
                  <p>Welcome to our site</p>
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- 내용 -->
   <!-- container -->
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
            </div>
            <!-- 사이드바 끝 -->

            <div class="col-lg-6">
               <h2 class="contact-title">내 정보</h2>

               <div class="col-12">
                  <div class="form-group">
                     <input class="single-input" name="id" id="id" type="text"
                        value="${user.id}" readonly="readonly">
                  </div>
               </div>

               <div class="col-12">
                  <div class="form-group">
                     <input class="single-input" name="name" id="name" type="text"
                        value="${user.name}" readonly="readonly">
                  </div>
               </div>

               <div class="col-sm-6">
                  <div class="form-group">
                     <input class="single-input" name="eng_Lastname" id="eng_Lastname"
                        type="text" value="${user.eng_Lastname}" readonly="readonly">
                  </div>
               </div>

               <div class="col-sm-6">
                  <div class="form-group">
                     <input class="single-input" name="eng_Firstname"
                        id="eng_Firstname" type="text" value="${user.eng_Firstname}"
                        readonly="readonly">
                  </div>
               </div>

               <div class="col-12">
                  <div class="form-group">
                     <input class="single-input" name="gender" id="gender" type="text"
                        value="${user.gender}" readonly="readonly">
                  </div>
               </div>

               <div class="col-12">
                  <div class="form-group">
                     <input class="single-input" name="birth" id="birth" type="text"
                        value="${user.birth}" readonly="readonly">
                  </div>
               </div>

               <div class="col-12">
                  <div class="form-group">
                     <input class="single-input" name="email" id="email" type="text"
                        value="${user.email}" readonly="readonly">
                  </div>
               </div>

               <div class="col-12">
                  <div class="form-group">
                     <input class="single-input" name="phone" id="phone" type="text"
                        value="${user.phone}" readonly="readonly">
                  </div>
               </div>

               <div class="col-12">
                  <div class="form-group">
                     <input class="single-input" name="role" id="role" type="text"
                        value="${user.role}" readonly="readonly">
                  </div>
               </div>

               <div class="row justify-content-center">
                  <div class="mt-10">
                     <input type="button" class="button button-contactForm boxed-btn"
                        value="회원정보수정"
                        onclick="location.href='/users/updateInfo?id=${userId}'" /> <input
                        type="button" class="button button-contactForm boxed-btn"
                        value="주문내역 조회" onclick="location.href='/goods/orderList'" />
                  </div>
               </div>
            </div>

            <div class="col-lg-3">
               <div class="media contact-info">
                  <span class="contact-info__icon"><i class="ti-home"></i></span>
                  <div class="media-body">
                     <h3>Buttonwood, California.</h3>
                     <p>Rosemead, CA 91770</p>
                  </div>
               </div>
               
               <div class="media contact-info">
                  <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                  <div class="media-body">
                     <h3>+1 253 565 2365</h3>
                     <p>Mon to Fri 9am to 6pm</p>
                  </div>
               </div>
               
               <div class="media contact-info">
                  <span class="contact-info__icon"><i class="ti-email"></i></span>
                  <div class="media-body">
                     <h3>support@colorlib.com</h3>
                     <p>Send us your query anytime!</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
<!-- ================ contact section end ================= -->
</body>
<%@ include file="../includes/footer.jsp"%>
</html>