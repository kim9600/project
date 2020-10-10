package org.travelers.service;


/*
@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	//Spring 4.3이상에서 자동 처리(D.I)
	private BoardMapper mapper;

	//새글 등록
	@Override
	public void register(BoardVO vo) {
		log.info("register....."+vo);
		
		//Mapper메소드 호출
		mapper.insertSelectKey(vo);

	}

	//글 내용 보기
	@Override
	public BoardVO get(Long bno) {
		log.info("get....."+bno);
		
		//Mapper메소드 호출 및 값 리턴
		return mapper.read(bno);
	}

	//글 내용 수정
	@Override
	public boolean modify(BoardVO vo) {
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
	public List<BoardVO> getList() {
		log.info("getList.....");
		
		//mapper메소드 호출 및 값 리턴
		return mapper.getList();
	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		log.info("getListWithPaging...");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

}
*/