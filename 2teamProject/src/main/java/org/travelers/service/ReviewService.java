package org.travelers.service;

import java.util.List;

import org.travelers.domain.ReviewVO;
import org.travelers.domain.Criteria;

public interface ReviewService {
	//글 입력
	public void register(ReviewVO vo);
	
	//글 조회
	public ReviewVO get(Long bno);
	
	//글 수정
	public boolean modify(ReviewVO vo);
	
	//글 삭제
	public boolean remove(Long bno);
	
	//글 목록 조회
	public List<ReviewVO> getList();

	public List<ReviewVO> getListWithPaging(Criteria cri);
	
	//글 전체 건수 조회
	public int getTotal(Criteria cri);

	
}
