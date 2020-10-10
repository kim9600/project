package org.travelers.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.travelers.domain.Criteria;
import org.travelers.domain.NoticeVO;
import org.travelers.domain.PageDTO;
import org.travelers.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/notice/*")//클래스 레벨 어노테이션
public class NoticeController {
	
	private NoticeService service;
	

	@GetMapping("/register")  //url경로:/notice/register
	public void register() {} //void타입 메소드인 경우 URI와 같은 jsp로 이동,/WEB-INF/views/register.jsp
	
	@PostMapping("/register")
	public String register(NoticeVO vo,RedirectAttributes rttr) {
		log.info("register:"+vo);
		service.register(vo);
		
		rttr.addFlashAttribute("result",vo.getNno());
		
		return "redirect:/notice/notice";
	}
	
	@GetMapping("/notice")
	public void list(Criteria cri, Model model,HttpSession session) {
		log.info("notice:"+cri);
		model.addAttribute("list",service.getListWithPaging(cri));
		session.getAttribute("userRole");
		int total = service.getTotal(cri);
		log.info("total:"+total);
		
		log.info("pageDTO:"+new PageDTO(cri,total)); 
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}

	
	//글 상세 보기
	//GetMapping("/get") //url /notice/get
	@GetMapping({"/get","/modify"}) //url /notice/get 혹은 /notice/modify 두 url경로에 대해 호출되는 메소드
	public void get(@RequestParam("nno") Long nno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or /modify");
		
		model.addAttribute("notice", service.get(nno));
	}

	/*
	 * @GetMapping({"/{nno}","/modify"}) //url /notice/get 혹은 /notice/modify 두
	 * url경로에 대해 호출되는 메소드 public String get2(@PathVariable("nno") Long
	 * nno, @ModelAttribute("cri") Criteria cri, Model model) {
	 * log.info("/get or /modify"); log.info("nno:"+nno);
	 * 
	 * model.addAttribute("notice", service.get(nno)); return "/notice/get";
	 * 
	 * }
	 */
	
	
	
	
	/*//GetMapping("/get") //url /notice/get
	@GetMapping({"/get","/modify"}) //url /notice/get 혹은 /notice/modify 두 url경로에 대해 호출되는 메소드
	public void get(@RequestParam("nno") Long nno, Model model) {
		log.info("/get or /modify");
		
		model.addAttribute("notice", service.get(nno));
	}
	*/
	//글 수정
	@PostMapping("/modify")
	public String modify(NoticeVO vo,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("/modify");
		
		boolean result = service.modify(vo);
		
		//정상처리시 success, 비정상 처리시 null
		if(result) rttr.addFlashAttribute("result", "success");
		
		//원래의 페이지로 돌아가기 위한 파라미터 설정
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/notice/notice";
	}
	
	
	//글 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("nno") Long nno,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("/remove");
		
		boolean result = service.remove(nno);
		//정상처리시 success, 비정상 처리시 null
		if(result) rttr.addFlashAttribute("result", "success");
		
		//원래의 페이지로 돌아가기 위한 파라미터 설정
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/notice/notice";
	}
	
	
}
