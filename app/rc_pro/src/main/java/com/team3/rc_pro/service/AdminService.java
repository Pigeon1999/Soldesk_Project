package com.team3.rc_pro.service;

import com.team3.rc_pro.common.paging.domain.AdminBoardPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.AdminBoardPagingDTO;
import com.team3.rc_pro.common.paging.domain.AdminPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.AdminPagingDTO;
import com.team3.rc_pro.domain.AuthorityInfoVO;
import com.team3.rc_pro.domain.BoardVO;

public interface AdminService {

	//유저 목록 리스트
	public AdminPagingCreatorDTO getAdminUserList(AdminPagingDTO adminPaging) ;
	
	//유저 권한 수정
	public boolean modifyUserAuth(AuthorityInfoVO authInfo) ;
	
	//어드민 게시판 페이지
	public AdminBoardPagingCreatorDTO getAdminBoardList(AdminBoardPagingDTO adminboardPaging) ;
	
	//게시글 삭제 요청
	public boolean modifyPosthide(long post_id) ;
	
}
