package com.team3.rc_pro.service;

import org.springframework.stereotype.Service;

import com.team3.rc_pro.common.paging.domain.BoardPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.BoardPagingDTO;
import com.team3.rc_pro.mapper.BoardListMapper;

@Service
public class BoardServiceImpl implements BoardService {

	private BoardListMapper boardListMapper ;

	//모든 필드 초기화 생성자
	public BoardServiceImpl(BoardListMapper boardListMapper) {
		this.boardListMapper = boardListMapper ;
		System.out.println("BoardServiceImpl의 모든 필드 초기화생성자입니다.");
		System.out.println("BoardMapeer: " + boardListMapper);
	}


//	//게시물 목록조회(READ)
//	@Override
//	public List<BoardVO> getBoardList() {
//
//		List<BoardVO> boardList = boardListMapper.selectBoardList() ;
//
//		return boardList;
//	}

	//게시물 목록조회(READ)
	@Override
	public BoardPagingCreatorDTO getBoardList(BoardPagingDTO boardPaging) {


	return new BoardPagingCreatorDTO(boardListMapper.selectRowTotal(boardPaging),
			 boardPaging,
			 boardListMapper.selectBoardList(boardPaging)) ;
	}

}
