package com.team3.rc_pro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.rc_pro.common.paging.domain.BoardPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.BoardPagingDTO;
import com.team3.rc_pro.domain.PostInfoVO;
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
		
		return "/board/main";
	}
	
	@PostMapping("/main")
	public String logoutMain() {
		return performLogout();
	}
	
	private String performLogout() {
		 // 현재 사용자 로그아웃
		 SecurityContextHolder.getContext().setAuthentication(null);
		 
		 return "redirect:/";
	 }
	
	//회원가입페이지
	@GetMapping("/signin")
	public String usersigninpage() {
		System.out.println("회원가입 페이지 호출");
		return "/common/signin";
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
	
	//이메일 중복체크
	@ResponseBody
	@PostMapping("/emaildupcheck")
	public ResponseEntity<Long> emaildupcheck(String user_email) {
		Long result = signinService.CheckUseremail(user_email);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	//아이디 비밀번호 찾기 페이지 호출
	@GetMapping("/findidpw")
	public String finduseridpw() {
		System.out.println("아이디/비밀번호 찾기 페이지 호출");
		return "common/findidpw";
	}
	
	//아이디 찾기
	@PostMapping("/findid")
	public String finduserid(String user_name,String user_email,RedirectAttributes redirectAttr) {
		UserInfoVO userinfo = new UserInfoVO();
		userinfo.setUser_name(user_name);
		userinfo.setUser_email(user_email);
		String result = signinService.FindUserid(userinfo);
		if(result == null || result.length() == 0) {
			redirectAttr.addFlashAttribute("result", "fail");
		}else {
			redirectAttr.addFlashAttribute("result", result);
		}
		return "redirect:/findidpw";
	}
	
	//비밀번호 찾기
	@PostMapping("/findpw")
	public String finduserpw(String user_name,String user_id,RedirectAttributes redirectAttr) {
		UserInfoVO userinfo = new UserInfoVO();
		userinfo.setUser_name(user_name);
		userinfo.setUser_id(user_id);
		boolean result = signinService.FindUserpw(userinfo);
		if(result) {
	        String pw = "";
	        for (int i = 0; i < 5; i++) {
	            pw += (char) ((Math.random() * 26) + 97);
	        };
	        pw += (int)(Math.random()*100000) ;
			System.out.println("pw :"+ pw); //pw : 난수
			userinfo.setUser_passwd(pw);
			signinService.setUserpw(userinfo);
			redirectAttr.addFlashAttribute("pw",pw);
		}else {
			String fail= "fail";
			redirectAttr.addFlashAttribute("fail",fail);
		}
		
		return "redirect:/findidpw";
	}
	
	//마이페이지 호출
	@GetMapping("/myinfo")
	@PreAuthorize("isAuthenticated()")
	public String showMyinfo(String user_id,Model model) {
		UserInfoVO userinfo = new UserInfoVO();
		userinfo = signinService.viewmyinfo(user_id);
		List<PostInfoVO> postinfolist = signinService.viewpostinfo(user_id);
		List<PostInfoVO> scrapelist = signinService.viewscrapeinfo(user_id);
		model.addAttribute("scrapelist", scrapelist);
		model.addAttribute("postinfolist", postinfolist);
		model.addAttribute("userinfo", userinfo);
		return"common/myinfo";
	}
	
	//회원정보 수정
	@PostMapping("/myinfo")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> myinfomodify(UserInfoVO userinfo) {
		boolean modifyresult = signinService.myinfomodify(userinfo);
		String result = String.valueOf(modifyresult);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	//비밀번호 확인
	@ResponseBody
	@PostMapping("/pwcheck")
	public ResponseEntity<Long> passwdcheck(String user_id,String user_passwd) {
		boolean result = signinService.CheckUserpasswd(user_id,user_passwd);
		Long myresult;
		if(!result) {
			myresult = (long) 0;
		}else {
			myresult = (long) 1;
		}
		return new ResponseEntity<>(myresult,HttpStatus.OK);
	}
}
