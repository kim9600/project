<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/css.jsp" %>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<script>
function findId(e) {
   var name = $('#name').val();
   var email = $('#email').val();

   e.preventDefault;
     
   $.ajax({
      type:'GET',
      url:'/users/findId?name='+name+"&email="+email,
      type:'text',   
      success:function(result,status,xhr){
         alert("ID는 "+result+"입니다.");      
         },
      error:function(xhr,status,er){
         alert("이름과 email을 다시 한 번 확인해 주세요.");
         }
   });
} 
</script>
<title>아이디찾기</title>
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
   <form action="/users/findId" method="post">
      <div class="row justify-content-center">               
         <div class="section_title text-center mb_70">
            <h3>아이디 찾기</h3>
            <p>가입하신 name과 email을 입력해주세요.</p>                              
         </div>              
      </div>      
      <div class="row justify-content-center">               
         <div class="mt-10">
            <input type="text" id="name" name="name" placeholder="name" required class="single-input" />               
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
            <input type="button" class="boxed-btn4" value="아이디 찾기" onclick= "return findId(this);" />                     
         </div>                      
      </div>                   
   </form>            
   </div>
</section>  
</body>
</html>  
<%@ include file="../includes/footer.jsp" %>