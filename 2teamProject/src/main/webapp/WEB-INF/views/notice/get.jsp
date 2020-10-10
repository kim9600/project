<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../includes/css.jsp" %>
<%@ include file="../includes/css1.jsp" %>
<script type="text/javascript" src="/resources/js/reply2.js"></script>
<input type="hidden" id='amount'  name='amount'  value='<c:out value="${cri.amount}"/>'>

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
					<h3 class="cont_tit">게시글 상세보기</h3>
				</div>
				<!-- /title -->
				<!-- contGen -->
				<div class="content" style="margin-left: 5px;">
  <div class="row" style="width: 830px; height: 646px;">
	       <div class="col-lg-12" style="width: auto; height: auto; padding: 5px;">
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
				               <td><input class="form-control" size="60" name="title" value='<c:out value="${notice.title }"/>' readonly style="height: 30px;"></td>
			             </tr>

						<tr>
  				           <th>작성자</th>
				              <td><input type="text" name="writer" value='<c:out value="${notice.writer }"/>' style="height: 30px;" readonly></td>
			           </tr>

			            <tr>
				           <td colspan="2" style="width: 730px; height: 350px;">
					        <textarea style="width: 800px; height: 350px;  resize:none; font-size: 14px; text-align: left;" name="content" readonly><c:out value="${notice.content }" /></textarea>
						 </td>
			          </tr>
			          
	         </tbody>
         </table>
         <br>
         <c:if test="${userRole =='admin' && userName!=null}">
            <button data-oper='modify' class="btn btn-primary" style="float: right; width: 66px; margin-left: 5px ">수정</button>
           </c:if>
            <button data-oper='notice'   class="btn btn-default" style="float: right;">글목록</button>
        
            <!-- 이동할 폼 생성  -->
            <form id='operForm' action="/notice/modify" method="get">
               <input type="hidden" id='nno'     name='nno'     value='<c:out value="${notice.nno}"/>'>
               <input type="hidden" id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
               <input type="hidden" id='amount'  name='amount'  value='<c:out value="${cri.amount}"/>'>
               <input type="hidden" id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>'>
               <input type="hidden" id='type'    name='type'    value='<c:out value="${cri.type}"/>'>
            </form>
    
</div>
<!-- 수정/리스트 페이지로이동 처리 스크립트  -->
<script type="text/javascript">
   $(document).ready(function() {
      var operForm = $("#operForm");
      $("button[data-oper='modify']").on("click", function(e) {
    	
         operForm.attr("action", "/notice/modify").submit();
      });

      $("button[data-oper='notice']").on("click", function(e) {
         operForm.find("#nno").remove();
         operForm.attr("action", "/notice/notice").submit();
      });
   });
</script>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">댓글 팝업창</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                               <label>답변내용</label>
                                               <input type="text" class="form-control" name='reply' style="height: auto;">
                                            </div>
                                            <div class="form-group">
                                               <label>작성자</label>
                                               <input type="text" class="form-control" name='replyer' value='<c:out value="${userName.name }"/>'  style="height: auto;">
                                            </div>
                                         <!--    <div class="form-group">
                                               <label>작성일자</label>
                                               <input type="text" class="form-control" name='replyDate' value='replyDate'>
                                            </div> -->
                                            
                                        </div>
                                        <div class="modal-footer">
                                        <c:if test="${userName!=null}">
                                            <button id='modalModBtn' type="button" class="btn btn-warning" >수정</button>
                                            <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
                                          </c:if>
                                            <button id='modalRegisterBtn' type="button" class="btn btn-default" >등록</button>
                                            <button id='modalCloseBtn' type="button" class="btn btn-primary">닫기</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->



<div class='row'>
	<div class='col-lg-12'>
		
	<div class='panel panel-default' style="width: 800px; margin-left: 30px;">
	   <div class='panel-heading'>
	     <i class="fa fa-comments fa-fw"></i>댓글
	<button id='addReplyBtn' class="btn btn-primary btn-xs pull-right">댓글달기</button>
	   </div>
	
	<div class="panel-body">
	<br>
	        <ul class="chat">
	        <li class="left clearfix" data-rno='12'>
	        <div>
	        <div class="header">
	        <strong class="primary-font"></strong>
	        <small class="pull-right text-muted"></small>
			</div>
	        </div>
	        </li>
	        </ul>
	      
	</div>
	   <div class="panel-footer"></div>
		
		</div>
		</div>

</div>

</div>
<!-- 수정/리스트 페이지로이동 처리 스크립트  -->
<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/notice/modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#nno").remove();
			operForm.attr("action", "/notice/list").submit();
		});
	});
