 package com.team3.rc_pro.service;

import com.team3.rc_pro.common.paging.domain.BoardPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.BoardPagingDTO;

public interface BoardService {

//	public List<BoardVO> getBoardList() ;

	public BoardPagingCreatorDTO getBoardList(BoardPagingDTO boardPaging) ;

}
