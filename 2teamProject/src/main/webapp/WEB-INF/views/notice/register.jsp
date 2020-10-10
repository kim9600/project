<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/css.jsp" %>
<%@ include file="../includes/header.jsp"%>
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
				<div id="title" style="padding: 8px; height: auto; pa">
					<div id="location"><a href="/">Home</a>&nbsp;&gt;&nbsp;고객센터&nbsp;&gt;&nbsp;<strong>공지사항</strong></div>
					<h3 class="cont_tit">게시글 등록</h3>
				</div>
				<!-- /title -->
				<!-- contGen -->
<div class="content" style="margin-left: 5px;">
  <div class="row" style="width: 830px; height: 646px;">
	       <div class="col-lg-12" style="width: auto; height: auto;padding: 5px;">
				<form name="writeform" id="writeform" action="/notice/register" method="post" enctype="multipart/form-data">
			        <table width="800px;" border="0" cellpadding="0" cellspacing="0" class="table_l" style="margin-left: 20px;">
                         <colgroup>
      	                     <col width="12%">
                             <col width="88%">
                         </colgroup>
		              <tbody>
			             <tr>
				            <th>제목</th>
				               <td>
				                <input type="text" size="60" name="title" value="[공지]" style="height: 30px; font-color: red;">
								</td>
			             </tr>

						<tr>
  				           <th>작성자</th>
				              <td><input type="text" title="작성자" name="writer" value='<c:out value="${userName.name}"/>' style="height: 30px;"></td>
			           </tr>

			            <tr>
				           <td colspan="2" style="width: 730px; height: 350px;">
					        <textarea style="width: 800px; height: 350px;  resize:none; font-size: 14px;" name="content" id="MCONT"></textarea>
						 </td>
			          </tr>
			          
		            <!--  <tr>
				        <th>첨부파일</th>
				           <td><input type="file" name="T_UserFile1" class="file_bd" onkeydown="this.blur();" style="height: auto;"></td>
			        </tr>
			        
					<tr>
				       <th>첨부파일</th>
				         <td><input type="file" name="T_UserFile2" class="file_bd" onkeydown="this.blur();" style="height: auto;"></td>
			        </tr> -->
			</tbody>
	</table>
	<br>
	          <button type="submit" class="genric-btn success circle" style="float:right;">등록</button>
 </form>
	<!-- //글쓰기 폼 -->
<!-- //글쓰기 -->
                  </div>
			</div>
        </div>
      </div>
  </div>
</div>
<%@ include file="../includes/footer.jsp"%>