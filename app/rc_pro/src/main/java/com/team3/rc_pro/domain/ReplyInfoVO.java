package com.team3.rc_pro.domain;

import java.sql.Date;
import lombok.Data;

@Data
public class ReplyInfoVO {

	private int reply_id;
	private int user_num;
	private int reply_group;
	private int post_id;
	private String reply_content;
	private Date reply_regdate;
	private Date reply_moddate;
	private int reply_like;
	
}
