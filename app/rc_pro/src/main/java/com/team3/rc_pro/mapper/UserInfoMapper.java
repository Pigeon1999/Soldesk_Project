package com.team3.rc_pro.mapper;

import com.team3.rc_pro.domain.UserInfoVO;

public interface UserInfoMapper {
	
	//회원 조회
	public UserInfoVO viewuserinfo(String user_id);
	
	//회원 등록	
	public void insertUserInfo(UserInfoVO userinfo);
	
	//회원 권한 추가
	public void insertAuthorityInfo(String user_id);
	
	//아이디 중복체크기능
	public Long iddupcheck(String user_id);
	
	//주소 조회
	public UserInfoVO selectUserInfoAddress(String user_id);
	
	//회원번호 찾기 
	public int selectUserNum(String user_id);
	
}

