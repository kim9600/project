<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/css.jsp" %>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title><spring:message code="message.user.login.title"/></title>
</head>
<body>
<!-- bradcam_area  -->
<div class="bradcam_area bradcam_bg_4">
   <div class="container">
      <div class="row">
         <div class="col-xl-12">
            <div class="bradcam_text text-center">
               <h3>Login</h3>               
               <p>Welcome to our site</p>
            </div>
            </div>
      </div>
   </div>
</div>
<!-- bradcam_area end -->
<section class="sample-text-area">
   <div class="container box_1170">
   <form action="/userlogin/login" method="post">
      <div class="row justify-content-center">               
         <div class="section_title text-center mb_70">
            <h3>Login</h3>
            <p>가입하신 아이디와 패스워드를 입력해주세요.</p>
            <c:if test="${msg==false}">
               <p style="color:#f00;">잘못된 아이디/비밀번호 입니다.</p>
            </c:if>                      
         </div>              
      </div>      
      <div class="row justify-content-center">               
         <div class="mt-10">
            <input type="text" id="id" name="id" value="${user.id}" placeholder="id" required class="single-input">               
         </div>                      
      </div>
      
      <div class="row justify-content-center">               
         <div class="mt-10">
            <input type="password" id="password" name="password" value="${user.password}" placeholder="password" required class="single-input">               
         </div>                      
      </div>
      <br>
      <div class="row justify-content-center">                
         <div class="mt-10">
            <input type="submit" class="button button-contactForm boxed-btn" value="로그인" />
            <input type="button" class="button button-contactForm boxed-btn" value="회원가입" onclick="location.href='/users/register' "/>                     
         </div>                      
      </div>
      <br>
      <div class="row justify-content-center">
         <div class="col-lg-6">
            <div class="section_title text-center mb_70">
               <i class="fa fa-check"></i>
                    <a href="/users/findId">아이디찾기</a>
                    <i class="fa fa-check"></i>
                    <a href="/users/findPw">비밀번호찾기</a>                                                        
            </div>
         </div>
      </div>              
   </form>            
   </div>
</section> 
</body>
</html>
<%@ include file="../includes/footer.jsp" %>