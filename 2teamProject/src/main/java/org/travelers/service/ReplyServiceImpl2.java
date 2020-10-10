package org.travelers.service;


import org.springframework.stereotype.Service;
import org.travelers.domain.Criteria;
import org.travelers.domain.ReplyPageDTO;
import org.travelers.domain.ReplyPageDTO2;
import org.travelers.domain.ReplyVO2;
import org.travelers.mapper.ReplyMapper2;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl2 implements ReplyService2 {

	private ReplyMapper2 mapper;

	@Override
	public int insert(ReplyVO2 vo2) {
		log.info("register..."+vo2);
		return mapper.insert(vo2);
	}

	@Override
	public ReplyVO2 read(Long rno) {
		log.info("read..."+rno);
		return mapper.read(rno);
	}

	@Override
	public int delete(Long rno) {
		log.info("delete..."+rno);
		return mapper.delete(rno);
	}

	@Override
	public int update(ReplyVO2 vo2) {
		log.info("update..."+vo2);
		return mapper.update(vo2);
	}
	
	@Override
	public ReplyPageDTO2 getListWithPaging(Criteria cri, Long nno) {
		log.info("getListWithPaging..."+nno);
		return new ReplyPageDTO2(mapper.getCountByNno(nno),mapper.getListWithPaging(cri, nno));
	}

	/*
	@Override
	public List<ReplyVO> getListWithPaging(Criteria cri, Long rno) {
		log.info("getListWithPaging..."+rno);
		return mapper.getListWithPaging(cri, rno);
	}
	*/
}