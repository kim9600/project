<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ include file="../includes/css.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="../css/all.css" rel="stylesheet" type="text/css">
<link href="../css/font/css/font-awesome.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<!-- ajax처리 레이어 -->
<div id="ajax_proc"></div>

<script type="text/javascript">
var get_today_good = function(type, size, page) {
   // 출력할 아이디 설정
   var id = 'quick_good_list';

   // 사이즈 설정
   size = (size) ? parseInt(size, 10) : 3;

   // 페이지 설정
   var total_page = -1;
   var n_page = (get_today_good.page) ? parseInt(get_today_good.page, 10) : 0;
   if (type == 'next') n_page += 1;
   else if (type == 'prev') n_page -= 1;

   // 페이지 체크
   if (type) {
      if (n_page < 0) {
         alert('첫 상품입니다.');
         return;
      }
      else if (n_page > total_page) {
         alert('더 이상 상품이 없습니다.');
         return;
      }
   }

   // 페이지 저장
   get_today_good.page = n_page;
}

$(document).ready(function(){
   // 오늘본 상품 초기화 (20091001)
   get_today_good('', '2')
});

function goTop() {
    jQuery( 'html, body' ).animate({
        scrollTop: 0
    }, 500, 'swing');
    return false;
}
</script>

<script type="text/javascript">
$(function(){
   $("#gnb span").first().addClass("start");
})
</script>

<script type="text/javascript">
$(document).ready(function() {
   $('.simple-ajax-popup-align-top').magnificPopup({
      type: 'ajax',
      alignTop: true,
      overflowY: 'hidden',
      fixedContentPos : false,
      mainClass: 'mfp-fade'
   });

   var gnb = $("#gnb").offset();
    $(window).scroll(function(){
        var docScrollY = $(document).scrollTop()
        var barThis = $("#gnb")
      //console.log(docScrollY+' / '+gnb.top);
        if( docScrollY > gnb.top ) {
            barThis.addClass("_fix");
        }else{
            barThis.removeClass("_fix");
        }
    });


   $(".item_search_btn").on("click",function(){
      if($("form#top_search_frm input[name='g_title_s']").val()=="검색어를 입력하세요.")
            $("form#top_search_frm input[name='g_title_s']").val('')
      $("form#top_search_frm").submit();
   }).css("cursor","pointer");

   //즐겨찾기
    $('#favorite').on('click', function(e) { 
      var bookmarkURL = 'http://tour39.touroffice.co.kr'; 
      var bookmarkTitle = '투어오피스'; 
      var triggerDefault = false; 
      if (window.sidebar && window.sidebar.addPanel) { 
         // Firefox version < 23 
         window.sidebar.addPanel(bookmarkTitle, bookmarkURL, ''); 
      } else if ((window.sidebar && (navigator.userAgent.toLowerCase().indexOf('firefox') > -1)) || (window.opera && window.print)) { 
         // Firefox version >= 23 and Opera Hotlist 
         var $this = $(this); 
         $this.attr('href', bookmarkURL); 
         $this.attr('title', bookmarkTitle); 
         $this.attr('rel', 'sidebar'); 
         $this.off(e); 
         triggerDefault = true; 
      } else if (window.external && ('AddFavorite' in window.external)) { 
         // IE Favorite 
         window.external.AddFavorite(bookmarkURL, bookmarkTitle); 
      } else { 
         // WebKit - Safari/Chrome 
         alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.'); 
      } 
      return triggerDefault; 
   }); 
   
});
</script>
<style>
.mfp-fade.mfp-bg { opacity:0;}
</style>



<!-- 내용 -->
<!-- container -->
   <div id="container">
