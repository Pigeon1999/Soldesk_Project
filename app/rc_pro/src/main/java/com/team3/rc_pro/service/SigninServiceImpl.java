package com.team3.rc_pro.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.team3.rc_pro.domain.UserInfoVO;
import com.team3.rc_pro.mapper.UserInfoMapper;

@Service
public class SigninServiceImpl implements SigninService {
	
	private UserInfoMapper userinfoMapper;
	private PasswordEncoder pwencoder;
	
	public SigninServiceImpl(UserInfoMapper userinfoMapper,PasswordEncoder pwencoder) {
		this.userinfoMapper = userinfoMapper;
		this.pwencoder = pwencoder;
	}

	@Override
	public Long CheckUserid(String userid) {
		return userinfoMapper.iddupcheck(userid);
	}
	
	@Override
	public boolean SigninUser(UserInfoVO userinfo) {
		
		userinfo.setUser_passwd(pwencoder.encode(userinfo.getUser_passwd()));
		userinfoMapper.insertUserInfo(userinfo);
		userinfoMapper.insertAuthorityInfo(userinfo.getUser_id()); 
		return true;
	}
	
	
	
}
