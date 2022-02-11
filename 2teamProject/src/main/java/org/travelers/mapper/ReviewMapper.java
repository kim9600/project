package org.travelers.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.travelers.domain.ReviewVO;
import org.travelers.domain.Criteria;
@Mapper
public interface ReviewMapper {
	
	//@Select("select * from tbl_board where bno > 0")
	List<ReviewVO> getList();
	
	//입력
	public void insert(ReviewVO vo);
	
	//sequence키를 이용한 입력
	public void insertSelectKey(ReviewVO vo);
	
	//글내용보기
	public ReviewVO read(Long bno);
	
	//삭제처리
	public int delete(Long bno);
	
	//수정처리
	public int update(ReviewVO vo);

	//리스트
	public List<ReviewVO> getListWithPaging(Criteria cri);
	
	//전체 조회 건수
	public int getTotalCount(Criteria cri);
	
	public ReviewVO getlist(String bno);

}
