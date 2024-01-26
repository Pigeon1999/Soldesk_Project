package com.test3.rc_pro.mapper02;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team3.rc_pro.mapper.PostInfoMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")
@Log4j
public class PostInfoMapperTest {

	@Setter(onMethod_ = @Autowired)
	private PostInfoMapper postinfomapper;
	
	@Test 
	public void testSelectPostlist() {
		log.info(postinfomapper.selectPost());
	}
	
}
