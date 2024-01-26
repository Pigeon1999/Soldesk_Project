package com.team3.rc_pro.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.team3.rc_pro.domain.PostInfoVO;
import com.team3.rc_pro.mapper.PostInfoMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PostInfoServiceImpl implements PostInfoService {

	private PostInfoMapper postinfoMapper;
	
	@Override
	public List<PostInfoVO> getPostInfo() {
		log.info("PostInfoService.getFreePostInfo() 실행");
		return postinfoMapper.selectPost();
	}
	
	@Override 
	public void insertPost(PostInfoVO postInfo) {
		log.info("PostInfoService.insertPost() 실행");
		postinfoMapper.insertPost(postInfo);
	}
	
}
