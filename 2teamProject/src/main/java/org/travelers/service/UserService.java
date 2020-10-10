package org.travelers.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.travelers.domain.Criteria;
import org.travelers.domain.MailVO;
import org.travelers.domain.UserVO;

public interface UserService {
	
	
public UserVO getUser(UserVO vo);     //회원정보조회
	
	public void registerUser(UserVO vo);      //회원등록
	
	public Map<String, String> getRoles();//권한 조회
	
	public boolean modifyUser(UserVO vo);    //회원정보 수정
	
	public boolean removeUser(String id);    //회원탈퇴
	
	public List<UserVO> getUserList();       //회원목록조회
	
	public List<UserVO> getUserListWithPaging(Criteria cri);

	public int getTotal(Criteria cri); //회원목록 Total
	
	public UserVO loginUser(UserVO vo); //로그인
	
	public boolean modifyRole(UserVO vo); //회원상세보기 & 권한수정

	public UserVO getUserNoPass(UserVO vo); //관리자용 회원정보조회
	
	public int chkId(UserVO vo); //아이디 중복 체크

	 public UserVO findId(UserVO vo);   //아이디 찾기
	   
	  public String findPw(UserVO vo);   //비밀번호 찾기
	   
	  public void updatePw(UserVO vo);    //비밀번호 수정
	  
	  public String sendMail(MailVO vo);  //메일전송
	  
	  public UserVO myInfoNoPass(UserVO vo); //내정보 보기

	   
	
	
	
}