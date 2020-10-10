package org.travelers.service;

import java.util.List;

import org.travelers.domain.Criteria;
import org.travelers.domain.GoodsVO;
import org.travelers.domain.OrderVO;


public interface GoodsService {
	//여행상품 입력
	public void register(GoodsVO vo);

	//여행상품 조회
	public GoodsVO get(String gcode);

	//여행상품 수정
	public boolean modify(GoodsVO vo);

	//여행상품 삭제
	public boolean remove(String gname);

	//여행상품 목록 조회
	public List<GoodsVO> getList();
	
	public List<GoodsVO> getListWithPaging(Criteria cri);

	//여행상품 그림 조회   09.26 수정
	public GoodsVO getdisp(String gcode);
	
	//여행상품 전체 건수 조회
	public int getTotal(Criteria cri);
	
	//선택인원 수정
	public int updateConfirmQty(OrderVO vo);

	
	
}
