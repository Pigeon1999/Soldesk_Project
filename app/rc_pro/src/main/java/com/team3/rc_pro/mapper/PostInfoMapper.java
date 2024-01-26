package com.team3.rc_pro.mapper;

import java.util.List;
import com.team3.rc_pro.domain.PostInfoVO;

public interface PostInfoMapper {
	
	public List<PostInfoVO> selectPost();
	
	public void insertPost(PostInfoVO postinfo);
	
	public List<PostInfoVO> selectPostinfo(Integer user_num);
	
	public List<PostInfoVO> selectScrapeinfo(Integer user_num);
	
	public PostInfoVO selectPostinfo2(Integer post_id);
}
