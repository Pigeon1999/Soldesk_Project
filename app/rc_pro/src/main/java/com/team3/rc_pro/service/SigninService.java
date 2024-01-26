package com.team3.rc_pro.service;

import java.util.List;

import com.team3.rc_pro.domain.PostInfoVO;
import com.team3.rc_pro.domain.UserInfoVO;

public interface SigninService {

	//회원 등록
	public boolean SigninUser(UserInfoVO userinfo);
	
	//아이디 중복체크
	public Long CheckUserid(String user_id);
	
	//이메일 중복체크
	public Long CheckUseremail(String user_email);
	
	//아이디 찾기
	public String FindUserid(UserInfoVO userinfo);
	
	//비밀번호 찾기
	public boolean FindUserpw(UserInfoVO userinfo);
	
	//비밀번호 찾기후 세팅
	public void setUserpw(UserInfoVO userinfo);
	
	//마이 페이지 조회 
	public UserInfoVO viewmyinfo(String user_id);
	
	//마이 페이지 정보 수정
	public boolean myinfomodify(UserInfoVO userinfo);
	
	//비밀번호 확인
	public boolean CheckUserpasswd(String user_id,String user_passwd);
	
	//게시글 조회
	public List<PostInfoVO> viewpostinfo(String user_id);
	
	//즐겨찾기 조회
	public List<PostInfoVO> viewscrapeinfo(String user_id);
}
