package org.travelers.service;

import java.util.List;

import org.travelers.domain.Criteria;
import org.travelers.domain.QnaVO;

public interface QnaService {
	//글 입력
	public void register(QnaVO vo);
	
	//글 조회
	public QnaVO get(Long qno);
	
	//글 수정
	public boolean modify(QnaVO vo);
	
	//글 삭제
	public boolean remove(Long qno);
	
	//글 목록 조회
	public List<QnaVO> getList();

	public List<QnaVO> getListWithPaging(Criteria cri);
	
	//글 전체 건수 조회
	public int getTotal(Criteria cri);
	
}
