package com.team3.rc_pro.service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.team3.rc_pro.domain.PostInfoVO;
import com.team3.rc_pro.domain.UserInfoVO;
import com.team3.rc_pro.mapper.PostInfoMapper;
import com.team3.rc_pro.mapper.UserInfoMapper;

@Service
public class SigninServiceImpl implements SigninService {
	
	private UserInfoMapper userinfoMapper;
	private PasswordEncoder pwencoder;
	private BCryptPasswordEncoder bcryBCryptPasswordEncoder;
	private PostInfoMapper postinfoMapper;
	
	public SigninServiceImpl(UserInfoMapper userinfoMapper,PasswordEncoder pwencoder,BCryptPasswordEncoder bcryBCryptPasswordEncoder,PostInfoMapper postinfoMapper) {
		this.userinfoMapper = userinfoMapper;
		this.pwencoder = pwencoder;
		this.bcryBCryptPasswordEncoder = bcryBCryptPasswordEncoder;
		this.postinfoMapper = postinfoMapper;
	}

	@Override
	public Long CheckUserid(String userid) {
		return userinfoMapper.iddupcheck(userid);
	}
	
	@Override
	public boolean SigninUser(UserInfoVO userinfo) {
		
		userinfo.setUser_passwd(pwencoder.encode(userinfo.getUser_passwd()));
		userinfoMapper.insertUserInfo(userinfo);
		userinfoMapper.insertAuthorityInfo(userinfo.getUser_id()); 
		return true;
	}
	@Override
	public Long CheckUseremail(String user_email) {
		return userinfoMapper.emaildupcheck(user_email);
	}

	@Override
	public String FindUserid(UserInfoVO userinfo) {
		return userinfoMapper.findUserid(userinfo);
	}

	@Override
	public boolean FindUserpw(UserInfoVO userinfo) {
		if(userinfoMapper.findUserpassword(userinfo) == 0) {
			return false;
		}else{
			return true;
		}
	
	}
	
	@Override
	public void setUserpw(UserInfoVO userinfo) {
		userinfo.setUser_passwd(pwencoder.encode(userinfo.getUser_passwd()));
		userinfoMapper.UpdateUserpw(userinfo);
	}
	
	@Override
	public UserInfoVO viewmyinfo(String user_id) {
		return userinfoMapper.viewuserinfo(user_id);
	}

	@Override
	public boolean myinfomodify(UserInfoVO userinfo) {
		userinfo.setUser_passwd(pwencoder.encode(userinfo.getUser_passwd()));
		userinfoMapper.UpdateUserinfo(userinfo);
		return true;
	}
	
	@Override
	public boolean CheckUserpasswd(String user_id,String user_passwd) {
		String user_passwd1 = userinfoMapper.selectUserpassword(user_id);
		boolean myresult = bcryBCryptPasswordEncoder.matches(user_passwd, user_passwd1);;
		return myresult;
	}
	
	@Override
	public List<PostInfoVO> viewpostinfo(String user_id,String sortmenu) {
		Integer user_num = userinfoMapper.selectUsernum(user_id);
		List<PostInfoVO> postinfolist = null;
		if(sortmenu.equals("post_view")) {
			postinfolist = postinfoMapper.selectPostinfo_view(user_num);
		}
		else if(sortmenu.equals("post_date")) {
			postinfolist = postinfoMapper.selectPostinfo_date(user_num);
		}else {
			postinfolist = postinfoMapper.selectPostinfo(user_num);
		}
		return postinfolist;
	}
	
	@Override
	public List<PostInfoVO> viewscrapeinfo(String user_id,String sortmenu){
		Integer user_num = userinfoMapper.selectUsernum(user_id);
		List<PostInfoVO> scrapelist = null;
		if(sortmenu.equals("post_view")) {
			scrapelist = postinfoMapper.selectPostinfo2_view(user_num);
		}
		else if(sortmenu.equals("post_date")) {
			scrapelist = postinfoMapper.selectPostinfo2_date(user_num);
		}else {
			scrapelist = postinfoMapper.selectPostinfo2(user_num);
		}
		System.out.println("viewscrapeinfo scrapelist : "+scrapelist);
		return scrapelist;
	}
	
	
}
