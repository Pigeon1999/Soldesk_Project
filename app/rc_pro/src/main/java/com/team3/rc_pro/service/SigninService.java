package com.team3.rc_pro.service;

import com.team3.rc_pro.domain.UserInfoVO;

public interface SigninService {

	//회원 등록
	public boolean SigninUser(UserInfoVO userinfo);
	
	//아이디 중복체크
	public Long CheckUserid(String user_id);
	
}
