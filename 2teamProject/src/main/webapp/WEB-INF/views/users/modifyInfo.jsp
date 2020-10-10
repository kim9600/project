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
    <title>회원상세정보&권한수정</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

   

     <!-- bradcam_area  -->
     <div class="bradcam_area bradcam_bg_4">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3>Modify</h3>
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
                        <h2 class="contact-title">회원상세정보&권한수정</h2>
                    </div>
                    <div class="col-lg-8">
                        <form class="form-contact contact_form" action="modifyInfo.do" method="post" id="contactForm">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="id" id="id" type="text" value="${user.id}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="name" id="name" type="text" value="${user.name}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control valid" name="eng_Lastname" id="eng_Lastname" type="text" value="${user.eng_Lastname}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control valid" name="eng_Firstname" id="eng_Firstname" type="text" value="${user.eng_Firstname}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="gender" id="gender" type="text" value="${user.gender}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="birth" id="birth" type="text" value="${user.birth}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="email" id="email" type="text" value="${user.email}" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="phone" id="phone" type="text" value="${user.phone}" readonly="readonly">
                                    </div>
                                </div>
                                 <div class="col-12">
                                    <div class="form-group">
                                        <select name="role">
        									  <c:forEach var="role" items="${roleMap}">
         									    <option value="${role.key}" <c:if test="${role.key==user.role}">selected</c:if>> ${role.value}</option>
        									  </c:forEach>
       								    </select>
                                    </div>
                                </div>
                  		       </div>
                            <div class="form-group mt-3">
                                <input type="submit" class="button button-contactForm boxed-btn" value='<spring:message code="message.user.login.updateBtn"/>'/>                            </div>
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
    <%@ include file="../includes/footer.jsp" %>
    </html>
    