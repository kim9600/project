package org.travelers.service;


import org.travelers.domain.Criteria;
import org.travelers.domain.ReplyPageDTO2;
import org.travelers.domain.ReplyVO2;

public interface ReplyService2 {

	//댓글 입력메소드
	int insert(ReplyVO2 vo2);

	//특정 게시글에 대한 댓글 조회
	ReplyVO2 read(Long rno);

	//댓글 삭제
	int delete(Long rno);

	//댓글 수정
	int update(ReplyVO2 vo2);

	//게시글의 댓글 리스트 조회
		//List<ReplyVO> getListWithPaging(Criteria cri, Long bno);
	ReplyPageDTO2 getListWithPaging(Criteria cri, Long nno);

}