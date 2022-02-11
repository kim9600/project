package org.travelers.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.travelers.domain.GoodsVO;
import org.travelers.domain.MailVO;
import org.travelers.domain.OrderVO;
import org.travelers.domain.UserVO;
import org.travelers.mapper.OrderMapper;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService{
	private UserService userService;
	private HttpSession session;
	private OrderMapper mapper;
	private JavaMailSenderImpl mailSender;

	@Override
	public void add(OrderVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public List<OrderVO> orderlist(String user_id) {
		
		return mapper.orderlist(user_id);
	}

	@Override
	public OrderVO get(String order_id) {
		return mapper.read(order_id);
	}

	@Override
	public void search(UserVO vo, HttpSession session) {
		UserVO user =userService.getUser(vo);
		log.info(user);
		
		
	}

	@Override
	public String sendMail(MailVO vo) {	
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
		@Override
		public void prepare(MimeMessage mimeMessage) throws Exception {
			final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
			helper.setFrom(vo.getFrom());
			helper.setTo(vo.getTo());
			helper.setSubject(vo.getSubject());
			helper.setText(vo.getContents(), true);
			
			
		
			

			
		}
	};	
		mailSender.send(preparator);
		return "result";
	}

	@Override
	public void updateImages(String user_id) {
		mapper.updateImages(user_id);
		
	}

	@Override
	public void updateFlag(String gcode, String user_id) {
		mapper.updateFlag(gcode, user_id);
		
	}	
	/*
	 * public UserVO userRead(String user_id) {
	 * 
	 * mapper.userRead(user_id); }
	 * 
	 * 
	 * public GoodsVO goodsRead(String gcode) {
	 * 
	 * mapper.goodsRead(gcode); }
	 */
	
	
	

}
