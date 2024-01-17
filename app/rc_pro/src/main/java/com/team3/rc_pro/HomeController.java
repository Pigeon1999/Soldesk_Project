package com.team3.rc_pro;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team3.rc_pro.controller.RegionController;
import com.team3.rc_pro.domain.UserInfoVO;
import com.team3.rc_pro.mapper.UserInfoMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@Controller
@Log4j
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Setter(onMethod_ = @Autowired)
    UserInfoMapper userinfoMapper;
	
	@Setter(onMethod_ = @Autowired)
    RegionController regionController;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		    
		logger.info("Welcome home! The client locale is {}.", locale);
		
		if (authentication != null && authentication.isAuthenticated() &&
	            !(authentication instanceof AnonymousAuthenticationToken)) {
		    String username = authentication.getName();
		   
		    String userAddress = userinfoMapper.selectUserInfoAddress(username);
		    log.info(userAddress);
		    
		    if (userAddress.equals("관철동")) {
		    	return "redirect:Gwancheol";
		    }
		    else if (userAddress.equals("청진동")) {
		    	return "redirect:Cheongjin";
		    }
		    else if (userAddress.equals("공평동")) {
		    	return "redirect:Gongpyeong";
		    }
		    else if (userAddress.equals("관수동")) {
		    	return "redirect:Gwansu";
		    }
		    else if (userAddress.equals("인사동")) {
		    	return "redirect:Insa";
		    }
		    else if (userAddress.equals("종로2가")) {
		    	return "redirect:Jongno2ga";
		    }
		    else if (userAddress.equals("삼각동")) {
		    	return "redirect:Samgak";
		    }
		    else if (userAddress.equals("서린동")) {
		    	return "redirect:Seorin";
		    }
		}
	    else {
	    	log.info("사용자가 로그인되어 있지 않습니다.");
	    	return "redirect:Gwancheol";
	    }
			  
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
