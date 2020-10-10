package org.travelers.mapper;

import java.util.List;
import java.util.Map;

import org.travelers.domain.Criteria;
import org.travelers.domain.UserVO;

public interface UserMapper {
	
	public UserVO readUser(UserVO vo);     //회원정보조회
	
	public void insertUser(UserVO vo);      //회원등록
	
	public Map<String, String> getRoles();//권한 조회
	
	public int updateUser(UserVO vo);    //회원정보 수정
	
	public int deleteUser(String id);    //회원탈퇴

	public List<UserVO> getUserList();   //회원목록조회

	public List<UserVO> getUserListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri); //

	public UserVO loginUser(UserVO vo); //로그인
	
	public int modifyRole(UserVO vo);    //회원상세보기 & 권한수정

	public UserVO getUserNoPass(UserVO vo); //관리자용 회원정보조회
	
	public int chkId(UserVO vo); //아이디 중복 확인
	
	 public UserVO findId(UserVO vo);   //아이디 찾기
	   
	  public String findPw(UserVO vo);   //비밀번호 찾기
	   
	  public void updatePw(UserVO vo);    //비밀번호 수정
	  
	  public UserVO myInfoNoPass(UserVO vo); //내 정보 보기
}
