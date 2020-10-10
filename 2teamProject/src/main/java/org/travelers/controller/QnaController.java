package org.travelers.controller;

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
import org.travelers.domain.PageDTO;
import org.travelers.domain.QnaVO;
import org.travelers.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/qna/*")//클래스 레벨 어노테이션
public class QnaController {
	
	private QnaService service;

	@GetMapping("/register")  //url경로:/board/register
	public void register() {} //void타입 메소드인 경우 URI와 같은 jsp로 이동,/WEB-INF/views/register.jsp
	
	@PostMapping("/register")
	public String register(QnaVO vo,RedirectAttributes rttr) {
		log.info("register:"+vo);
		service.register(vo);
		
		rttr.addFlashAttribute("result",vo.getQno());
		
		return "redirect:/qna/qna";
	}
	//글목록보기
	//@GetMapping("/list")      //url경로:/board/list
	//public void list(Model model) {//list.jsp로 이동,/WEB-INF/views/list.jsp
	//	log.info("list:");
		
	//	model.addAttribute("list",service.getList());//service의 getList()메소드 호출 결과를 model에 저장
	//}
	
	//@GetMapping("/list")
	//public void list(Criteria cri, Model model) {
	//	log.info("list:"+cri);
	//	model.addAttribute("list",service.getListWithPaging(cri));
	//}

	@GetMapping("/qna")
	public void list(Criteria cri, Model model) {
		log.info("qna:"+cri);
		model.addAttribute("list",service.getListWithPaging(cri));
		
		int total = service.getTotal(cri);
		log.info("total:"+total);
		
		log.info("pageDTO:"+new PageDTO(cri,total)); 
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}

	//글 상세 보기
	//GetMapping("/get") //url /board/get
	@GetMapping({"/get","/modify"}) //url /board/get 혹은 /board/modify 두 url경로에 대해 호출되는 메소드
	public void get(@RequestParam("qno") Long qno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or /modify");
		
		model.addAttribute("qna", service.get(qno));
	}
	
	/*
	 * @GetMapping({"/{qno}","/modify"}) //url /notice/get 혹은 /notice/modify 두
	 * url경로에 대해 호출되는 메소드 public String get2(@PathVariable("qno") Long
	 * qno, @ModelAttribute("cri") Criteria cri, Model model) {
	 * log.info("/get or /modify"); log.info("qno:"+qno);
	 * 
	 * model.addAttribute("qna", service.get(qno)); return "/qna/get";
	 * 
	 * }
	 */

	/*//GetMapping("/get") //url /board/get
	@GetMapping({"/get","/modify"}) //url /board/get 혹은 /board/modify 두 url경로에 대해 호출되는 메소드
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get or /modify");
		
		model.addAttribute("board", service.get(bno));
	}
	*/
	//글 수정
	@PostMapping("/modify")
	public String modify(QnaVO vo,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("/modify");
		
		boolean result = service.modify(vo);
		
		//정상처리시 success, 비정상 처리시 null
		if(result) rttr.addFlashAttribute("result", "success");
		
		//원래의 페이지로 돌아가기 위한 파라미터 설정
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/qna/qna";
	}
	
	//글 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("qno") Long qno,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("/remove");
		
		boolean result = service.remove(qno);
		//정상처리시 success, 비정상 처리시 null
		if(result) rttr.addFlashAttribute("result", "success");
		
		//원래의 페이지로 돌아가기 위한 파라미터 설정
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/qna/qna";
	}
	
	
}
