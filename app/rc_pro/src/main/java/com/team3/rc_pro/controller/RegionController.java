package com.team3.rc_pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.rc_pro.common.paging.domain.BoardPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.BoardPagingDTO;
import com.team3.rc_pro.domain.UserInfoVO;
import com.team3.rc_pro.mapper.UserInfoMapper;
import com.team3.rc_pro.service.BoardService;
import com.team3.rc_pro.service.PostInfoService;
import com.team3.rc_pro.service.SigninService;

import lombok.Setter;

@Controller
public class RegionController {
	
	private BoardService boardService ;
	
	public RegionController(BoardService boardService) {
		this.boardService = boardService ;
		System.out.println("BoardController의 모든 필드 초기화 생성자 입니다.");
	}
	
	@Setter(onMethod_ = @Autowired)
	private PostInfoService postinfoService;
	
	@Setter(onMethod_ = @Autowired)
	private SigninService signinService;
	
	@Setter(onMethod_ = @Autowired)
    UserInfoMapper userinfoMapper;

	@GetMapping("/main")
	public String main(Model model, BoardPagingDTO boardPaging) {
		BoardPagingCreatorDTO pagingCreator = boardService.getBoardList(boardPaging);
		
		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
		model.addAttribute("pagingCreator", pagingCreator) ;
		
		return "/region/main";
	}
	
//	@GetMapping("/Gwancheol")
//	public String Gwancheol(Model model) {
//		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
//		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
//		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
//		return "/region/Gwancheol/Gwancheol";
//	}
//	
//	@GetMapping("/Insa")
//	public String Insa(Model model) {
//		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
//		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
//		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
//		return "/region/Insa/Insa";
//	}
//	
//	@GetMapping("/Cheongjin")
//	public String Cheongjin(Model model) {
//		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
//		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
//		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
//		return "/region/Cheongjin/Cheongjin";
//	}
//	
//	@GetMapping("/Gongpyeong")
//	public String Gongpyeong(Model model) {
//		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
//		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
//		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
//		return "/region/Gongpyeong/Gongpyeong";
//	}
//	
//	@GetMapping("/Gwansu")
//	public String Gwansu(Model model) {
//		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
//		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
//		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
//		return "/region/Gwansu/Gwansu";
//	}
//	
//	@GetMapping("/Jongno2ga")
//	public String Jongno2ga(Model model) {
//		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
//		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
//		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
//		return "/region/Jongno2ga/Jongno2ga";
//	}
//	
//	@GetMapping("/Samgak")
//	public String Samgak(Model model) {
//		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
//		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
//		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
//		return "/region/Samgak/Samgak";
//	}
//	
//	@GetMapping("/Seorin")
//	public String Seorin(Model model) {
//		model.addAttribute("freePostInfo", postinfoService.getFreePostInfo());
//		model.addAttribute("promtionPostInfo", postinfoService.getPromotionPostInfo());
//		model.addAttribute("newsPostInfo", postinfoService.getNewsPostInfo());
//		return "/region/Seorin/Seorin";
//	}
	
	//회원가입페이지
	@GetMapping("/signin")
	public String usersigninpage() {
		System.out.println("회원가입 페이지 호출");
		return "/common/signin2";
	}
	
	//회원가입
	@PostMapping("/signin")
	public ResponseEntity<String> signin(UserInfoVO userinfo) {
		System.out.println("회원가입페이지 post");
		System.out.println(userinfo);
		boolean signupresult = signinService.SigninUser(userinfo);
		
		String result = String.valueOf(signupresult);
		System.out.println("회원가입 완료");
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	//아이디 중복체크
	@ResponseBody
	@PostMapping("/iddupcheck")
	public ResponseEntity<Long> iddupcheck(String user_id) {
		System.out.println("Controller.userid :" + user_id);
		Long result = signinService.CheckUserid(user_id);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
}
