package com.care.root.member.service;

import org.springframework.ui.Model;

public interface MemberService {
	
	//myversion
	//public int loginChk(String id, String pw);
	
	public int userCheck(String id, String pw);
	public void memberInfo(Model model);
	public void info(Model model, String id);
	
}
