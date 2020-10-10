package org.travelers.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.travelers.domain.Criteria;
import org.travelers.domain.QnaVO;
import org.travelers.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaServiceImpl implements QnaService {
	
	//Spring 4.3이상에서 자동 처리(D.I)
	private QnaMapper mapper;

	//새글 등록
	@Override
	public void register(QnaVO vo) {
		log.info("register....."+vo);
		
		//Mapper메소드 호출
		mapper.insertSelectKey(vo);

	}

	//글 내용 보기
	@Override
	public QnaVO get(Long qno) {
		log.info("get....."+qno);
		
		//Mapper메소드 호출 및 값 리턴
		return mapper.read(qno);
	}

	//글 내용 수정
	@Override
	public boolean modify(QnaVO vo) {
		log.info("modify....."+vo);
		
		//Mapper메소드 호출 및 값리턴
		return mapper.update(vo)==1;
	}

	//글 삭제
	@Override
	public boolean remove(Long qno) {
		log.info("remove....."+qno);
		
		//mapper 메소드 호출 및 값 리턴
		return mapper.delete(qno)==1;
	}

	//글 목록 조회
	@Override
	public List<QnaVO> getList() {
		log.info("getList.....");
		
		//mapper메소드 호출 및 값 리턴
		return mapper.getList();
	}

	@Override
	public List<QnaVO> getListWithPaging(Criteria cri) {
		log.info("getListWithPaging...");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

}
