<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<%@ page import="java.util.*" %>
<%@include file="dbconn.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	
	int pageNum = 0;
	int slideNum = 0;
	String id = request.getParameter("id");
	if(request.getParameter("pageNum") != null)
		pageNum = Integer.parseInt(request.getParameter("pageNum"));

	ProductDAO dao = ProductDAO.getInstance();
	List<Product> pList = new ArrayList<Product>();
	if(id.trim().length()<5){
		slideNum = Integer.parseInt(id);
		pList = dao.getProductList(pageNum);
	}else{
		pageNum = dao.getProductPage(id);
		pList = dao.getProductList(pageNum);
	}
	int total_record = dao.getProductCount();
	int total_page = dao.getProductPageCount();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품상세명세</title>
</head>

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

	<jsp:include page="menu2.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-5">상품상세명세</h1>
		</div>
	</div>

<%
 		int j = 0;
 		Product[] pd = new Product[10];
		for(int i=0;i<pList.size();i++){
			pd[i] = pList.get(i);
			j = i;
		}
		
		//System.out.println("j:"+j);
		//pd.length-j:
/* 		for(int i=j+1;i<10;i++){
				pd[i].setFilename("");
				pd[i].setPname("");
				pd[i].setDescription("");
				pd[i].setProductId("");
				pd[i].setManufacturer("");
				pd[i].setCategory("");
				pd[i].setUnitPrice(0);
				pd[i].setUnitsInStock(0);
		} */
		for(int i=0;i<=j;i++){
			if(id.equals(pd[i].getProductId())){
				switch (i) {
	  			case 0:	slideNum = 1;	break;
					case 1:	slideNum = 2;	break;
					case 2:	slideNum = 3;	break;
					case 3:	slideNum = 4;	break;
					case 4:	slideNum = 5;	break;
					case 5:	slideNum = 6;	break;
					case 6:	slideNum = 7; break;
					case 7:	slideNum = 8;	break;
					case 8:	slideNum = 9;	break;
					case 9:	slideNum = 10; break;
					default: slideNum = 1;
				}
			}
		}
%>

  <!-- <h3 style="text-align:center">(Pet Gallery)</h3> -->

  <div class="row">
		<div class="container">

		<div class="text-right">
			<span class="badge badge-success">전체<%=total_record%>건</span>
		</div>

   <% for(int i=0;i<=j;i++){
   			if(i==j+1) break;
   %>
		  <div class="mySlides">
				<div class="numbertext"><%=i%> / 10</div>
				<div class="row">
					<div class="col-md-6">
						<img src="./resources/images/<%=pd[i].getFilename()%>" style="width: 100%" alt="Image"/>
					</div>
					<div class="col-md-6">
			    	<h3><%=pd[i].getPname()%></h3>
			    	<p><%=pd[i].getDescription()%></p>
						<p><b>상품코드: </b><span class="badge badge-danger"><%=pd[i].getProductId()%></span>
						<p><b>제조사: </b><%=pd[i].getManufacturer()%>
						<p><b>분류: </b><%=pd[i].getCategory()%>
						<p><b>재고수: </b><%=new DecimalFormat("#,###").format(pd[i].getUnitsInStock())%>
						<h4><%=new DecimalFormat("#,###").format(pd[i].getUnitPrice())%>원</h4>
						<p><form name="addForm<%=i%>" id="<%="addForm"+i%>" action="./addCart.jsp?id=<%=pd[i].getProductId()%>" method="post">
						  <input type="hidden" name="id" value='<%=pd[i].getProductId() %>'>
							<a href="#" class="btn btn-info" onclick="addToCart('<%=i%>')">상품주문&raquo;</a>
							<a href="./cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
					 	  <a href="./products.jsp" class="btn btn-success">상품목록&raquo;</a>				
						</form>
					</div>
				</div>
			</div>
	 <%} %>

		  <a class="prev" onclick="plusSlides(-1)">❮</a>
		  <a class="next" onclick="plusSlides(1)">❯</a>
		 
		  <div class="caption-container">
		    <p id="caption"></p>
		  </div>

		</div>
  </div>

	<div class="container">
		<div class="row">
			<c:set var="pageNum" value='<%=pageNum%>'/>
			<c:set var="total_page" value='<%=total_page%>'/>
			<div class="row" align="center">
			
				<ul class="pagination pagination-lg">
					<c:if test="${pageNum<=1}">
			  	  <li class="page-item disabled"><a href="#">Previous</a></li>
					</c:if>
					<c:if test="${pageNum>1}">
				    <li class="page-item enabled">
					    <a href="./productSlide.jsp?id=10&pageNum=<%=pageNum-1%>" class="page-link btn btn-secondary">Previous</a></li>
					</c:if>
			    <%
			    	for(int i=0;i<j+1;i++){
			    		if(!pd[i].getFilename().equals("")){
			   	%>
			    <li class="page-item">
						<img class="demo cursor" src="./resources/images/<%=pd[i].getFilename()%>" style="width:100px" onclick="currentSlide(<%=i%>+1)" alt="<%=pd[i].getPname()%>">
					</li>
			    <%	}else{%>
			    
			    <li class="page-item">
						<img class="demo cursor" src="https://placehold.it/150x90?text=IMAGE" style="width:100px" onclick="" alt="Image">
					</li>
			   	<%	}
			    	}
			    %>
					<c:if test="${pageNum<total_page}">
				    <li class="page-item enabled">
					    <a href="./productSlide.jsp?id=1&pageNum=<%=pageNum+1%>" class="page-link btn btn-secondary">Next</a></li>
					</c:if>
					<c:if test="${pageNum>=total_page}">
			  	  <li class="page-item disabled"><a href="#">Next</a></li>
					</c:if>
		    </ul>
			
			</div>
			<hr>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>

<script>
var slideIndex = <%=slideNum%>;
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

<script>
/* javascript 함수 선언 function 함수명(아규먼트){실행문;} */
function addToCart(seq){
	
	
	var value = document.getElementById("addForm"+seq).id.value;
   
	if(confirm(value+"상품을 장바구니에 추가하시겠습니까>")){
		location.href='./addCart.jsp?id='+value;
	}
}
</script>
    
</body>
</html>
