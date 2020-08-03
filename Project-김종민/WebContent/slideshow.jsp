<%@page import="dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
		ProductDAO dao = ProductDAO.getInstance();
		List<Product> pList = new ArrayList<Product>();
		int total_record = dao.getProductCount();
		pList = dao.getProductList();
		int pageNum = 0;
	  String pic0 = "";
	  String pname0 = "";
		String pdesc0 = "";
		int pcost0 = 0;
		String pid0 = "";
	  String pic1 = "";
	  String pname1 = "";
		String pdesc1 = "";
		int pcost1 = 0;
		String pid1 = "";
	  String pic2 = "";
	  String pname2 = "";
		String pdesc2 = "";
		int pcost2 = 0;
		String pid2 = "";
	  String pic3 = "";
	  String pname3 = "";
		String pdesc3 = "";
		int pcost3 = 0;
		String pid3 = "";
	  String pic4 = "";
	  String pname4 = "";
		String pdesc4 = "";
		int pcost4 = 0;
		String pid4 = "";
	  String pic5 = "";
	  String pname5 = "";
		String pdesc5 = "";
		int pcost5 = 0;
		String pid5 = "";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품코드</title>
</head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial;
  margin: 0;
}
* {
  box-sizing: border-box;
}
img {
  vertical-align: middle;
}
/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}
/* Hide the images by default */
.mySlides {
  display: none;
}
/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}
/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}
/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}
/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}
/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}
/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}
.row:after {
  content: "";
  display: table;
  clear: both;
}
/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}
/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}
.active,
.demo:hover {
  opacity: 1;
}
</style>
<body>
<%
	if(request.getParameter("pageNum") != null)
		 pageNum = Integer.parseInt(request.getParameter("pageNum"));
