package com.team3.rc_pro.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MyLoginLogoutController {
	
	 @GetMapping("/login") // 사용자 정의 로그인 JSP 페이지 호출 URL, 다른 URL을 사용해도 됨
	 public String loginPageGET(String error, String logout, Model model) { 
	 if (error != null) {
		 log.info("로그인 오류 시 error.hashCode(): " + error.hashCode());
		 model.addAttribute("error", "아이디혹은 비밀번호를 확인하세요.");
		 
		 return "common/login"; 
	 } 
	 else if (logout != null) {
		 log.info("로그인 오류 시 error.hashCode(): " + logout.hashCode());
		 model.addAttribute("logout", "로그아웃 되었습니다.");
		 return "common/login";
	 }
	 
	 //정상적인 로그인 페이지 호출
	 model.addAttribute("normal", "정상적인 로그인 페이지 호출 처리..");
	 log.info("정상적인 로그인 페이지 호출");
	 
	 return "common/login";
}	 
	
}
