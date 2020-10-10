package org.travelers.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.travelers.domain.ReviewVO;
import org.travelers.domain.Criteria;
import org.travelers.domain.PageDTO;
import org.travelers.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/review/*")//클래스 레벨 어노테이션
public class ReviewController {
	
	private ReviewService service;

	@GetMapping("/register")  //url경로:/board/register
	public void register() {} //void타입 메소드인 경우 URI와 같은 jsp로 이동,/WEB-INF/views/register.jsp
	
	@PostMapping("/register")
	public String register(ReviewVO vo,RedirectAttributes rttr) {
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
		
		rttr.addFlashAttribute("result",vo.getBno());
		
		return "redirect:/review/list";
	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list:"+cri);
		model.addAttribute("list",service.getListWithPaging(cri));
		
		int total = service.getTotal(cri);
		log.info("total:"+total);
		
		log.info("pageDTO:"+new PageDTO(cri,total)); 
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	//글 상세 보기
	//GetMapping("/get") //url /review/get
	@GetMapping({"/get","/modify"}) //url /review/get 혹은 /review/modify 두 url경로에 대해 호출되는 메소드
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model, HttpSession session) {
		log.info("/get or /modify");

		//model.addAttribute("review", service.get(bno));
		session.setAttribute("review",service.get(bno));
		session.setAttribute("bno", bno);
		model.addAttribute("cri", cri);

	}

	/*//GetMapping("/get") //url /review/get
	@GetMapping({"/get","/modify"}) //url /review/get 혹은 /review/modify 두 url경로에 대해 호출되는 메소드
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get or /modify");
		
		model.addAttribute("review", service.get(bno));
	}
	*/
	//글 수정
	@PostMapping("/modify")
	public String modify(ReviewVO vo,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
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
		rttr.addAttribute("amount",  cri.getAmount()); 
		rttr.addAttribute("type",    cri.getType()); 
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/review/list";
	}
	
	//글 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("/remove");
		
		boolean result = service.remove(bno);
		//정상처리시 success, 비정상 처리시 null
		if(result) rttr.addFlashAttribute("result", "success");
		
		//원래의 페이지로 돌아가기 위한 파라미터 설정
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount",  cri.getAmount()); 
		rttr.addAttribute("type",    cri.getType()); 
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/review/list";
	}
	
	
}
