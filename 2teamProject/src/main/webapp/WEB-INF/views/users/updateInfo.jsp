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
<title><spring:message code="message.user.login.updateBtn" /></title>
<script type="text/javascript">
   function chk() {
      var pass1 = document.forms[0].password.value;
      var pass2 = document.forms[0].password2.value;
      if (pass1 != pass2) {
         alert('비밀번호확인값이 서로 다릅니다.');
         document.forms[0].password.value = '';
         document.forms[0].password2.value = '';
         document.forms[0].password.focus();
         return false;
      }
   }
   function deleteUser(id) {
      var yesno = confirm(id + "회원님 정말 탈퇴하시겠습니까?");
      if (yesno) {
         location.href = 'deleteUser.do?id=' + id;//GET
      } else {
         return;
      }
   }
</script>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
   <!-- bradcam_area  -->
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
   <!--/ bradcam_area  -->

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

            <!-- ================ contact section start ================= -->
            <div class="col-lg-6">
               <h2 class="contact-title">회원정보 수정</h2>
               <form class="form-contact contact_form" action="updateInfo" method="post" id="contactForm" onsubmit="return chk()">               

               <div class="col-12">
                  <div class="form-group">                     
                     <input class="form-control" name="id" id="id" type="text" value="${user.id}" 
                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'id'"   placeholder="id" readonly="readonly">
                  </div>
               </div>

               <div class="col-12">
                  <div class="form-group">
                     <input class="form-control" name="password" id="password" type="password"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" placeholder="비밀번호">
                  </div>
               </div>
               
               <div class="col-12">
                  <div class="form-group">
                     <input class="form-control" name="password2" id="password2" type="password"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'" placeholder="비밀번호 확인">
                  </div>
               </div>

               <div class="col-12">
                  <div class="form-group">
                     <input class="form-control" name="name" id="name" type="text" value="${user.name}"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'name'" placeholder="name">
                  </div>
               </div>
               
               <div class="col-sm-6">
                  <div class="form-group">
                     <input class="form-control valid" name="eng_Lastname" id="eng_Lastname" type="text" value="${user.eng_Lastname}"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'eng_Lastname'" placeholder="eng_Lastname">
                  </div>
               </div>
               
               <div class="col-sm-6">
                  <div class="form-group">
                     <input class="form-control valid" name="eng_Firstname" id="eng_Firstname" type="text" value="${user.eng_Firstname}"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'eng_Firstname'" placeholder="eng_Firstname">
                  </div>
               </div>
               
               <div class="col-12">
                  <div class="form-group">
                     <c:if test="${user.gender=='M'}">
                        <input class="primary-radio" name="gender" type="radio" value="M" checked="checked">M&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <input class="primary-radio" name="gender" type="radio" value="W">W
                      </c:if>                      
                     <c:if test="${user.gender=='W'}">
                        <input class="primary-radio" name="gender" type="radio" value="M">M&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="primary-radio" name="gender" type="radio" value="W" checked="checked">W
                      </c:if>
                  </div>
               </div>
               
               <div class="col-12">
                  <div class="form-group">
                     <input class="form-control" name="birth" id="birth" type="text" value="${user.birth}"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'ex)20020101'" placeholder="ex)20020101">
                  </div>
               </div>
               
               <div class="col-12">
                  <div class="form-group">
                     <input class="form-control" name="email" id="email" type="text" value="${user.email}" 
                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'ex)hong@gmail.com'" placeholder="ex)hong@gmail.com">
                  </div>
               </div>
               
               <div class="col-12">
                  <div class="form-group">
                     <input class="form-control" name="phone" id="phone" type="text" value="${user.phone}" 
                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'ex)01012345678'"   placeholder="ex)01012345678">
                  </div>
               </div>
               
               <div class="col-12">
                  <div class="form-group">
                     <input class="form-control" name="role" id="role" type="text" value="${user.role}"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'role'" placeholder="role" readonly="readonly">
                  </div>
               </div>
               
               <div class="form-group mt-3">
                  <input type="submit" class="genric-btn info circle" value='수정' />
                  <input type="button" class="genric-btn danger circle" value='탈퇴' onclick="deleteUser('${user.id}')" />
               </div>
            </form>
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