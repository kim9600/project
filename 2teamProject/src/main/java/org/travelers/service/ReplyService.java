package org.travelers.service;


import org.travelers.domain.Criteria;
import org.travelers.domain.ReplyPageDTO;
import org.travelers.domain.ReplyVO;

public interface ReplyService {

	//댓글 입력메소드
	int insert(ReplyVO vo);

	//특정 게시글에 대한 댓글 조회
	ReplyVO read(Long rno);

	//댓글 삭제
	int delete(Long rno);

	//댓글 수정
	int update(ReplyVO vo);

	//게시글의 댓글 리스트 조회
		//List<ReplyVO> getListWithPaging(Criteria cri, Long bno);
	ReplyPageDTO getListWithPaging(Criteria cri, Long qno);

}