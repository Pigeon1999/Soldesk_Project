package com.team3.rc_pro.mapper;

import java.util.List;
import com.team3.rc_pro.domain.PostInfoVO;

public interface PostInfoMapper {
	
	public List<PostInfoVO> selectPost();
	
	public void insertPost(PostInfoVO postinfo);
	
	public void updatePost(PostInfoVO postinfo);
	
	public List<PostInfoVO> selectPostinfo(Integer user_num);
		
	public List<PostInfoVO> selectPostinfo_view(Integer user_num);
	
	public List<PostInfoVO> selectPostinfo_date(Integer user_num);
	
	public List<PostInfoVO> selectScrapeinfo(Integer user_num);
	
	public List<PostInfoVO> selectPostinfo2(Integer user_num);
	
	public List<PostInfoVO> selectPostinfo2_date(Integer user_num);
	
	public List<PostInfoVO> selectPostinfo2_view(Integer user_num);
	
	public void countLike(PostInfoVO postinfo);

	public void countReply(PostInfoVO postinfo);
	
	public void countView(PostInfoVO postinfo);
	
	public void deletePost(PostInfoVO postinfo);
}
