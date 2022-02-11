package org.travelers.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.travelers.domain.Criteria;
import org.travelers.domain.GoodsVO;
import org.travelers.domain.MailVO;
import org.travelers.domain.OrderVO;
import org.travelers.domain.PageDTO;
import org.travelers.domain.UserVO;
import org.travelers.service.GoodsService;
import org.travelers.service.OrderService;
import org.travelers.service.UserService;
import org.travelers.controller.LoginController;

import lombok.AllArgsConstructor;
import lombok.experimental.Helper;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/goods/*")//클래스 레벨 어노테이션
public class GoodsController {

	private GoodsService service;
	private OrderService orderService;

	@GetMapping("/register")  //rul경로:/goods/register
	public void register() {} //void타입 메소드인 경우 URI와 같은 jsp로 이동,/WEB-INF/views/register.jsp
	
	@PostMapping("/register")
	public String register(GoodsVO vo,RedirectAttributes rttr) {
		log.info("register:"+vo);
		
		//파일 업로드 처리
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			try {
				uploadFile.transferTo(new File("c:/upload/"+fileName));
			} catch (Exception e) {
                log.info(e);
			}//지정경로로 파일 저장
			vo.setImages(fileName);
		}
		
		service.register(vo);
		
		rttr.addFlashAttribute("result",vo.getGcode());
		
		return "redirect:/goods/list";
	}
	//상품목록보기
	@GetMapping("/list")
	public void list(Criteria cri, Model model, HttpSession session,UserVO vo) {
		log.info("list:"+cri);
		model.addAttribute("list",service.getListWithPaging(cri));
		
		int total = service.getTotal(cri);
		log.info("total:"+total);
		
		log.info("PageDTO:"+new PageDTO(cri,total)); 
		model.addAttribute("pageMaker",new PageDTO(cri,total));
		session.getAttribute("userId");
		session.getAttribute("userRole");
		session.getAttribute("userName");
	}
	
	//상품목록보기
	@GetMapping("/displist")
	public void displist(Criteria cri, Model model) {
		log.info("displist:"+cri);
		model.addAttribute("list",service.getListWithPaging(cri));
		
		int total = service.getTotal(cri);
		log.info("total:"+total);
		
		log.info("PageDTO:"+new PageDTO(cri,total)); 
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	//상품 상세 보기
	//GetMapping("/get") //url /goods/get
	@GetMapping({"/get","/modify"}) //url /goods/get 혹은 /goods/modify 두 url경로에 대해 호출되는 메소드
	public void get(@RequestParam("gcode") String gcode, @ModelAttribute("cri") Criteria cri, Model model,HttpSession session) {
		log.info("/get or /modify");
		model.addAttribute("amount",cri.getAmount()); 
		//model.addAttribute("goods", service.get(gcode));
		session.setAttribute("goods",service.get(gcode));
		session.setAttribute("gcode", gcode);
		model.addAttribute("cri", cri);
		
	}
	//상품 상세 보기
	@GetMapping("/getdisp") //url /goods/getdisp url경로에 대해 호출되는 메소드
	public void getdisp(@RequestParam("gcode") String gcode, @ModelAttribute("cri") Criteria cri, Model model,HttpSession session) {
		log.info("/getdisp");
		model.addAttribute("amount",cri.getAmount()); 
		//model.addAttribute("goods", service.getdisp(gcode));
		session.setAttribute("goods",service.getdisp(gcode));
		session.setAttribute("gcode", gcode);
		model.addAttribute("cri", cri); 
		//log.info(service.getdisp(gcode).getGconfirmQty());
		//service.updateConfirmQty(gcode);
	}


	//상품 수정
	@PostMapping("/modify")
	public String modify(GoodsVO vo,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("/modify");
		
		//파일 업로드 처리
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			try {
				uploadFile.transferTo(new File("c:/upload/"+fileName));
			} catch (Exception e) {
                log.info(e);
			}//지정경로로 파일 저장
			vo.setImages(fileName);
		}
		
		boolean result = service.modify(vo);
		
		//정상처리시 success, 비정상 처리시 null
		if(result) rttr.addFlashAttribute("result", "success");
		
		//원래의 페이지로 돌아가기 위한 파라미터 설정
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/goods/list";
	}
	
	//상품 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("gname") String gname,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("/remove");
		
		boolean result = service.remove(gname);
		//정상처리시 success, 비정상 처리시 null
		if(result) rttr.addFlashAttribute("result", "success");
		
		//원래의 페이지로 돌아가기 위한 파라미터 설정
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/goods/list";
	}

	@GetMapping("/reservation")
	public void reservationView(HttpSession session , HttpServletRequest request) {
		log.info("Getmapping Reservation 페이지");
		String gcode=(String)session.getAttribute("gcode");
		int gconfirmQty =Integer.parseInt(request.getParameter("gconfirmQty"));
		service.get(gcode).setGconfirmQty(gconfirmQty);
		
		log.info(gconfirmQty);
	
		
		
		
	}
	
	
	@PostMapping("/reservation")
	public String reservation(OrderVO vo,HttpSession session) {
		log.info("PostMapping Reservation 페이지");
		session.getAttribute("userName2"); 
		session.getAttribute("userPhone");
		session.getAttribute("userBirth"); 
		session.getAttribute("userEmail");
		session.getAttribute("userId");
		session.getAttribute("goods");
		
		log.info("reservation주문가격:"+vo.getAmount());
		log.info("reservation회원아이디:"+session.getAttribute("userId"));  // => 회원아이디 
		log.info("reservation회원이름:"+session.getAttribute("userName2"));  //username2 = >회원이름  , userName = 회원정보 전체조회
		//log.info("userName.id);
		
		orderService.add(vo);
		session.setAttribute("order_id", vo.getOrder_id());
		 String gcode=(String)session.getAttribute("gcode");
		
		return "redirect:/goods/payment";
	}
	
	
	@GetMapping("/payment")
	public void orderView(Model model, HttpSession session,OrderVO vo) {
			//orderService.add(vo);
		 // session.getAttribute("userName"); 
		//session.getAttribute("userId");
		String user_id=(String)session.getAttribute("userId");
		session.getAttribute("order_id");
		String gcode=(String)session.getAttribute("gcode");
		
		String order_id= (String) session.getAttribute("order_id");
		String e_mail=(String)session.getAttribute("userEmail");
		log.info(orderService.get(order_id));
		model.addAttribute("getOrder",orderService.get(order_id));  //주문한 유저의 주문내역조회
		//log.info(orderService.goodsRead(gcode));
		//log.info(orderService.userRead(user_id));
		
		//model.addAttribute("orders",orders);
		log.info("payment페이지 유저이름"+session.getAttribute("userId"));
		//user_id=(String)session.getAttribute("userId");
		log.info("payment 주문테이블의 유저이름:");
		log.info("payment 주문내역:"+orderService.orderlist(user_id));
		log.info("payment 주문번호:"+order_id);
		 //vo.getUser_id(session.getAttribute("userId"));
		  //vo.setUser_id(user_id);
		 //orderService.get(user_id);
		 //log.info("주문유저정보:"+ orderService.get(user_id));
		try {
			
		if(order_id!=null) {
			  MailVO mVo=new MailVO();
	          mVo.setContents("알로하이오에서 발송해드리는 메일입니다. <a href=\"https://post.naver.com/viewer/postView.nhn?volumeNo=19234301&memberNo=8591454&vType=VERTICAL\"><img src='http://localhost:8989/img/hwa.jpg' width='500px' height='500px'/></a>");       
	          mVo.setTo(e_mail);//회원메일로 변경
	          mVo.setSubject(user_id+"님 알로하오이를 이용해주셔서 감사합니다.");
	          mVo.setFrom("phw960819@gmail.com");//admin메일로 변경  
	           
	         

	        
	          
	          orderService.sendMail(mVo);   
		}
		
		}catch (Exception e) {e.printStackTrace();}

		}
		
		
		 
		 
		
		
	
	 @GetMapping("/orderList")
	   public void orderList(Model model, HttpSession session,OrderVO vo) {
		 String user_id=(String)session.getAttribute("userId");
		 vo.setUser_id(user_id);
		 String gcode=(String)session.getAttribute("gcode");
		 vo.setGcode(gcode);
		 String order_id= (String) session.getAttribute("order_id");
		
		
		 orderService.updateImages(user_id);
		 orderService.orderlist(user_id);
		  model.addAttribute("orderList",orderService.orderlist(user_id));
		
		  
		  log.info(orderService.orderlist(user_id));
		  
		 
		 
	   }
	 
	 
	 @PostMapping("/confirm")
	 public String confirm(OrderVO vo ,HttpSession session) {
		 String user_id=(String)session.getAttribute("userId");
		 String gcode= vo.getGcode();
		 log.info("유저아이디:"+user_id);
		 log.info("상품코드:"+gcode);
		 
		 int flag=vo.getFlag();
		 if(flag==0) {
			 orderService.updateFlag(gcode, user_id);
			 service.updateConfirmQty(vo);
		 }
		
		
		 return "redirect:/goods/orderList";
	 }
	
}
