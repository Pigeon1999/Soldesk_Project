package com.team3.rc_pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team3.rc_pro.common.paging.domain.BoardPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.BoardPagingDTO;
import com.team3.rc_pro.domain.PostInfoVO;
import com.team3.rc_pro.mapper.PostInfoMapper;
import com.team3.rc_pro.mapper.UserInfoMapper;
import com.team3.rc_pro.service.BoardService;
import com.team3.rc_pro.service.PostInfoService;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	private BoardService boardService ;
	
	@Setter(onMethod_ = @Autowired)
	private PostInfoService postInfoService;
	
	@Setter(onMethod_ = @Autowired)
    UserInfoMapper userinfoMapper;

	public BoardController(BoardService boardService) {
		this.boardService = boardService ;
		System.out.println("BoardController의 모든 필드 초기화 생성자 입니다.");
	}

	@GetMapping("/list")
	public String showBoardList(BoardPagingDTO boardPaging, Model model) {
		BoardPagingCreatorDTO pagingCreator = boardService.getBoardList(boardPaging) ;
		System.out.println("컨트롤러에 전달된 boardPagingCreator: \n" + pagingCreator);

		model.addAttribute("pagingCreator", pagingCreator) ;

		return "board/list" ;
	}
	
	@GetMapping("/newslist")
	public String showBoardList2(BoardPagingDTO boardPaging, Model model) {
		BoardPagingCreatorDTO pagingCreator = boardService.getBoardList(boardPaging) ;
		System.out.println("컨트롤러에 전달된 boardPagingCreator: \n" + pagingCreator);

		model.addAttribute("pagingCreator", pagingCreator) ;

		return "board/newslist" ;
	}
	
	@GetMapping("/region_home")
	public String showBoardList3(BoardPagingDTO boardPaging, Model model) {
		BoardPagingCreatorDTO pagingCreator = boardService.getBoardList(boardPaging) ;
		System.out.println("컨트롤러에 전달된 boardPagingCreator: \n" + pagingCreator);

		model.addAttribute("pagingCreator", pagingCreator) ;

		return "board/region_home" ;
	}
	
	@GetMapping("/detail")
	public String showDetail(BoardPagingDTO boardPaging, Model model) {
		BoardPagingCreatorDTO pagingCreator = boardService.getBoardList(boardPaging) ;
		
		model.addAttribute("PostInfo", postInfoService.getPostInfo());
		model.addAttribute("pagingCreator", pagingCreator) ;
		
		return "/board/detail";
	}
	
	@GetMapping("/register")
	public String showRegister(BoardPagingDTO boardPaging, Model model) {
		BoardPagingCreatorDTO pagingCreator = boardService.getBoardList(boardPaging) ;
		System.out.println("컨트롤러에 전달된 boardPagingCreator: \n" + pagingCreator);

		model.addAttribute("pagingCreator", pagingCreator) ;
		
		return "/board/register";
	}
	
	@PostMapping("/register")
	public ResponseEntity<String> register(PostInfoVO postInfo,
								  @RequestParam int region_id,
								  @RequestParam int category_id, 
								  @RequestParam String post_title,
								  @RequestParam String post_content){
				
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Integer userNum = userinfoMapper.selectUsernum(username);
		
		postInfo.setRegion_id(region_id);
		postInfo.setCategory_id(category_id);
		postInfo.setUser_num(userNum);
		postInfo.setPost_title(post_title);
		postInfo.setPost_content(post_content);
		
		System.out.println("region_id : " + postInfo.getRegion_id());
		System.out.println("category_id : " + postInfo.getCategory_id());
		System.out.println("user_num : " + postInfo.getUser_num());
		System.out.println("post_title :" + postInfo.getPost_title());
		System.out.println("post_content : " + postInfo.getPost_content());
		
		postInfoService.insertPost(postInfo);
		
		return new ResponseEntity<>(String.valueOf(true),HttpStatus.OK);
	}
	
	@GetMapping("/modify")
	public String showModify() {
		return "/board/modify";
	}

}
