package org.travelers.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.travelers.domain.Criteria;
import org.travelers.domain.QnaVO;

public interface QnaMapper {
	
	//@Select("select * from tbl_board where qno > 0")
	public List<QnaVO> getList();
	
	//입력
	public void insert(QnaVO vo);
	
	//sequence키를 이용한 입력
	public void insertSelectKey(QnaVO vo);
	
	//글내용보기
	public QnaVO read(Long qno);
	
	//삭제처리
	public int delete(Long qno);
	
	//수정처리
	public int update(QnaVO vo);

	//리스트
	public List<QnaVO> getListWithPaging(Criteria cri);
	
	//전체 조회 건수
	public int getTotalCount(Criteria cri);
}
