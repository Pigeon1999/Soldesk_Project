package com.team3.rc_pro.mapper;

import java.util.List;

import com.team3.rc_pro.common.paging.domain.AdminBoardPagingDTO;
import com.team3.rc_pro.common.paging.domain.BoardPagingDTO;
import com.team3.rc_pro.domain.BoardVO;

public interface BoardListMapper {

//	//게시물 목록조회
//	public List<BoardVO> selectBoardList() ;

	//게시물 목록조회
	public List<BoardVO> selectBoardList(BoardPagingDTO boardPaging) ;

	//게시물 총수(READ)
	public long selectRowTotal(BoardPagingDTO myboardPaging) ;

	//게시물 목록조회(admin)
	public List<BoardVO> selectAdminBoardList(AdminBoardPagingDTO adminboardPaging) ;
	
	//게시물 총수(admin)
	public long selectAdminRowTotal(AdminBoardPagingDTO adminboardPaging) ;
	
	//게시물 카테고리,지역 업데이트(admin)
	public int updateBoardCategoryRegion(BoardVO board) ;
	
	//특정게시물 삭제 요청(admin)
	public int updatePosthide(long post_id) ;
//	//회원 아이디조회
//	public String selectUserId() ;

//	public Date selectSysdate() ;

}
