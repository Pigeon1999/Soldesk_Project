package com.team3.rc_pro.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PostInfoVO {
	private int post_id;
	private int category_id;
	private int region_id;
	private int user_num;
	private String post_title;
	private String post_content;
	private Date post_date;
	private int post_view;
	private int post_like;
	private int post_reply;
	private int post_hide;
	private String post_file;
}