<!-- lNavi_wrap -->
   <div id="lNavi_wrap">
      <!-- lNavi -->
      <div id="lNavi">
         <h2 id="lnb_tit"><strong>고객센터</strong></h2>
         <ul class="lNavi_list">
                     <li class="on"><a href="/board/notice">공지사항</a></li>
                     <li class=""><a href="/board/qna">질문과 답변</a></li>
                     <li class=""><a href="/board/review">여행후기</a></li>
                     <li class=""><a href="/board/news">뉴스</a></li>
                     <li class=""><a href="/board/gallery">갤러리</a></li>
                  </ul>
      </div>
      <!-- /lNavi -->
      <!-- left_cs_center -->
      <!-- left_cs_center -->
            <div class="left_cs_center">
               <h3>고객센터</h3>
               <dl>
                  <dt><span>여행상담 문의전화</span><strong>02-732-1505</strong></dt>
                  <dd>
                     <ul class="time">
                        <li><strong>평일</strong><span>09:00~18:00</span></li>
                        <li><strong>토요일</strong><span>09:00~18:00</span></li>
                        <li><strong>휴무</strong><span>일요일 및 공휴일</span></li>
                     </ul>
                  </dd>
               </dl>
               <ul class="btn">
                  <li class="line"><a href="../cmm/?BD_CD=QNA">질문과 답변</a></li>
                  <li><a href="../cmm/?BD_CD=FAQ">자주묻는 질문</a></li>
               </ul>
            </div>
            <!-- /left_cs_center -->      <!-- /left_cs_center -->
   </div>
   <!-- /lNavi_wrap -->         <!-- contents -->
         <div id="contents">
            <!-- title -->
            <div id="title">
               <div id="location"><a href="/">Home</a>&nbsp;&gt;&nbsp;고객센터&nbsp;&gt;&nbsp;<strong>공지사항</strong></div>
               <h3 class="cont_tit">공지사항</h3>
            </div>
            <!-- /title -->
            <!-- contGen -->

   <div class="contents_wrap">
     <!--<div class="title_wrap">
                        <h3 class="title"></h3>
     </div>-->



            <!-- 내용 -->
   <!-- 타이틀 //게시판 공통 파일은 /include/top.inc.html 에 정의 -->
   <!--<div class="title">
      <img src="" />
      <div><a href="/">홈으로</a> > 커뮤니티 > <span>공지사항</span></div>
   </div> -->
   <!-- //타이틀 -->


   <div class="container">
<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">공지사항</h1>
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">
            <button id='regBtn' type="button" class="btn btn-xs pull-right">새글 등록</button>
         </div>

         <!-- /.panel-heading -->
         <div class="panel-body">
            <table class="table table-striped table-bordered table-hover">
               <thead>
                  <tr>
                     <th>번호</th>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>작성일</th>
                     <th>수정일</th>
                  </tr>
               </thead>

               <c:forEach items="${list}" var="board">
                  <tr>
                     <td><c:out value="${board.bno}" /></td>
                     <%-- <td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td> --%>

                     <%-- 자바스크립트로 get으로 이동 --%>
                     <td><a class='move' href='<c:out value="${board.bno}"/>'><c:out value="${board.title}" /></a></td>

                     <td><c:out value="${board.writer}" /></td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
                  </tr>
               </c:forEach>
            </table>

            <div class='row'>
               <div class="col-lg-12">

                  <form id='searchForm' action="/board/list" method='get'>
                     <select name='type'>
                        <option value=""
                           <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
                        <option value="T"
                           <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
                        <option value="C"
                           <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
                        <option value="W"
                           <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
                        <option value="TC"
                           <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
                        <option value="TW"
                           <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
                        <option value="TWC"
                           <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
                     </select> 
                     
                     <input type='text'   name='keyword'   value='<c:out value="${pageMaker.cri.keyword}"/>' />
                     <input type='hidden' name='pageNum'   value='<c:out value="${pageMaker.cri.pageNum}"/>' />
                     <input type='hidden' name='amount'  value='<c:out value="${pageMaker.cri.amount}"/>' />
                     
                     <button class='btn btn-default'>Search</button>
                  </form>
               </div>
            </div>

            <div class='pull-right'>
               <ul class="pagination">

                  <%--             <c:if test="${pageMaker.prev}">
              <li class="paginate_button previous"><a href="#">Previous</a>
              </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}"
              end="${pageMaker.endPage}">
              <li class="paginate_button"><a href="#">${num}</a></li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
              <li class="paginate_button next"><a href="#">Next</a></li>
            </c:if> --%>

                  <c:if test="${pageMaker.prev}">
                     <li class="paginate_button previous">
                        <a href="${pageMaker.startPage -1}">Previous</a>
                     </li>
                  </c:if>

                  <c:forEach var="num" begin="${pageMaker.startPage}"   end="${pageMaker.endPage}">
                     <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""}">
                        <a href="${num}">${num}</a>
                     </li>
                  </c:forEach>
                  
                  <!-- 다음 페이지 표시 -->
                  <c:if test="${pageMaker.next}">
                     <li class="paginate_button next">
                        <a href="${pageMaker.endPage +1 }">Next</a>
                     </li>
                  </c:if>

               </ul>
            </div>
            <!--  end Pagination -->
         </div>

         <form id='actionForm' action="/board/list" method='get'>
            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
            <input type='hidden' name='amount'  value='${pageMaker.cri.amount}'>

            <input type='hidden' name='type'    value='<c:out value="${pageMaker.cri.type }"/>'>
           <input type='hidden' name='keyword'   value='<c:out value="${pageMaker.cri.keyword }"/>'>

         </form>

         <!-- Modal  추가 -->
         <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                  </div>
                  <div class="modal-body">처리가 완료되었습니다.</div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                     <button type="button" class="btn btn-primary">Save changes</button>
                  </div>
               </div>
               <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
         </div>
         <!-- /.modal -->

      </div>
      <!--  end panel-body -->
   </div>
   <!-- end panel -->
