package org.travelers.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.travelers.domain.ReviewVO;
import org.travelers.domain.Criteria;
import org.travelers.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	
	//Spring 4.3이상에서 자동 처리(D.I)
	private ReviewMapper mapper;

	//새글 등록
	@Override
	public void register(ReviewVO vo) {
		log.info("register....."+vo);
		
		//Mapper메소드 호출
		mapper.insertSelectKey(vo);

	}

	//글 내용 보기
	@Override
	public ReviewVO get(Long bno) {
		log.info("get....."+bno);
		
		//Mapper메소드 호출 및 값 리턴
		return mapper.read(bno);
	}

	//글 내용 수정
	@Override
	public boolean modify(ReviewVO vo) {
		log.info("modify....."+vo);
		
		//Mapper메소드 호출 및 값리턴
		return mapper.update(vo)==1;
	}

	//글 삭제
	@Override
	public boolean remove(Long bno) {
		log.info("remove....."+bno);
		
		//mapper 메소드 호출 및 값 리턴
		return mapper.delete(bno)==1;
	}

	//글 목록 조회
	@Override
	public List<ReviewVO> getList() {
		log.info("getList.....");
		
		//mapper메소드 호출 및 값 리턴
		return mapper.getList();
	}

	@Override
	public List<ReviewVO> getListWithPaging(Criteria cri) {
		log.info("getListWithPaging...");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}


}
