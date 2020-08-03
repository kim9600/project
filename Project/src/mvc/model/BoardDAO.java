package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mvc.database.DBConnection;

/* data access object */
public class BoardDAO {
	//자신타입의 필드선언
	private static BoardDAO instance;
	//default생성자 캡슐화
	private BoardDAO() {}
	//자신타입의인스턴스 제공 메소드
	public static BoardDAO getInstance(){
		if(instance==null) instance=new BoardDAO();
		return instance;
	}
	//조회된 board테이블의 레코드(row)건수
	public int getListCount(String items, String text) {
		//DB 접속객체 생성
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		//조회건수 저장 변수 선언
		int x=0;
		String sql;
		//매개변수로 넘어온 검색조건과 검색내용을 분석하여 쿼리 작성
		if(items==null || text.trim().length()==0)//검색조건이 없을 때
			sql="select count(*) from board";
		else//검색조건이 있을 때
			sql="select count(*) from board where "+items+" like '%"+text+"%'";
			System.out.println("sql:"+sql);
		
		try {
			//DB연결하기
			con=DBConnection.getInstance().getConnection();
			//쿼리실행
			pstmt=con.prepareStatement(sql);
			//결과받기
			rs=pstmt.executeQuery();
			//결과처리
			if(rs.next()) x=rs.getInt(1);
		} catch (Exception e) {
			System.out.println("getListCount()에러:"+e);
		} finally {//
			try {//자원해제 처리
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return x;//조회 건수 리턴
	}
	//조회 목록 리턴 메소드
	public List<BoardDTO> getBoardList(int pageNum, int limit, String items, String text) {
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//글 전체 건수 가져오기
		int total_record=getListCount(items, text);
		//시작페이지의 글 번호
		int start=(pageNum-1)*limit;//파라미터로 넘어온 페이지와 페이지당 건수를 곱하여 시작글 번호 지정
		//
		int index=start+1;
		
		//조건에 따른 쿼리문 생성
		String sql="";
		//검색 내용이 없을 때
		if(items==null || text.trim().length()==0)
			sql="select * from board";
		//검색 조건이 있을 때
		else
			sql="select * from board where "+items+" like '%"+text+"%' order by num desc";
		//view로 보낼 게시글 리스트 객체 생성
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			//db연결맺기
			con=DBConnection.getInstance().getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.absolute(index)) {//한행씩 전진
				BoardDTO board=new BoardDTO();
				//board빈에 결과 값 설정
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				
				//리스트에 추가
				list.add(board);
				
				//한 페이지 글 제한 갯수(5)이내면 증가
				if(index<(start+limit) && index<=total_record)
					index++;
				else//한페이지를 채우면 종료
					break;
			 } 					
		}catch (Exception e) {
			System.out.println("getListCount()에러:"+e);
		} finally {//
			try {//자원해제 처리
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return list;//조회된 게시글 리스트 리턴
	}		
}