</script>
    
<script>
$(document).ready(function () {
  
  var nnoValue = '<c:out value="${notice.nno}"/>';
  var replyUL = $(".chat");
  
    showList(1);
    
function showList(page){
	
	  console.log("show list " + page);
    
    replyService2.getList({nno:nnoValue,page: page|| 1 }, function(replyCnt, list) {
      
    console.log("replyCnt: "+ replyCnt );
    console.log("list: " + list);
    console.log(list);
    
    if(page == -1){
      pageNum = Math.ceil(replyCnt/10.0);
      showList(pageNum);
      return;
    }
      
     var str="";
     
     if(list == null || list.length == 0){
          return;
     }
     
     for (var i = 0, len = list.length || 0; i < len; i++) {
       str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
       str +="  <div><div class='header'><strong class='primary-font'>["
    	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
       str +="    <small class='pull-right text-muted'>"
           +replyService2.displayTime(list[i].replyDate)+"</small></div>";
       str +="    <p>"+list[i].reply+"</p></div></li>";
     }
     
     replyUL.html(str);
     
     showReplyPage(replyCnt);
 
   });//end function
     
 }//end showList
 
    var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){
        endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
        next = true;
      }
      
      var str = "<ul class='pagination pull-right'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
      for(var i = startNum ; i <= endNum; i++){
        
        var active = pageNum == i? "active":"";
        
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul></div>";
      
      console.log(str);
      
      replyPageFooter.html(str);
    }
     
    replyPageFooter.on("click","li a", function(e){
       e.preventDefault();
       console.log("page click");
       
       var targetPageNum = $(this).attr("href");
       
       console.log("targetPageNum: " + targetPageNum);
       
       pageNum = targetPageNum;
       
       showList(pageNum);
     });     
   
    var modal = $(".modal");
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");
    
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
    
    $("#modalCloseBtn").on("click", function(e){
    	
    	modal.modal('hide');
    });
    //댓글 등록모달 팝업 뛰우기
    $("#addReplyBtn").on("click", function(e){
      
      modal.find("input").val;
      modalInputReplyDate.closest("div").hide();
      modal.find("button[id !='modalCloseBtn']").hide();
      
      modalRegisterBtn.show();
      
      $(".modal").modal("show");
      
    });
    
  //댓글 등록 모달 팝업 창에서 댓글 입력 후 등록 버튼 누름 이벤트 처리
    modalRegisterBtn.on("click",function(e){
      //JSON 객체 생성
      var reply = {
            reply: modalInputReply.val(),
            replyer:modalInputReplyer.val(),
            nno:nnoValue
          };
      replyService2.add(reply, function(result){
        
        alert(result);
        
        modal.find("input").val("");//모달의 input태그 값 초기화
        modal.modal("hide");//모달 숨기기
        
        //showList(1);
        showList(-1);//댓글 등록후 페이지 번호를 -1로 전달하여 전체 건수 및 페이징 재처리 요청.
        
      });
      
    });
  //댓글 조회 클릭 이벤트 처리 
    $(".chat").on("click", "li", function(e){
      
      var rno = $(this).data("rno");
      
      replyService2.get(rno, function(reply){
      
        modalInputReply.val(reply.reply);
        modalInputReplyer.val(reply.replyer);
        modalInputReplyDate.val(replyService2.displayTime( reply.replyDate))
        .attr("readonly","readonly");
        modal.data("rno", reply.rno);
        
        modal.find("button[id !='modalCloseBtn']").hide();
        modalModBtn.show();
        modalRemoveBtn.show();
        
        $(".modal").modal("show");
            
      });
    });
  
    
    //댓글 수정 이벤트 처리
    modalModBtn.on("click",function(e){
        //JSON객체 생성
		var reply={rno:modal.data("rno"), reply:modalInputReply.val()};
        //update(객체,콜백함수) 2개만 매개변수로 넘김.
		replyService2.update(reply,function(result){
					alert(result);
					modal.modal("hide");//팝업창 숨기기
					showList(pageNum);//페이징 처리 후 페이지 재생성 
			});
        });
  	
		//댓글 삭제 이벤트 처리
		modalRemoveBtn.on("click",function(){
			var rno=modal.data("rno");
			//alert(rno);
			replyService2.remove(rno, function(result){
				alert(result);//얼럿창 보이기
				modal.modal("hide");//모달 숨기기
				showList(pageNum);//페이지 다시 생성
				});
			});
		
});//$().ready(function(){}) 끝.
</script>
</div>
</div>
</div>
</div>
</div>
<br><br><br><br><br><br><br><br>

<%@ include file="../includes/footer.jsp"%>