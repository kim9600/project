package org.travelers.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



import org.travelers.domain.MailVO;

import org.travelers.domain.UserVO;
import org.travelers.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/users/*")//클래스 레벨 어노테이션
public class UserController {
	
	private UserService userService;
	  @Autowired 
	   private JavaMailSenderImpl mailSender;
// ------------------------------- 로그인 페이지
	
	
	
	
//---------------------------------------	
	
	
	 @GetMapping(value="/register") public String register()
	 { 
		 log.info("Getmapping회원가입페이지");
		 return "/users/register"; 
		 }
	 
	
	  //회원가입 처리 후 로그인 창으로 이동
	  
	 @PostMapping("/register") public String registerPro(UserVO vo) {
		log.info("postMapping 회원가입페이지");
	  System.out.println(vo); //db저장 
	  vo.setRole("user"); //admin,user
	  userService.registerUser(vo);
	  
	  return "redirect:/userlogin/login"; 
	  } 
	  
	  
	 
	    //회원정보 수정 페이지로 이동
	  
		
		@GetMapping("/updateInfo") 
		public String updateInfoForm(UserVO vo,Model model) { 
		System.out.println("수정:"+vo);
		  model.addAttribute("user",userService.myInfoNoPass(vo)); 
		  return "/users/updateInfo";
		  }
		 
		
	
		  
		 
	  //회원정보 수정처리후 로그인 페이지로 이동
	 
		
		  @PostMapping("/updateInfo")
	       public String updateInfoPro(UserVO vo, Model model) { //if 패스워드가 맞으면 db수정, 아니면 이전으로 이동
	         UserVO user= userService.myInfoNoPass(vo);
	         if(user!=null) { //db수정처리
	            userService.modifyUser(vo); 
	            return "redirect:/";
	            }else {
	               return "users/updateInfo"; 
	               }
	         }

	  
		  @GetMapping("/deleteUser") public String deleteUser(@RequestParam("id")
		     String id) {//String id=request.getParameter("id")
		     userService.removeUser(id); return "redirect:/users/logout"; }


		  @GetMapping("/logout")
	      public String logout(HttpSession session) {
	         session.invalidate();
	         return "redirect:/";
	      }

	 //회원목록
	 /* 페이지 형식(1페이지 10행)
	 @GetMapping("/userlist")
		public void list(Criteria cri, Model model) {
			log.info("userlist:"+cri);
			model.addAttribute("userlist",userService2.getUserListWithPaging(cri));
			
			int total = userService2.getTotal(cri);
			log.info("total:"+total);
			
			log.info("pageDTO:"+new PageDTO(cri,total)); 
			model.addAttribute("pageMaker",new PageDTO(cri,total));
		}
		*/
	 @GetMapping("/userlist") //전체목록 한 페이지에 조회
	 public void list(Model model) {
		 log.info("list:");
		 
		 model.addAttribute("userlist",userService.getUserList());
	 }
	 
	//권한 수정
		@GetMapping("/modifyInfo")
		/*
		public String modify(UserVO vo,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
			log.info("/modify");
			
			boolean result = userService2.modifyUser(vo);
			
			//정상처리시 success, 비정상 처리시 null
			if(result) rttr.addFlashAttribute("result", "success");
			
			//원래의 페이지로 돌아가기 위한 파라미터 설정
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/users/userlist";
		}
		*/
		public String modifyInfo(UserVO vo,Model model) { 
			System.out.println("권한수정:"+vo);
			  model.addAttribute("user",userService.getUserNoPass(vo)); 
			  return "/users/modifyInfo";
			  }
		 
		@ModelAttribute("roleMap") public Map<String,String> searchConditionMap(){
		  Map<String,String> roleMap = new HashMap<>(); 
		  //roleMap = userService2.getRoles(); 
		  roleMap.put("admin", "admin");
		  roleMap.put("user", "user");
		  return roleMap; 
		  }
		  
		
		 //권한 수정처리후 유저리스트 페이지로 이동
		 @PostMapping("/modifyInfo") 
		 public String modifyInfoPro(UserVO vo, Model model) {
		  
		   UserVO user= userService.getUserNoPass(vo);
		
		  if(user!=null) { //db수정처리
			  userService.modifyRole(vo); 
		  }
		  return "redirect:/users/userlist"; 
		  
		  
	}
		 //내 정보
	      @GetMapping("/myInfo")
	      public String myInfo(UserVO vo,Model model) { 
	         System.out.println("내 정보 조회");
	           model.addAttribute("user",userService.getUserNoPass(vo));
	         return "/users/myInfo"; 
	      }

		 /* 회원아이디 중복체크 */
			@ResponseBody
			@RequestMapping(value = "/chkId",
							method = RequestMethod.POST)
			public int chkId(UserVO vo) throws Exception{
				int result = userService.chkId(vo);
				return result;		
			}	 
			
			/* 아이디 찾기 */
			   @GetMapping("/findId") 
			    public void findId() {}   
			   
			   @ResponseBody
			   @RequestMapping("/findId")
			   public String findId(@ModelAttribute UserVO vo) throws Exception {      
			      return userService.findId(vo).getId();   
			   }
			   
			   /* 비밀번호 찾기 */
			
			   @GetMapping("/findPw") public void findPw() {}
				
			   
			   @PostMapping("/findPw")
			    public String sendEmailAction (UserVO vo, Model model, HttpServletResponse response , HttpServletRequest request) throws IOException { 
				   request.setCharacterEncoding("UTF-8");
				   response.setContentType("text/html;charset=UTF-8");
				   PrintWriter writer = response.getWriter();

			        String id= vo.getId();
			        String e_mail= vo.getEmail();
			        log.info("아이디:"+id+"이메일:"+e_mail);
			        String pw= userService.findPw(vo);    
			        log.info("기존비밀번호:"+pw);
			        
			       if(pw!=null) {
			    	   
			    	   try {
			    		   	String pw2 = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
			    	        pw2 = pw2.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌. 
			    		   
				        	  vo.setPassword(pw2);
				  	          userService.updatePw(vo);
				        		
					          MailVO mVo=new MailVO();
					          mVo.setContents("비밀번호는 "+pw2+" 입니다.");       
					          mVo.setTo(e_mail);//회원메일로 변경
					          mVo.setSubject(id+"님 비밀번호 찾기 메일입니다.");
					          mVo.setFrom("phw960819@gmail.com");//admin메일로 변경  
				          
					          userService.sendMail(mVo);        
					          
					          writer.println("<script>");
				                writer.println("alert('이메일 보냈습니다.');");                
				                writer.println("</script>");
				                writer.flush();
				        } catch (Exception e) {
							e.printStackTrace();	
						}
			        }else { 
			             writer.println("<script>");
			             writer.println("alert('이메일과 아이디를 확인해주세요');");
			             writer.println("history.back();");
			             writer.println("</script>");
			             writer.flush();
			          }       
			        return "userlogin/login";
			    }
			
			  
			      
			  
		 
			   
			  
}
