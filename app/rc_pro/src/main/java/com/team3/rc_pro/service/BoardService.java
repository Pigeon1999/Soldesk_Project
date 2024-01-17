package com.team3.rc_pro.service;

import java.util.List;

import com.team3.rc_pro.common.paging.domain.BoardPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.BoardPagingDTO;
import com.team3.rc_pro.domain.BoardVO;

public interface BoardService {

//	public List<BoardVO> getBoardList() ;

	public BoardPagingCreatorDTO getBoardList(BoardPagingDTO boardPaging) ;

}
