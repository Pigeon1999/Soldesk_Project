package com.team3.rc_pro.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.team3.rc_pro.domain.UserInfoVO;
import com.team3.rc_pro.mapper.UserInfoMapper;

import lombok.Setter;

public class UserInfoDetailService implements UserDetailsService {
	
	@Setter(onMethod_ = { @Autowired })
	private UserInfoMapper userinfoMapper;
	
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {

		UserInfoVO user = userinfoMapper.viewuserinfo(user_id);
		UserDetails userdetail = new UserInfo(user); 
		System.out.println("userdetail: " + userdetail.toString());
		return user == null ? null : userdetail;
 }
}
