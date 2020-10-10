package org.travelers.service;

import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;


import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.travelers.domain.Criteria;
import org.travelers.domain.MailVO;
import org.travelers.domain.UserVO;
import org.travelers.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{
	
	private UserMapper mapper;
	private JavaMailSenderImpl mailSender;

	@Override
	public UserVO getUser(UserVO vo) {
		log.info("getUser....");
		return mapper.readUser(vo);
		
	}

	@Override
	public void registerUser(UserVO vo) {
		log.info("registerUser...."+vo);
		mapper.insertUser(vo);
		
	}

	@Override
	public Map<String, String> getRoles() {
		
		return mapper.getRoles();
	}

	@Override
	public boolean modifyUser(UserVO vo) {
		log.info("modifyUser...."+vo);
		return mapper.updateUser(vo)==1;
		
	}

	@Override
	public boolean removeUser(String id) {
		
		return mapper.deleteUser(id)==1;
		
	}

	@Override
	public List<UserVO> getUserList() {
		log.info("getUserList....");
		return mapper.getUserList();
	}
	
	@Override 
	public List<UserVO> getUserListWithPaging(Criteria cri) {
	  log.info("getUserListWithPaging....");
	  return mapper.getUserListWithPaging(cri); 
	  
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count...");
		return mapper.getTotalCount(cri);
	}

	@Override
	public UserVO loginUser(UserVO vo) {
		log.info("loginUser...");
		return mapper.loginUser(vo);
	}

	@Override
	public boolean modifyRole(UserVO vo) {
		log.info("modifyRole...");
		return mapper.modifyRole(vo)==1;
	}

	@Override
	public UserVO getUserNoPass(UserVO vo) {
		log.info("getUserNoPass...");
		return mapper.getUserNoPass(vo);
	}
	 
	@Override
	public int chkId(UserVO vo) {	
		
		return mapper.chkId(vo);
	}

	@Override
	public UserVO findId(UserVO vo) {
		
		return mapper.findId(vo);
	}

	@Override
	public String findPw(UserVO vo) {
		
		return mapper.findPw(vo);
	}

	@Override
	public void updatePw(UserVO vo) {
		mapper.updatePw(vo);
		
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
	public UserVO myInfoNoPass(UserVO vo) {
		log.info("myInfo....");
		return mapper.myInfoNoPass(vo);
	}

}
