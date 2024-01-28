package com.team3.rc_pro.mapper;

import java.util.List;

import com.team3.rc_pro.domain.ReplyInfoVO;

public interface ReplyInfoMapper {

	// 조회
	public List<ReplyInfoVO> selectReplyInfo();
	
	// 삽입
	public void insertReplyInfo(ReplyInfoVO replyInfo); 
	
	//답글 삽입
	public void insertReplyGroupInfo(ReplyInfoVO replyInfo); 
	
	public int countReply(int post_id);

}
