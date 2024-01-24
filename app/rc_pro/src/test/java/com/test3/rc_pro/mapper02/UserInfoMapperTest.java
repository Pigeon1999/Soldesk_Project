package com.test3.rc_pro.mapper02;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team3.rc_pro.mapper.UserInfoMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml",
					  "file:src/main/webapp/WEB-INF/spring/security-context.xml",
					  "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

public class UserInfoMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Setter(onMethod_ = @Autowired)
	private UserInfoMapper userinfomapper;

	
//	@Test
//	public void testInsertUserInfo() {
//		
//		UserInfoVO userinfo = new UserInfoVO();
//		
//		userinfo.setUser_num(2);
//		userinfo.setUser_name("관리자");
//		userinfo.setUser_birth("19990811");
//		userinfo.setUser_pn("010-1111-2222");
//		userinfo.setUser_address("인사동");
//		userinfo.setUser_email("admin99@gmail.com");
//		userinfo.setUser_id("admin99");
//		userinfo.setUser_passwd(pwencoder.encode("admin99"));
//		
//		log.info(userinfo);
//		userinfomapper.insertUserInfo(userinfo);
//	}
//	
//	@Test
//	public void testAuthorityInfo() {
//		
//		AuthorityInfoVO authorityInfo = new AuthorityInfoVO();
//		
//		authorityInfo.setUser_num(2);
//		authorityInfo.setUser_authority("1");
//		
//		log.info(authorityInfo);
//		userinfomapper.insertAuthorityInfo(authorityInfo);
//	}
	
	/*
	@Test
	public void testRead() {
		UserInfoVO userinfo = userinfomapper.selectUserInfo("admin99");
		log.info(userinfo);
		
		userinfo.getAuthorityList().forEach(authorityVO -> log.info(authorityVO));
	}
	
	
	@Test
	public void testReadAddress() {
		UserInfoVO userinfo = userinfomapper.selectUserInfoAddress("admin99");
		log.info(userinfo.getUser_address());
		
		userinfo.getAuthorityList().forEach(authorityVO -> log.info(authorityVO));
	}
	*/
}
