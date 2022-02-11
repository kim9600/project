package org.travelers.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.travelers.domain.Criteria;
import org.travelers.domain.ReplyVO;
@Mapper
public interface ReplyMapper {

	//댓글 입력메소드
	public int insert(ReplyVO vo);

	//특정 게시글에 대한 댓글 조회
	public ReplyVO read(Long rno);

	//댓글 삭제
	public int delete(Long rno);

	//댓글 수정
	public int update(ReplyVO vo);

	//게시글의 댓글 리스트 조회
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("qno")Long qno);
	
	//public ReplyPageDTO getListWithPaging(@Param("cri") Criteria cri, @Param("bno")Long bno);
	
	//댓글 건수 조회
	public int getCountByQno(Long qno);

}
