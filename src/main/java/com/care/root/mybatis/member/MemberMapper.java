package com.care.root.mybatis.member;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.care.root.member.dto.MemberDTO;

@Repository
public interface MemberMapper {
	public MemberDTO loginChk(String id);
}
