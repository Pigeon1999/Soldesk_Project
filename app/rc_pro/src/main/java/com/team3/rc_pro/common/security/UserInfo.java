package com.team3.rc_pro.common.security;

import java.util.stream.Collectors;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import com.team3.rc_pro.domain.UserInfoVO;

import lombok.Getter;

@Getter
public class UserInfo extends User {
	private static final long serialVersionUID = 1L ;
	
	private UserInfoVO userinfo;
	
	public UserInfo (UserInfoVO userinfo) {
		
		super(userinfo.getUser_id(),
			  userinfo.getUser_passwd(),
			  userinfo.getAuthorityList()
			  		  .stream()
			  		  .map(auth -> new SimpleGrantedAuthority(auth.getUser_authority()))
			  		  .collect(Collectors.toList())
		);
		
		 System.out.println("MyUser 생성자에 전달된 UserInfoVO 정보:" + userinfo.toString());
		 System.out.println("MyUser 객체 생성을 통해 MyUser 의 부모객체(User 객체) 생성됨");
		 System.out.println("=====================================================");
		 
		 this.userinfo = userinfo;
	}

}
