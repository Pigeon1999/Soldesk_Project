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
	public List<PostInfoVO> getFreePostInfo() {
		log.info("PostInfoService.getFreePostInfo() 실행");
		return postinfoMapper.selectFreePost();
	}
	
	@Override
	public List<PostInfoVO> getPromotionPostInfo() {
		log.info("PostInfoService.getPromotionPostInfo() 실행");
		return postinfoMapper.selectPromotionPost();
	}
	
	@Override
	public List<PostInfoVO> getNewsPostInfo() {
		log.info("PostInfoService.getNewsPostInfo() 실행");
		return postinfoMapper.selectNewsPost();
	}
	
}
