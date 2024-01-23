package com.team3.rc_pro.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team3.rc_pro.common.paging.domain.BoardPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.BoardPagingDTO;
import com.team3.rc_pro.domain.BoardVO;
import com.team3.rc_pro.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	private BoardService boardService ;


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

}
