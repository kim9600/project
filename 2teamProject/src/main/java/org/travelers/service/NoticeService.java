package org.travelers.service;

import java.util.List;

import org.travelers.domain.NoticeVO;
import org.travelers.domain.Criteria;

public interface NoticeService {
	//글 입력
	public void register(NoticeVO vo);
	
	//글 조회
	public NoticeVO get(Long nno);
	
	//글 수정
	public boolean modify(NoticeVO vo);
	
	//글 삭제
	public boolean remove(Long nno);
	
	//글 목록 조회
	public List<NoticeVO> getList();

	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	//글 전체 건수 조회
	public int getTotal(Criteria cri);
	
}
