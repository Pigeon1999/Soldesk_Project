package com.team3.rc_pro.service;

import org.springframework.stereotype.Service;

import com.team3.rc_pro.common.paging.domain.AdminBoardPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.AdminBoardPagingDTO;
import com.team3.rc_pro.common.paging.domain.AdminPagingCreatorDTO;
import com.team3.rc_pro.common.paging.domain.AdminPagingDTO;
import com.team3.rc_pro.domain.AuthorityInfoVO;
import com.team3.rc_pro.domain.BoardVO;
import com.team3.rc_pro.mapper.BoardListMapper;
import com.team3.rc_pro.mapper.UserInfoMapper;

@Service
public class AdminServiceImpl implements AdminService {

	private UserInfoMapper userInfoMapper ;
	
	private BoardListMapper boardlistMapper ;
	
	//모든 필드 초기화 생성자
	public AdminServiceImpl(UserInfoMapper userInfoMapper, BoardListMapper boardlistMapper) {
		this.userInfoMapper = userInfoMapper ;
		this.boardlistMapper = boardlistMapper ;
		System.out.println("AdminServiceImpl의 모든 필드 초기화생성자입니다.");
		System.out.println("UserInfoMapper: " + userInfoMapper);
	}
	
	//모든유저 목록조회
	@Override
	public AdminPagingCreatorDTO getAdminUserList(AdminPagingDTO adminPaging) {


		return new AdminPagingCreatorDTO(userInfoMapper.adminSelectRowTotal(adminPaging),
				adminPaging,
				userInfoMapper.adminViewUserinfo(adminPaging)) ;
		}
	
	//유저권한 수정
	@Override
	public boolean modifyUserAuth(AuthorityInfoVO authInfo) {
		int rows = userInfoMapper.updateUserAuth(authInfo) ;
		
		return (rows == 1) ;
	}
	
	//게시물 목록조회(READ)
	@Override 
	public AdminBoardPagingCreatorDTO getAdminBoardList(AdminBoardPagingDTO adminboardPaging) {


	return new AdminBoardPagingCreatorDTO(boardlistMapper.selectAdminRowTotal(adminboardPaging),
			adminboardPaging,
			boardlistMapper.selectAdminBoardList(adminboardPaging)) ;
	}

	@Override
	public boolean modifyBoardCategoryRegion(BoardVO board) {
		
		int rows = boardlistMapper.updateBoardCategoryRegion(board) ;
		
		return (rows == 1) ;
	}

	@Override
	public boolean modifyPosthide(long post_id) {
		
		int rows = boardlistMapper.updatePosthide(post_id) ;
		
		return (rows == 1) ;
	}
	
}
