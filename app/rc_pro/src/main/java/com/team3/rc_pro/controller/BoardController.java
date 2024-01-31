package com.team3.rc_pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
import com.team3.rc_pro.domain.LikeInfoVO;
import com.team3.rc_pro.domain.PostInfoVO;
import com.team3.rc_pro.domain.ReplyInfoVO;
import com.team3.rc_pro.domain.ScrapeInfoVO;
import com.team3.rc_pro.mapper.LikeInfoMapper;
import com.team3.rc_pro.mapper.PostInfoMapper;
import com.team3.rc_pro.mapper.ReplyInfoMapper;
import com.team3.rc_pro.mapper.ScrapeInfoMapper;
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
	
	@Setter(onMethod_ = @Autowired)
	ReplyInfoMapper replyInfoMapper;
	
	@Setter(onMethod_ = @Autowired)
	ScrapeInfoMapper scrapeInfoMapper;
	
	@Setter(onMethod_ = @Autowired)
	LikeInfoMapper likeInfoMapper;
	
	@Setter(onMethod_ = @Autowired)
	PostInfoMapper postInfoMapper;

	public BoardController(BoardService boardService) {
		this.boardService = boardService ;
		System.out.println("BoardController의 모든 필드 초기화 생성자 입니다.");
	}

	@GetMapping("/list")
	public String showBoardList(BoardPagingDTO boardPaging, Model model) {
		BoardPagingCreatorDTO pagingCreator = boardService.getBoardList(boardPaging) ;
		System.out.println("컨트롤러에 전달된 boardPagingCreator: \n" + pagingCreator);
		
		model.addAttribute("pagingCreator", pagingCreator) ;
		model.addAttribute("userInfo", userinfoMapper.selectUserInfo());
		
		return "board/list" ;
	}
	
	@GetMapping("/newslist")
	public String showBoardList2(BoardPagingDTO boardPaging, Model model) {
		BoardPagingCreatorDTO pagingCreator = boardService.getBoardList(boardPaging) ;
		System.out.println("컨트롤러에 전달된 boardPagingCreator: \n" + pagingCreator);

		model.addAttribute("pagingCreator", pagingCreator) ;
		model.addAttribute("userInfo", userinfoMapper.selectUserInfo());

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
	public String showDetail(BoardPagingDTO boardPaging, PostInfoVO postInfo, Model model, @RequestParam int post_id) {
		BoardPagingCreatorDTO pagingCreator = boardService.getBoardList(boardPaging) ;
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Integer userNum = userinfoMapper.selectUsernum(username);
		
		model.addAttribute("PostInfo", postInfoService.getPostInfo());
		model.addAttribute("pagingCreator", pagingCreator) ;
		model.addAttribute("ReplyInfo", replyInfoMapper.selectReplyInfo());
		model.addAttribute("user_num", userNum);
		model.addAttribute("userInfo", userinfoMapper.selectUserInfo());
		
		postInfo.setPost_id(post_id);
		postInfoMapper.countView(postInfo);
		
		return "/board/detail";
	}
	
	@PostMapping("/detail/reply") 
	public ResponseEntity<String> replyRegister(ReplyInfoVO replyInfo, 
												PostInfoVO postInfo,
												@RequestParam int post_id,
												@RequestParam String reply_content) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Integer userNum = userinfoMapper.selectUsernum(username);
		
		replyInfo.setUser_num(userNum);
		replyInfo.setPost_id(post_id);
		replyInfo.setReply_content(reply_content);
		
		System.out.println("user_num : " + replyInfo.getUser_num());
		System.out.println("post_id : " + replyInfo.getPost_id());
		System.out.println("reply_content : " + replyInfo.getReply_content());
		
		replyInfoMapper.insertReplyInfo(replyInfo);
		int post_reply = replyInfoMapper.countReply(post_id);
		
		postInfo.setPost_id(post_id);
		postInfo.setPost_reply(post_reply);
		postInfoMapper.countReply(postInfo);
		
		return new ResponseEntity<>(String.valueOf(true),HttpStatus.OK);
	}
	
	@PostMapping("/detail/replyGroup") 
	public ResponseEntity<String> replyGroupRegister(ReplyInfoVO replyInfo, 
													 PostInfoVO postInfo,
													 @RequestParam int post_id,
													 @RequestParam int replyGroup_id,
													 @RequestParam String replyGroupContent) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Integer userNum = userinfoMapper.selectUsernum(username);
		
		replyInfo.setUser_num(userNum);
		replyInfo.setPost_id(post_id);
		replyInfo.setReply_group(replyGroup_id);
		replyInfo.setReply_content(replyGroupContent);
		
		System.out.println("user_num : " + replyInfo.getUser_num());
		System.out.println("post_id : " + replyInfo.getPost_id());
		System.out.println("replyGroup_id : " + replyInfo.getReply_group());
		System.out.println("reply_content : " + replyInfo.getReply_content());
		
		replyInfoMapper.insertReplyGroupInfo(replyInfo);
		int post_reply = replyInfoMapper.countReply(post_id);
		
		postInfo.setPost_id(post_id);
		postInfo.setPost_reply(post_reply);
		postInfoMapper.countReply(postInfo);
		
		return new ResponseEntity<>(String.valueOf(true),HttpStatus.OK);
	}
	
	@PostMapping("/detail/scrapeReply") 
	public ResponseEntity<String> scrapeReply(ScrapeInfoVO scrapeInfo, 
											@RequestParam int post_id) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Integer userNum = userinfoMapper.selectUsernum(username);
		
		scrapeInfo.setUser_num(userNum);
		scrapeInfo.setPost_id(post_id);
		
		System.out.println("user_num : " + scrapeInfo.getUser_num());
		System.out.println("post_id : " + scrapeInfo.getPost_id());
		
		scrapeInfoMapper.insertScrapeInfo(scrapeInfo);
		
		return new ResponseEntity<>(String.valueOf(true),HttpStatus.OK);
	}
	
	@PostMapping("/detail/unscrapeReply") 
	public ResponseEntity<String> unscrapeReply(ScrapeInfoVO scrapeInfo, 
											@RequestParam int post_id) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Integer userNum = userinfoMapper.selectUsernum(username);
		
		scrapeInfo.setUser_num(userNum);
		scrapeInfo.setPost_id(post_id);
		
		System.out.println("user_num : " + scrapeInfo.getUser_num());
		System.out.println("post_id : " + scrapeInfo.getPost_id());

		scrapeInfoMapper.deleteScrapeInfo(scrapeInfo);
		
		return new ResponseEntity<>(String.valueOf(true),HttpStatus.OK);
	}
	
	@PostMapping("/detail/likeReply") 
	public ResponseEntity<String> likeReply(LikeInfoVO likeInfo, 
											PostInfoVO postInfo,
											@RequestParam int post_id) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Integer userNum = userinfoMapper.selectUsernum(username);
		
		likeInfo.setUser_num(userNum);
		likeInfo.setPost_id(post_id);
		
		System.out.println("user_num : " + likeInfo.getUser_num());
		System.out.println("post_id : " + likeInfo.getPost_id());
		
		likeInfoMapper.insertLikeInfo(likeInfo);
		
		
		int post_like = likeInfoMapper.countLike(post_id);
		
		postInfo.setPost_id(post_id);
		postInfo.setPost_like(post_like);
		postInfoMapper.countLike(postInfo);

		return new ResponseEntity<>(String.valueOf(true),HttpStatus.OK);
	}
	
	@PostMapping("/detail/unlikeReply") 
	public ResponseEntity<String> unlikeReply(LikeInfoVO likeInfo, 
											  PostInfoVO postInfo,
											  @RequestParam int post_id) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Integer userNum = userinfoMapper.selectUsernum(username);
		
		likeInfo.setUser_num(userNum);
		likeInfo.setPost_id(post_id);
		
		System.out.println("user_num : " + likeInfo.getUser_num());
		System.out.println("post_id : " + likeInfo.getPost_id());

		likeInfoMapper.deleteLikeInfo(likeInfo);
		int post_like = likeInfoMapper.countLike(post_id);
		
		postInfo.setPost_id(post_id);
		postInfo.setPost_like(post_like);
		postInfoMapper.countLike(postInfo);
		
		return new ResponseEntity<>(String.valueOf(true),HttpStatus.OK);
	}
	
	@PostMapping("/detail/hide")
	public ResponseEntity<String> hidePost(PostInfoVO postInfo,
									  	  @RequestParam int post_id) {
		
		postInfo.setPost_id(post_id);
		
		postInfoMapper.hidePost(postInfo);
		
		return new ResponseEntity<>(String.valueOf(true),HttpStatus.OK);
	}
	
	@PostMapping("/detail/hideReply")
	public ResponseEntity<String> hideReply(ReplyInfoVO replyInfo,
									  	  	@RequestParam int reply_id) {
		
		replyInfo.setReply_id(reply_id);
		
		replyInfoMapper.hideReply(replyInfo);
		
		return new ResponseEntity<>(String.valueOf(true),HttpStatus.OK);
	}
							
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String showRegister(BoardPagingDTO boardPaging, Model model) {
		BoardPagingCreatorDTO pagingCreator = boardService.getBoardList(boardPaging) ;
		System.out.println("컨트롤러에 전달된 boardPagingCreator: \n" + pagingCreator);

		model.addAttribute("pagingCreator", pagingCreator) ;
		
		return "/board/register";
	}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> register(PostInfoVO postInfo,
								  @RequestParam int region_id,
								  @RequestParam int category_id, 
								  @RequestParam String post_title,
								  @RequestParam String post_content,
								  @RequestParam String post_file){
				
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Integer userNum = userinfoMapper.selectUsernum(username);
		
		postInfo.setRegion_id(region_id);
		postInfo.setCategory_id(category_id);
		postInfo.setUser_num(userNum);
		postInfo.setPost_title(post_title);
		postInfo.setPost_content(post_content);
		postInfo.setPost_file(post_file);
		
		System.out.println("region_id : " + postInfo.getRegion_id());
		System.out.println("category_id : " + postInfo.getCategory_id());
		System.out.println("user_num : " + postInfo.getUser_num());
		System.out.println("post_title :" + postInfo.getPost_title());
		System.out.println("post_content : " + postInfo.getPost_content());
		System.out.println("post_file : " + postInfo.getPost_file());
		
		postInfoService.insertPost(postInfo);
		
		return new ResponseEntity<>(String.valueOf(true),HttpStatus.OK);
	}
	
	@GetMapping("/modify")
	@PreAuthorize("isAuthenticated()")
	public String showModify(BoardPagingDTO boardPaging, Model model) {
		BoardPagingCreatorDTO pagingCreator = boardService.getBoardList(boardPaging) ;
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Integer userNum = userinfoMapper.selectUsernum(username);
		
		model.addAttribute("PostInfo", postInfoService.getPostInfo());
		model.addAttribute("pagingCreator", pagingCreator) ;
		model.addAttribute("user_num", userNum);
		
		return "/board/modify";
	}
	
	@PostMapping("/modify")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> modify(PostInfoVO postInfo,
									  @RequestParam int region_id,
									  @RequestParam int category_id, 
									  @RequestParam String post_title,
									  @RequestParam String post_content,
									  @RequestParam String post_file){
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Integer userNum = userinfoMapper.selectUsernum(username);
		
		postInfo.setRegion_id(region_id);
		postInfo.setCategory_id(category_id);
		postInfo.setUser_num(userNum);
		postInfo.setPost_title(post_title);
		postInfo.setPost_content(post_content);
		postInfo.setPost_file(post_file);
			
		System.out.println("region_id : " + postInfo.getRegion_id());
		System.out.println("category_id : " + postInfo.getCategory_id());
		System.out.println("user_num : " + postInfo.getUser_num());
		System.out.println("post_title :" + postInfo.getPost_title());
		System.out.println("post_content : " + postInfo.getPost_content());
		System.out.println("post_file : " + postInfo.getPost_file());
		
		postInfoMapper.updatePost(postInfo);
		
		return new ResponseEntity<>(String.valueOf(true),HttpStatus.OK);
	}

}
