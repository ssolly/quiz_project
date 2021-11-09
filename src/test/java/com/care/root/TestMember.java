package com.care.root;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.care.root.member.controller.MemberController;
import com.care.root.member.service.MemberService;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations={"classpath:TestMember.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestMember {

	@Autowired MemberController mc;
	@Autowired MemberService ms;
	
	@Test
	public void testMc() {
		System.out.println("mc:"+mc);
		assertNotNull(mc);
	}
	
	@Test
	public void testMs() {
		assertNotNull(ms);
	}
}
