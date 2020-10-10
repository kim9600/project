package org.travelers.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.travelers.domain.UserVO;
import org.travelers.service.GoodsService;
import org.travelers.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/userlogin/*")//클래스 레벨 어노테이션
public class LoginController{
	
	private UserService userService;
	//HandlerMapping
	@GetMapping(value="/login")
	public String loginView(HttpServletRequest request) {//Model.addAttribute("user", vo)
		System.out.println("로그인 화면으로 이동....");
		UserVO vo = new UserVO();
	   
		//vo.setId("kim");
		//vo.setPassword("kim1234");
		//vo.setName("홍길동");
		//vo.setRole("admin");
	   
		HttpSession session = request.getSession();
		//Model.addAttribute("user", vo);
		//request.setAttribute("user", vo);
		//session.setAttribute("user", vo);
	 
		return "/userlogin/login";
	}
	// id,password값이 설정된 UserVO가 넘어옴
	@PostMapping(value="/login")
	public String login(UserVO vo, /* UserDAO userDAO, */ HttpSession session,RedirectAttributes rttr) {
		System.out.println("아이디:"+vo.getId());
		System.out.println("패스워드:"+vo.getPassword());
		
		//String id=request.getParameter("id"); String
		//pwd=request.getParamenter("password");
		   
		if(vo.getId()==null || vo.getId().equals("")) {
			session.setAttribute("userName", null);
			rttr.addFlashAttribute("msg",false);
			return "redirect:/userlogin/login";	
		}
		
		//UserVO user = userDAO.getUser(vo);
		UserVO user = userService.getUser(vo);
		log.info(user);

		if(user!=null) {
			 session.setAttribute("userName", user);  

			session.setAttribute("userId", user.getId());
			session.setAttribute("userName2", user.getName()); //세션을통해 유저의정보 저장
			session.setAttribute("userPhone", user.getPhone());
			session.setAttribute("userEmail", user.getEmail());
			session.setAttribute("userBirth", user.getBirth());
			
			session.setAttribute("userRole",user.getRole());
			
			System.out.println("userName:"+ user.getName()+"userRole:"+user.getRole());
			session.setMaxInactiveInterval(60*30); //세션유지시간 30분
			//return "getBoardList.do";
			return "redirect:/";
		}else {
			session.setAttribute("userName", null);
			rttr.addFlashAttribute("msg",false);
			return "redirect:/userlogin/login";
		}
		//return "redirect:/";
	}
}
