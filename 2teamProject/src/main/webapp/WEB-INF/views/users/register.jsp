<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/css.jsp" %>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title><spring:message code="message.user.login.registBtn"/></title>
   <script type="text/javascript">
function chk(){
   var pass1 = document.forms[0].password.value;
   var pass2 = document.forms[0].password2.value;
   if(pass1!=pass2){
      alert('비밀번호확인값이 서로 다릅니다.');
      document.forms[0].password.value='';
      document.forms[0].password2.value='';
      document.forms[0].password.focus();
      return false;
   }
}
function chkId(){
   $.ajax({
      url : "/users/chkId",
      type : "post",
      dataType : "json",
      data : {"id" : $("#id").val()},
      success : function(data){
         if(data == 1){
            alert("중복된 아이디입니다.");      
            document.forms[0].id.value='';                  
            
         }else if(data == 0){
            $("#chkId").attr("value", "Y");
            alert("사용가능한 아이디입니다.");            
         }
      }
   })
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
                        <h3>Register</h3>
                        <p>Welcome to our site</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <!-- ================ contact section start ================= -->
    <section class="contact-section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2 class="contact-title"><spring:message code="message.user.login.registBtn"/></h2>
                    </div>
                    <div class="col-lg-8">
                        <form class="form-contact contact_form" action="register" method="post" id="contactForm" onsubmit="return chk()">
                            <div class="row">
                             
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control" name="id" id="id" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.user.login.id"/>'" placeholder="<spring:message code="message.user.login.id"/>">                                                                          
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="button" class="button button-contactForm boxed-btn" id="idChk" value="아이디 중복체크" onclick="return chkId()">
                                    </div>
                                </div>                                
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="password" id="password" type="password" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.user.login.password"/>'" placeholder="<spring:message code="message.user.login.password"/>">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="password2" id="password2" type="password" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.user.login.passwordConfirm"/>'" placeholder="<spring:message code="message.user.login.passwordConfirm"/>">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="name" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.user.login.name"/>'" placeholder="<spring:message code="message.user.login.name"/>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control valid" name="eng_Lastname" id="eng_Lastname" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.user.login.engLastname"/>'" placeholder="<spring:message code="message.user.login.engLastname"/>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control valid" name="eng_Firstname" id="eng_Firstname" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.user.login.engFirstname"/>'" placeholder="<spring:message code="message.user.login.engFirstname"/>">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="primary-radio" name="gender" type="radio" value="M" checked="checked">M&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <input class="primary-radio" name="gender" type="radio" value="W">W
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="birth" id="birth" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.user.login.birth"/> ex)20020101'" placeholder="<spring:message code="message.user.login.birth"/> ex)20020101">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="email" id="email" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.user.login.email"/> ex)hong@gmail.com'" placeholder="<spring:message code="message.user.login.email"/> ex)hong@gmail.com">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="phone" id="phone" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = '<spring:message code="message.user.login.phone"/> ex)01012345678'" placeholder="<spring:message code="message.user.login.phone"/> ex)01012345678">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                                <input type="submit" class="button button-contactForm boxed-btn" value='<spring:message code="message.user.login.registBtn"/>'/>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
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
    </html>
    <%@ include file="../includes/footer.jsp" %>