</div>
</div>
<!-- /.row -->
</div>

<script type="text/javascript">
$(document).ready(function() {

   var result = '<c:out value="${result}"/>';//입력,수정,삭제 결과 rttr.addFlashAttribute("result","success");

   checkModal(result);

   //html5에서 추가된 함수
   history.replaceState({}, null, null);//false

   function checkModal(result) {

      if (result === '' || history.state) {// 글목록으로 바로 진입했거나, history.back으로 이동시 모달창을 띄우지 않음.
         return;
      }

    //새글 입력후 결과값이 넘어오면 처리 
      if (parseInt(result) > 0) {
         $(".modal-body").html("게시글 " + parseInt(result)+ " 번이 등록되었습니다.");
      }

      $("#myModal").modal("show");
   }//

   $("#regBtn").on("click", function() {

      self.location = "/board/register";

   });

   var actionForm = $("#actionForm");

   $(".paginate_button a").on("click",function(e) {

      e.preventDefault();// 페이지 이동 막기

      console.log('click');

      actionForm.find("input[name='pageNum']").val($(this).attr("href"));//이동 페이지 설정
      actionForm.submit();
   });

   $(".move").on("click",function(e) {
      e.preventDefault();//<a태그 클릭시 자동으로 이동 방지 처리
      actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
      actionForm.attr("action","/board/get");
      actionForm.submit();
   });

   var searchForm = $("#searchForm");

   $("#searchForm button").on("click",   function(e) {
      if (!searchForm.find("option:selected").val()) {
         alert("검색종류를 선택하세요");
         return false;
      }

      if (!searchForm.find(   "input[name='keyword']").val()) {
         alert("키워드를 입력하세요");
         return false;
      }

      searchForm.find("input[name='pageNum']").val("1");//pageNum에 값을 1로 세팅
      e.preventDefault();

      searchForm.submit();
   });
});
</script>

      <!-- 페이징 -->
      <div class="paging mt20">
<a nohref="#" class="pre"><img src="../image/btn/btn_first.gif" alt="처음목록보기"></a>
<a nohref="#" class="pre"><img src="../image/btn/btn_prev.gif" alt="앞목록보기"></a>
<strong>1</strong>
<a nohref="#" class="next"><img src="../image/btn/btn_next.gif" alt="뒤목록보기"></a>
<a nohref="#" class="next"><img src="../image/btn/btn_last.gif" alt="마지막목록보기"></a>
</div>
   <!-- //페이징 -->
<div class="board_btn_w">
   <ul class="btn_r">
   <!-- 글쓰기 버튼 -->
      <li class="color"></li>
   </ul>
</div>

<script type="text/javascript">
// 셀렉트 박스 선택
if ('') document.searchform.scat.value = '';
if ('') {
   document.searchform.sfld.value = '';
   //document.searchform.sopr.value = 'and';
}
</script>
            </div>
            <!-- /contents_wrap -->
            </div>
            <!-- /contGen -->
         </div>
         <!-- /contents -->
      </div>
      <!-- /contBody -->
   </div>
   <!-- /container -->

<!-- //내용 -->

