package com.care.root.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberMapper mapper;

	@Override
	public int userCheck(String id, String pw) {
		MemberDTO dto = mapper.userCheck(id);
		if (dto!=null) { //해당 아이디 존재
			if(pw.equals(dto.getPw())) { //로그인 성공
				return 0;
			}	//로그인 실패 : 비밀번호 다름
		}
		//로그인 실패
		return 1;
	}
	
	//myversion
//	@Override
//	public int loginChk(String id, String pw) {	
//		MemberDTO dto_mapper = mapper.loginChk(id);	
//		if(id.equals(dto_mapper.getId()) && pw.equals(dto_mapper.getPw())) {
//			return 1; 
//		} 
//		return 0;
//	}

	
}
