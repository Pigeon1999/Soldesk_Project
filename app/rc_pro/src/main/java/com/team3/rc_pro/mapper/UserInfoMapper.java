package com.team3.rc_pro.mapper;

import java.util.List;

import com.team3.rc_pro.domain.UserInfoVO;

public interface UserInfoMapper {
	
	//회원 조회
	public UserInfoVO viewuserinfo(String user_id);
	
	//회원 등록	
	public void insertUserInfo(UserInfoVO userinfo);
	
	//회원 권한 추가
	public void insertAuthorityInfo(String user_id);
	
	//아이디 중복체크기능
	public Long iddupcheck(String user_id);
	
	//이메일 중복체크
	public Long emaildupcheck(String user_email);
	
	//주소 조회
	public UserInfoVO selectUserInfoAddress(String user_id);
	
	//아이디 찾기
	public String findUserid(UserInfoVO userinfo);
	
	//비밀번호 찾기
	public Long findUserpassword(UserInfoVO userinfo);
	
	//비밀번호 업데이트
	public void UpdateUserpw(UserInfoVO userinfo);
	
	//비밀번호 확인
	public String selectUserpassword(String user_id);
	
	//마이페이지 정보수정
	public void UpdateUserinfo(UserInfoVO userinfo);
	
	//회원번호 확인
	public Integer selectUsernum(String user_id);
	
	public List<UserInfoVO> selectUserInfo();
	
}

