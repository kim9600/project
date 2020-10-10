<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/css.jsp" %>
<%@ include file="../includes/css1.jsp" %>

<!-- 본문  -->
<div id="container" style="height: 850px;">
		<div id="contBody">
			<div class="stop_category board">
	<ul>
				
		<li class="on"><a href="/notice/notice">공지사항</a></li>
				
		<li class=""><a href="/qna/qna">문의사항</a></li>
				
		<li class=""><a href="/review/list">여행후기</a></li>
				
	</ul>
</div>				<!-- lNavi_wrap -->
	<div id="lNavi_wrap">
		<!-- lNavi -->
		<div id="lNavi">
			<h2 id="lnb_tit" style="width: 185px;"><strong>고객센터</strong></h2>
			<ul class="lNavi_list">
							<li class="on"><a href="/notice/notice">공지사항</a></li>
							<li class=""><a href="/qna/qna">문의사항</a></li>
							<li class=""><a href="/review/list">여행후기</a></li>
						</ul>
		</div>
		<!-- /lNavi -->
		<!-- left_cs_center -->
		<!-- left_cs_center -->
				<div class="left_cs_center">
					<h3>고객센터</h3>
					<dl><img src="/resources/img/notice/call1.gif" style="width: 168px; height:143px; text-align: center;">
						<dt style="height: 143px; width: 168px; height: 80px;"><span style="padding: 5px; text-align: top;">여행상담 문의전화</span><strong>02-732-1505</strong></dt>
						<dd>
							<ul class="time">
								<li><strong>평일</strong><span>09:00~18:00</span></li>
								<li><strong style="padding-right: 0px;">토요일</strong><span>09:00~18:00</span></li>
								<li><strong>휴무</strong><span>일요일 및 공휴일</span></li>
							</ul>
						</dd>
					</dl>
					<dt class="btn" style="text-align: center; margin: auto; font-size: 13px;
					                                   width: 156px; height: 34px; border-right-width: 1px;
					                                    border-left-width: 1px; padding-top: 1px;">
						<li class="line"><a href="/qna/qna">문의사항</a></li>
					</dt>
				</div>
				<!-- /left_cs_center -->		
				<!-- /left_cs_center -->
	</div>
	<!-- /lNavi_wrap -->		
		<!-- contents -->
			<div id="contents">
				<!-- title -->
				<div id="title" style="padding: 8px; height: auto;">
					<div id="location"><a href="/">Home</a>&nbsp;&gt;&nbsp;고객센터&nbsp;&gt;&nbsp;<strong>공지사항</strong></div>
					<h3 class="cont_tit">게시글 수정</h3>
				</div>
				<!-- /title -->
				<!-- contGen -->
				<div class="content" style="margin-left: 5px;">
  <div class="row" style="width: 830px; height: 646px;">
  <form role="form" action="/notice/modify" method="post">
	       <div class="col-lg-12" style="width: auto; height: auto;padding: 5px;">
	              
			        <table width="800px;" border="0" cellpadding="0" cellspacing="0" class="table_l" style="margin-left: 20px;">
                         <colgroup>
      	                     <col width="12%">
                             <col width="88%">
                         </colgroup>
		              <tbody>
		                 <tr>
		                    <th>글 번호</th>
		                        <td>
		                           <input type="text"  name="nno" value= '<c:out value="${notice.nno }"/>' readonly style="height: 30px; width: 70px;"></td>
		                        </td>
		                 </tr>
			             <tr>
				            <th>제목</th>
				               <td><input class="form-control" size="60" name="title" value='<c:out value="${notice.title }"/>'  style="height: 30px;"></td>
			             </tr>

						<tr>
  				           <th>작성자</th>
				              <td><input type="text" name="writer" value='<c:out value="${notice.writer }"/>' style="height: 30px;" readonly></td>
			           </tr>

			            <tr>
				           <td colspan="2" style="width: 730px; height: 350px;">
					        <textarea style="width: 800px; height: 350px;  resize:none; font-size: 14px; text-align: left;" name="content" ><c:out value="${notice.content }" /></textarea>
						 </td>
			          </tr>
			          
			          <tr>
  				           <th>등록일자</th>
				              <td><input type="text" name="regdate" value='<fmt:formatDate value="${notice.regdate}" pattern="yyyy/MM/dd"/>' style="height: 30px;" readonly></td>
			           </tr>
			          
			          <tr>
  				           <th>수정일자</th>
				              <td><input type="text" name="updateDate" value='<fmt:formatDate value="${notice.updateDate}" pattern="yyyy/MM/dd"/>' style="height: 30px;" readonly></td>
			           </tr>
			          
	         </tbody>
         </table>
         <br>
           <!-- 수정,삭제,리스트가기 버튼  -->
            <button data-oper='submit' data-oper='modify'  class="btn btn-primary" style="float: right; width: 66px; margin-left: 5px; ">수정</button>
            <button type="submit" data-oper='remove' class="btn btn-danger" style="float: right; margin-left: 5px;">삭제</button>
            <button data-oper='submit'  data-oper='notice' class="btn btn-default" style="float: right;">글목록</button>
      </div>
   </form>
</div>
<!-- submit버튼 클릭시 처리 자바스크립트 -->
<script>
$(document).ready(function(){
	var formObj=$("form");// form객체 얻기
	
     //submit 버튼 클릭시 처리
	$('button').on('click',function(e){
			e.preventDefault();//기본동작(submit은 페이지 이동)을 중지,

			var operation=$(this).data("oper");// data-oper값 얻기
			if(operation==='remove'){
				//삭제 버튼 클릭시 처리
				formObj.attr("action","/notice/remove");

				//alert('remove');
				}else if(operation==='notice'){
				formObj.attr("action","/notice/notice").attr("method","get");
				//alert('list');
				
				//
				
				var pageNumTag=$("input[name='pageNum']").clone();//객체 복제
				var amountTag=$("input[name='amount']").clone();
				var keywordTag=$("input[name='keyword']").clone();
				/* var typeTag=$("input[name='type']").clone(); */

				formObj.empty();//초기화 

				//동적으로 생성된 form에 input tag 추가
				formObj.append(pageNumTag);  
				formObj.append(amountTag);
				formObj.append(keywordTag);
				/* formObj.append(typeTag); */
				//<form action='/qna/list' method='post'>
					//<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>		
  				   //<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>		
  				   //<input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>		
  				   //<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>		
				   //</form>
				}
             // alert('modify');
		     formObj.submit();//url로 이동처리
		});
});
</script>
</div>
</div>
</div>
</div>
</div>


<%@ include file="../includes/footer.jsp"%>