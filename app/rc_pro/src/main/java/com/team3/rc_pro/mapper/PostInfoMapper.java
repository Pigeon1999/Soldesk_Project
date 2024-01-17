package com.team3.rc_pro.mapper;

import java.util.List;

import com.team3.rc_pro.domain.PostInfoVO;

public interface PostInfoMapper {
	
	public List<PostInfoVO> selectFreePost();
	
	public List<PostInfoVO> selectPromotionPost();
	
	public List<PostInfoVO> selectNewsPost();
}
