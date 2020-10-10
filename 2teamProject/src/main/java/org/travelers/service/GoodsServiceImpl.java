package org.travelers.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.travelers.domain.Criteria;
import org.travelers.domain.GoodsVO;
import org.travelers.domain.OrderVO;
import org.travelers.mapper.GoodsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class GoodsServiceImpl implements GoodsService {

	private GoodsMapper mapper;
	
	@Override
	public void register(GoodsVO vo) {
		log.info("register....."+vo);
		/*mapper.insertSelectKey(vo);*/
		mapper.insert(vo);
	}

	@Override
	public GoodsVO get(String gcode) {
		return mapper.read(gcode);
	}
	
	//09.26수정
	@Override
	public GoodsVO getdisp(String gcode) {
		mapper.updateGoodsCnt(gcode);
		return mapper.read(gcode);
	}

	@Override
	public boolean modify(GoodsVO vo) {
		log.info("modify....."+vo);
		return mapper.update(vo)==1;
	}

	@Override
	public boolean remove(String gname) {
		return mapper.delete(gname)==1;
	}

	@Override
	public List<GoodsVO> getList() {
		return mapper.getList();
	}

	@Override
	public List<GoodsVO> getListWithPaging(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public int updateConfirmQty(OrderVO vo) {
		return mapper.updateConfirmQty(vo);
		
	}

	
	
	
	

}
