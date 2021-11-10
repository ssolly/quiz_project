package com.care.root.member.service;

import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;

public interface MemberService {
	
	//myversion
	//public int loginChk(String id, String pw);
	
	public int userCheck(String id, String pw);
	
}
