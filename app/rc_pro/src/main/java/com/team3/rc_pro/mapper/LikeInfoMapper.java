package com.team3.rc_pro.mapper;

import com.team3.rc_pro.domain.LikeInfoVO;

public interface LikeInfoMapper {

	public void insertLikeInfo(LikeInfoVO likeInfo);
	
	public void deleteLikeInfo(LikeInfoVO likeInfo);
	
	public int countLike(int post_id);
	
}