<script type="text/javascript">
// 이미지 자동 리사이즈 함수
// 게시물 내용안의 이미지가 클 경우 자동으로 사이즈 조절해주는 함수
// /cmm/view.php 파일안에 내용 들어가는 태그에 ID값(default:cmm_view_content) 추가 해줘야함(중요!)
function cmm_img_resize(max) {
   // passing : ie, firefox, mozilla, netscafe
   var content = document.getElementById("cmm_view_content"); // 여기서 내용 태그의 ID 값 설정
   if (content) {
      // IE8, FF3 이상은 정상적으로 적용이 안되서 강제 너비 설정 (20091109 )
      max = (max) ? max : parseInt(content.clientWidth);
      var img_height = 0;
      var img = content.getElementsByTagName("img");

      for(i=0; i<img.length; i++) {
         if (img[i].width > max) {
            var rate = parseFloat(max / img[i].width);
            img_height = parseInt(img[i].height * rate);
            img[i].width = max;
            img[i].height = img_height;

            img[i].style.width = '';
            img[i].style.height = '';
         }
         //img[i].style.border = '1px solid #000000';
      }
   }
}

// 이미지 자동 리사이즈 함수 실행
// 인수로 리사이즈 크기를 넘겨줌
//cmm_img_resize(620);
//Event.observe(window, 'load', function() { cmm_img_resize(770); });
//$(function(){cmm_img_resize(770);})
// 크롬, 파이어폭스의 경우 함수 실행이 너무 빠르면 변환이 제대로 되지 않으므로 페이지가 로드후 일정시간이 지난후에 리사이즈 함수를 호출한다.
$(function(){
      setInterval("cmm_img_resize(770);",500);
})

</script>

<!-- footer -->
   <div id="footer">
      <!-- gnb_footer -->
      <div id="gnb_footer">
         <ul>
            <li><a href="../site/greeting.html" target="_top">회사소개</a></li>
               <li><a href="../site/person.html" target="_top"><strong>개인정보취급방침</strong></a></li>
               <li><a href="../site/userule.html" target="_top">이용약관</a></li>
               <li><a href="../site/abroad_rule.html" target="_top">해외여행약관</a></li>
               <li><a href="../site/abroad_ins.html" target="_top">해외여행보험약관</a></li>
               <li class="no_bg"><a href="../site/contact.html" target="_top">제휴안내</a></li>
         </ul>
      </div>
      <!-- /gnb_footer -->
      <!-- copyright_zone -->
      <div class="copyright_zone">
         <h2><a href="#"><img src="/FileData/logo/logo_bottom.png" alt="로고"></a></h2>
         <!-- address -->
         <ul class="address">
            <li>상호 : (주)클릭커뮤니케이션&nbsp;&nbsp;|&nbsp;&nbsp;대표이사 : 권종표&nbsp;&nbsp;|&nbsp;&nbsp;사업자등록번호 : 602-81-57104&nbsp;&nbsp;|&nbsp;&nbsp;관광사업등록증 : 국외여행업&nbsp;&nbsp;|&nbsp;&nbsp;통신판매업신고 : 제 2018-000001 호</li>
            <li>사업장소재지 : 서울특별시 강남구 테헤란로 216 (역삼동 719-0) &nbsp;&nbsp;|&nbsp;&nbsp;전화 : 02-732-1505&nbsp;&nbsp;|&nbsp;&nbsp;팩스 : 02-732-1506</li>
            <li>개인정보관리책임자 : <b>투어오피스</b> 이메일 : <b><i class="xi-mail xi-fw"></i>admin@touroffice.co.kr</b></li>
            <li class="last">본 홈페이지에 게시된 이메일 주소가 자동 수집되는 것을 거부하며 이를 위반시 정보통신망법에 의해 처벌됨을 유념하시기 바랍니다.</li>
            <li>COPYRIGHT (C) <strong>(주)클릭커뮤니케이션</strong>.  ALL RIGHTS RESERVED.</li>
         </ul>
         <!-- /address -->
      </div>
      <!-- /copyright_zone -->
   </div>
   <!-- /footer -->

<!-- /wrap -->


<script type="text/javascript">
   $(function($){
      $("img.lazy").lazyload({effect : "fadeIn"});
   });
</script>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>