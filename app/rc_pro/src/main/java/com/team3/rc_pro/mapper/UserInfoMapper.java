package com.team3.rc_pro.mapper;

import java.util.List;

import com.team3.rc_pro.domain.AuthorityInfoVO;
import com.team3.rc_pro.domain.UserInfoVO;

public interface UserInfoMapper {
	
	public UserInfoVO selectUserInfo(String user_name);
	
	public int insertUserInfo(UserInfoVO userinfo);
	
	public int insertAuthorityInfo(AuthorityInfoVO authorityinfo);

	public UserInfoVO selectUserInfoAddress(String user_name);
}

