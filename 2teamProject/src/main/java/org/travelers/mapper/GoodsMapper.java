package org.travelers.mapper;

import java.util.List;

import org.travelers.domain.Criteria;
import org.travelers.domain.GoodsVO;
import org.travelers.domain.OrderVO;



public interface GoodsMapper {
	
	public List<GoodsVO> getList();
	
	//입력
	public void insert(GoodsVO vo);
	
	//sequence키를 이용한 입력  09.26수정
	public void insertSelectKey(GoodsVO vo);
	
	
	//내용보기
	public GoodsVO read(String gcode);
	
	//삭제처리
	public int delete(String gname);
	
	//수정처리
	public int update(GoodsVO vo);

	//리스트
	public List<GoodsVO> getListWithPaging(Criteria cri);
	
	//전체 조회 건수
	public int getTotalCount(Criteria cri);
	
	//조회수 증가
	public void updateGoodsCnt(String gcode);

	//여행상품 그림 조회
	public GoodsVO getDisp(String gcode);
	
	//선택인원 수정
	public int updateConfirmQty(OrderVO vo);
}
