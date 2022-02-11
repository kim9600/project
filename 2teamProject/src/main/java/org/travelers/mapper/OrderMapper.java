package org.travelers.mapper;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.travelers.domain.OrderVO;
import org.travelers.domain.UserVO;
import org.apache.ibatis.annotations.Param;
import org.travelers.domain.GoodsVO;
@Mapper
public interface OrderMapper {
	
	
	
	 public void insert(OrderVO vo);
	 
	  public List<OrderVO> orderlist(String user_id);
	  
	 public OrderVO read(String order_id);
	 
	 public void search(UserVO vo, HttpSession session);
	
		/*
		 * public void userRead(String user_id); public void goodsRead(String gcode);
		 */
	public void updateImages(String user_id);
	public  void updateFlag(@Param("gcode") String gcode, @Param("user_id")String user_id);
}
