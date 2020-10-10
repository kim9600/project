<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/css.jsp" %>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>비밀번호찾기</title></head>
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
   <form action="/users/findPw" method="post">
      <div class="row justify-content-center">               
         <div class="section_title text-center mb_70">
            <h3>비밀번호 찾기</h3>
            <p>가입하신 ID와 email을 입력해주세요.</p>                              
         </div>              
      </div>      
      <div class="row justify-content-center">               
         <div class="mt-10">
            <input type="text" id="id" name="id" placeholder="id" required class="single-input" />               
         </div>                      
      </div>
      
      <div class="row justify-content-center">               
         <div class="mt-10">
            <input type="text" id="email" name="email" placeholder="email" required class="single-input"/>               
         </div>                      
      </div>
      <br>
      <div class="row justify-content-center">                
         <div class="mt-10">
            <input type="submit" class="boxed-btn4" value="비밀번호 찾기" />                     
         </div>                      
      </div>                   
   </form>            
   </div>
</section> 
</body>
</html>  
<%@ include file="../includes/footer.jsp" %>