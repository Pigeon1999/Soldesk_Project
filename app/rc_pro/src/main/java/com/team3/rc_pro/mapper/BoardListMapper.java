package com.team3.rc_pro.mapper;

import java.util.List;

import com.team3.rc_pro.common.paging.domain.BoardPagingDTO;
import com.team3.rc_pro.domain.BoardVO;

public interface BoardListMapper {

//	//게시물 목록조회
//	public List<BoardVO> selectBoardList() ;

	//게시물 목록조회
	public List<BoardVO> selectBoardList(BoardPagingDTO boardPaging) ;

	//게시물 총수(READ)
	public long selectRowTotal(BoardPagingDTO myboardPaging) ;

	
//	//회원 아이디조회
//	public String selectUserId() ;

//	public Date selectSysdate() ;

}
