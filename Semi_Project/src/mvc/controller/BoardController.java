package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int LISTCOUNT = 5;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* url로부터 요청 정보 얻기 */
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		/* 문자셋 설정 */
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html><body>"+request.getRequestURL()+"<br>"+requestURI+"<br>"+contextPath+"<br>"+command+"</body></html>");
		
		/* 요청 command에 따른 분기작업 */
		RequestDispatcher rd = null;
		if(command.equals("/BoardListAction.do")) {
			//db에서 조회한 글 리스트를 request에 저장
			requestBoardList(request);
			rd = request.getRequestDispatcher("./board/list.jsp");			
		}else if(command.equals("/BoardWriteFormAction.do")) {
			rd = request.getRequestDispatcher("./board/writeForm.jsp");			
		}else if(command.equals("/BoardWriteAction.do")) {
			//form에 넘어온 새 글 db에 저장
			//db에 저장된 리스트를 조회한 후 reqeust에 저장
			 rd = /* request.getRequestDispatcher("./board/list.jsp"); */
					 request.getRequestDispatcher("/BoardListAction.do");			
		}
		rd.forward(request, response);
	}
	
	//등록된 글 목록 가져오기-한 페이지당 5개의 글 출력
	private void requestBoardList(HttpServletRequest request) {
		//DB와 접속하여 데이타를 가져오는 객체
		BoardDAO dao = BoardDAO.getInstance();
		//DB로부터 가져온 게시글 정보를 담을 리스트 생성
		List<BoardDTO> boardList = new ArrayList<>();
		//출력할 게시글 리스트의 초기화 작업
		int pageNum=1;//최초 페이지는 1PAGE로 설정
		int limit=LISTCOUNT;//한 페이지당 출력 갯수 설정
		//페이지리스트에서 해당 페이지를 클릭했을 때 해당 페이지가 넘어옴
		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		
		//검색 조건을 받는 변수 선언
		String items=request.getParameter("items");
		//검색 내용을 받는 변수 선언
		String text=request.getParameter("text");
		
		//조회된 전체 글의 수
		int total_record=dao.getListCount(items, text);
		
		//검색내용과 페이지번호, 페이지당 글갯수(5), 검색조건
		boardList = dao.getBoardList(pageNum, limit, items, text);
		
		//조회된 전체 글 페이지수
		int total_page;
		
		//전체 글 건수 % 페이지당 글 갯수 나머지
		if(total_record%limit==0) {//나머지가 없는 경우
			total_page = total_record/limit;//정수/정수=정수		
		}else {//나머지가 있는 경우
			total_page = total_record/limit;//정수/정수=정수			
			total_page = total_page+1;//자투리가 있는 경우 한페이지 추가
		}
		//결과를 view에 전달하기 위해 request에 저장
		request.setAttribute("pageNum", pageNum);//페이지 번호
		request.setAttribute("total_page", total_page);//전체 페이지 수
		request.setAttribute("total_record", total_record);//전체 건수
		request.setAttribute("boardList", boardList);//해당페이지에 출력할 글 목록
		//검색 조건 추가에 따른 조건,검색 내용 추가 전달
		request.setAttribute("items", items);
		request.setAttribute("text", text);
		
	}
}
