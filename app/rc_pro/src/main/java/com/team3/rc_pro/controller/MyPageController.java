package com.team3.rc_pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {

	@GetMapping("/MyPage")
	public String MyPage() {
		return "/common/MyPage";
	}
	
}
