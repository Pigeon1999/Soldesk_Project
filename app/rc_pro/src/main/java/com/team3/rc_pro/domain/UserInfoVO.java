package com.team3.rc_pro.domain;

import java.util.List;
import java.util.Date;
import lombok.Data;

@Data
public class UserInfoVO {
	
	private int user_num;
	private String user_name;
	private String user_birth;
	private String user_pn;
	private String user_address;
	private String user_email;
	private String user_id;
	private String user_passwd;
	private Date user_regdate;
	
	private List<AuthorityInfoVO> authorityList;
	
}
