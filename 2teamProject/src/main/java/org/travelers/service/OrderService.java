package org.travelers.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.travelers.domain.GoodsVO;
import org.travelers.domain.MailVO;
import org.travelers.domain.OrderVO;
import org.travelers.domain.UserVO;

public interface OrderService {
	
	
	 public void add(OrderVO vo);  //주문정보 저장
	 
	 public List<OrderVO> orderlist(String user_id); //유저아이디로 주문한 주문내역조회
	 
	 public OrderVO get(String order_id); //주문번호로 주문내역조회
	 
	 public void search(UserVO vo, HttpSession session);
	 
	 public String sendMail(MailVO vo);  //메일전송
		/*
		 * public UserVO userRead(String user_id); public GoodsVO goodsRead (String
		 * gcode);
		 */
	public void updateImages(String user_id);
	public void updateFlag(String gcode, String user_id);
}
