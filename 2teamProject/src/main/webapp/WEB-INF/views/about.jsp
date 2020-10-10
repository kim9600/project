<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./includes/css.jsp"%>
<%@ include file="./includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<!-- bradcam_area  -->
   <div class="bradcam_area bradcam_bg_3">
      <div class="container">
         <div class="row">
            <div class="col-xl-12">
               <div class="bradcam_text text-center">
                  <h3>About Us</h3>
                  <p>Welcome to our site</p>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!--/ bradcam_area  -->
   
<section class="contact-section">
   <div class="container"> 
      <div class="d_none d-sm block mb-5 pb-4">
         <div id="map" style="height: 480px; position: relative; overflow: hidden;">...</div>
            <script type="text/javascript">
                        function initMap() {
                            var uluru = {
                                lat: -25.363,
                                lng: 131.044
                            };
                            var grayStyles = [{
                                    featureType: "all",
                                    stylers: [{
                                            saturation: -90
                                        },
                                        {
                                            lightness: 50
                                        }
                                    ]
                                },
                                {
                                    elementType: 'labels.text.fill',
                                    stylers: [{
                                        color: '#ccdee9'
                                    }]
                                }
                            ];
                            var map = new google.maps.Map(document.getElementById('map'), {
                                center: {
                                    lat: -31.197,
                                    lng: 150.744
                                },
                                zoom: 9,
                                styles: grayStyles,
                                scrollwheel: false
                            });
                        }
                    </script>
                    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I&amp;callback=initMap" type="text/javascript">
                    </script>                        
      </div>
   </div>

   
<div class="recent_trip_area">
   <div class="container">
      <div class="row justify-content-center">
            <div class="col-lg-6">
            <div class="section_title text-center mb_70">
               <h3>Recent Trips</h3>
            </div>
         </div>
      </div>
      
      <div class="row">
         <div class="col-lg-4 col-md-6">
            <div class="single_trip">
               <div class="thumb">
                  <img src="/resources/img/trip/1.png" alt="">
               </div>
            <div class="info">
               <div class="date">
                  <span>Oct 12, 2019</span>
               </div>
               
               <a href="#"><h3>Journeys Are Best Measured In New Friends</h3></a>
            </div>
         </div>
      </div>
      
      <div class="col-lg-4 col-md-6">
         <div class="single_trip">
            <div class="thumb">
               <img src="/resources/img/trip/2.png" alt="">
            </div>
                <div class="info">
                   <div class="date">
                      <span>Oct 12, 2019</span>
               </div>
               
               <a href="#"><h3>Journeys Are Best Measured In New Friends</h3></a>
            </div>
         </div>
      </div>
                
      <div class="col-lg-4 col-md-6">
         <div class="single_trip">
            <div class="thumb">
               <img src="/resources/img/trip/3.png" alt="">
            </div>
            <div class="info">
               <div class="date">
                  <span>Oct 12, 2019</span>
               </div>
               <a href="#"><h3>Journeys Are Best Measured In New Friends</h3></a>
            </div>
         </div>
      </div>
      </div>
   </div>
</div>
</section>      
<%@include file="./includes/footer.jsp"%>
</body>
</html>