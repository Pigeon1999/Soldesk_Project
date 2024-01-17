package com.team3.rc_pro.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.team3.rc_pro.domain.UserInfoVO;
import com.team3.rc_pro.mapper.UserInfoMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class UserInfoDetailService implements UserDetailsService {
	
	@Setter(onMethod_ = { @Autowired })
	private UserInfoMapper userinfoMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		log.info("Load User By UserName: " + username);
		
		UserInfoVO myMember = userinfoMapper.selectUserInfo(username);
		log.warn("MyMemberMapper에 의해서 반환된 MyMemberVO: " + myMember);
		
		return myMember == null ? null : new UserInfo(myMember);
 }
}