%>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-5">상품목록</h1>
		</div>
	</div>
	<div class="text-right">
		<span class="badge badge-success">전체<%=total_record%>건</span>
	</div>

 	<%@include file="dbconn.jsp" %>

  <!-- <h2 style="text-align:center">(Pet Gallery)</h2> -->

 	<%
		for(int i=0;i<pList.size();i++){
			Product pd = pList.get(i);
		 	if(i==5){
		 		pic5   = pd.getFilename();
		 		pname5 = pd.getPname();
		 		pdesc5 = pd.getDescription();
		 		pcost5 = pd.getUnitPrice();
		 		pid5   = pd.getProductId();
		 	}else if(i==4){
		 		pic4   = pd.getFilename();
		 		pname4 = pd.getPname();
		 		pdesc4 = pd.getDescription();
		 		pcost4 = pd.getUnitPrice();
		 		pid4   = pd.getProductId();
		 	}else if(i==3){
		 		pic3   = pd.getFilename();
		 		pname3 = pd.getPname();
		 		pdesc3 = pd.getDescription();
		 		pcost3 = pd.getUnitPrice();
		 		pid3   = pd.getProductId();
			}else if(i==2){
		 		pic2   = pd.getFilename();
		 		pname2 = pd.getPname();
		 		pdesc2 = pd.getDescription();
		 		pcost2 = pd.getUnitPrice();
		 		pid2   = pd.getProductId();
		 	}else if(i==1){
		 		pic1   = pd.getFilename();
		 		pname1 = pd.getPname();
		 		pdesc1 = pd.getDescription();
		 		pcost1 = pd.getUnitPrice();
		 		pid1   = pd.getProductId();
		 	}else if(i==0){
		 		pic0   = pd.getFilename();
		 		pname0 = pd.getPname();
		 		pdesc0 = pd.getDescription();
		 		pcost0 = pd.getUnitPrice();
		 		pid0   = pd.getProductId();
		 	}
		}
	%>

  <div class="row">
		<div class="container" align="middle">
		  <div class="mySlides">
				<div class="numbertext">1 / 6</div>
			  <div class="row">
			    <div class="col-sm-8" align="left" style="background-color:lavender;">
						<img src="./resources/images/<%=pic0%>" style="width:80%" alt="<%=pname0%>">
					</div>
			    <div class="col-sm-4" style="background-color:lavenderblush;">
			    	<h4><%=pname0%></h4>
			    	<p><%=pdesc0%></p>
			    	<%-- <p><%=new DecimalFormat("#,###").format(<%=pcost0%>)%> --%>
			    	<p><%=pcost0%>원</p>
			    	<p><%=pid0%></p>
					  <p><a href="./product.jsp?id=<%=pid0%>"	class="btn btn-secondary" role="button">상품상세명세&raquo;</a>
					</div>
				</div>
			</div>
		
			<div class="mySlides">
		  	<div class="numbertext">2 / 6</div>
			  <div class="row">
			    <div class="col-sm-8" align="left" style="background-color:lavender;">
						<img src="./resources/images/<%=pic1%>" style="width:80%" alt="<%=pname1%>">
					</div>
			    <div class="col-sm-4" style="background-color:lavenderblush;">
			    	<h4><%=pname1%></h4>
			    	<p><%=pdesc1%></p>
			    	<p><%=pcost1%>원</p>
			    	<p><%=pid1%></p>
					  <p><a href="./product.jsp?id=<%=pid1%>"	class="btn btn-secondary" role="button">상품상세명세&raquo;</a>
					</div>
				</div>
			</div>
		
			<div class="mySlides">
		  	<div class="numbertext">3 / 6</div>
			  <div class="row">
			    <div class="col-sm-8" align="left" style="background-color:lavender;">
						<img src="./resources/images/<%=pic2%>" style="width:80%" alt="<%=pname2%>">
					</div>
			    <div class="col-sm-4" style="background-color:lavenderblush;">
			    	<h4><%=pname2%></h4>
			    	<p><%=pdesc2%></p>
			    	<p><%=pcost2%>원</p>
			    	<p><%=pid2%></p>
					  <p><a href="./product.jsp?id=<%=pid2%>"	class="btn btn-secondary" role="button">상품상세명세&raquo;</a>
					</div>
				</div>
			</div>
		  
			<div class="mySlides">
		  	<div class="numbertext">4 / 6</div>
			  <div class="row">
			    <div class="col-sm-8" align="left" style="background-color:lavender;">
						<img src="./resources/images/<%=pic3%>" style="width:80%" alt="<%=pname3%>">
					</div>
			    <div class="col-sm-4" style="background-color:lavenderblush;">
			    	<h4><%=pname3%></h4>
			    	<p><%=pdesc3%></p>
			    	<p><%=pcost3%>원</p>
			    	<p><%=pid3%></p>
					  <p><a href="./product.jsp?id=<%=pid3%>"	class="btn btn-secondary" role="button">상품상세명세&raquo;</a>
					</div>
				</div>
			</div>
		
			<div class="mySlides">
		  	<div class="numbertext">5 / 6</div>
			  <div class="row">
			    <div class="col-sm-8" align="left" style="background-color:lavender;">
						<img src="./resources/images/<%=pic4%>" style="width:80%" alt="<%=pname4%>">
					</div>
			    <div class="col-sm-4" style="background-color:lavenderblush;">
			    	<h4><%=pname4%></h4>
			    	<p><%=pdesc4%></p>
			    	<p><%=pcost4%>원</p>
			    	<p><%=pid4%></p>
					  <p><a href="./product.jsp?id=<%=pid4%>"	class="btn btn-secondary" role="button">상품상세명세&raquo;</a>
					</div>
				</div>
			</div>
		  
			<div class="mySlides">
		  	<div class="numbertext">6 / 6</div>
			  <div class="row">
			    <div class="col-sm-8" align="left" style="background-color:lavender;">
						<img src="./resources/images/<%=pic5%>" style="width:80%" alt="<%=pname5%>">
					</div>
			    <div class="col-sm-4" style="background-color:lavenderblush;">
			    	<h4><%=pname5%></h4>
			    	<p><%=pdesc5%></p>
			    	<p><%=pcost5%>원</p>
			    	<p><%=pid5%></p>
					  <p><a href="./product.jsp?id=<%=pid5%>"	class="btn btn-secondary" role="button">상품상세명세&raquo;</a>
					</div>
			  </div>
		  </div>
		</div>
  </div>
    
  <a class="prev" onclick="plusSlides(-1)">❮</a>
  <a class="next" onclick="plusSlides(1)">❯</a>
 
 <!--  <div class="caption-container">
    <p id="caption"></p>
  </div>
 -->
	<div class="container">
		<div class="row">
			<div class="row" align="center">
			
				<ul class="pagination pagination-sm">
			    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
			    <li><a href="<c:url value="./slideshow.jsp?pageNum=${pageNum}"/>"></a></li>
			    
					<li class="page-item">
						<img class="demo cursor" src="./resources/images/<%=pic0%>" style="width:100%" onclick="currentSlide(1)">
					</li>
					<li class="page-item">
						<img class="demo cursor" src="./resources/images/<%=pic1%>" style="width:100%" onclick="currentSlide(2)">
					</li>
					<li class="page-item">
						<img class="demo cursor" src="./resources/images/<%=pic2%>" style="width:100%" onclick="currentSlide(3)">
					</li>
					<li class="page-item">
						<img class="demo cursor" src="./resources/images/<%=pic3%>" style="width:100%" onclick="currentSlide(4)">
					</li>
					<li class="page-item">
						<img class="demo cursor" src="./resources/images/<%=pic4%>" style="width:100%" onclick="currentSlide(5)">
					</li>
					<li class="page-item">
						<img class="demo cursor" src="./resources/images/<%=pic5%>" style="width:100%" onclick="currentSlide(6)">
					</li>
			    
			     <li class="page-item"><a class="page-link" href="#">Next</a></li>
		    </ul>
			
			</div>
			<hr>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>
    
</body>
</html>
