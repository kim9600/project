package org.travelers.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.travelers.domain.NoticeVO;

import org.travelers.domain.Criteria;

@Mapper
public interface NoticeMapper {
	
	//@Select("select * from tbl_Notice where nno > 0")
	public List<NoticeVO> getList();
	
	//입력
	public void insert(NoticeVO vo);
	
	//sequence키를 이용한 입력
	public void insertSelectKey(NoticeVO vo);
	
	//글내용보기
	public NoticeVO read(Long nno);
	
	//삭제처리
	public int delete(Long nno);
	
	//수정처리
	public int update(NoticeVO vo);

	//리스트
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	//전체 조회 건수
	public int getTotalCount(Criteria cri);
}
