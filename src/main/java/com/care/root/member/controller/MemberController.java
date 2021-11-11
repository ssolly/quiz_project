package com.care.root.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.common.MemberSessionName;
import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

@Controller
@RequestMapping("member")	//경로에 member를 앞에 넣어주기
public class MemberController implements MemberSessionName {
	
	@Autowired MemberService ms;

	@GetMapping("/login")	//controller의 requestMapping"member"로 인해 member/login으로 생성
	public String login() {
		System.out.println("멤버 로그인 연결");
		return "member/login";
	}
	
//	my version	
//	@PostMapping("/member/user_check")
//	public String successLogin(MemberDTO dto) {
//		if (ms.loginChk(dto.getId(),dto.getPw()) == 1) {
//			return "member/successLogin";
//		} else {
//			return "index";
//		}
//	}
	
	@PostMapping("/user_check")
	public String userCheck(@RequestParam String id, @RequestParam String pw, RedirectAttributes rs){
		int result = ms.userCheck(id,pw);
		if(result==0) {
			//성공일 때
			rs.addAttribute("id",id);	//jsp파일까지 연결가능, session을 만들기 위함
			return "redirect:successLogin";
		} else {
			//실패일 때
			return "redirect:login";
		}
	}
	
	@GetMapping("/successLogin")
	public String successLogin(@RequestParam String id, HttpSession session) {
		session.setAttribute(/*상속 받기 전 MemberSessionName.LOGIN*/ LOGIN, id);		//session 세팅
		return "member/successLogin";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		if(session.getAttribute(LOGIN)!=null) {
			session.invalidate();
		}
		return "redirect:/index";		// '/'로 최상위부터 연결
	}
	
	@GetMapping("memberInfo")
	public String memberInfo(Model model, HttpSession session) {	//jsp파일까지 전달해야하기 때문에 model 객체 사용
		if(session.getAttribute(LOGIN) != null) {
			ms.memberInfo(model);
			return "member/memberinfo";
		} 
		return "redirect:login";
		
	}
	
	@GetMapping("info")
	public String info(@RequestParam String id, Model model) {	//개인의 정보를 info.jsp로 넘겨주기 위한 model
		ms.info(model,id);
		return "member/info";
	}
	
	@GetMapping("register_form")
	public String registerForm() {
		return "member/register";
	}
	
	@PostMapping("register")
	public String register(MemberDTO dto) {
		int result = ms.register(dto);
		if(result==1) {	//회원가입성공
			return "redirect:login";
		}
		return "redirect:register_form";
	}
}
