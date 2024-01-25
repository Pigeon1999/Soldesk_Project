package com.team3.rc_pro.service;

import java.util.List;
import com.team3.rc_pro.domain.PostInfoVO;

public interface PostInfoService {

	public List<PostInfoVO> getFreePostInfo();
	
	public List<PostInfoVO> getPromotionPostInfo();
	
	public List<PostInfoVO> getNewsPostInfo();
	
	public void insertPost(PostInfoVO postinfo);
}
