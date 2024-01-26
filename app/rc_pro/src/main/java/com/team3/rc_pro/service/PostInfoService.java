package com.team3.rc_pro.service;

import java.util.List;
import com.team3.rc_pro.domain.PostInfoVO;

public interface PostInfoService {

	public List<PostInfoVO> getPostInfo();
	
	public void insertPost(PostInfoVO postinfo);
}
