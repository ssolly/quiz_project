package com.care.root.member.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
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
	public String userCheck(@RequestParam String id, @RequestParam String pw, 
							@RequestParam(required=false) String autoLogin, RedirectAttributes rs){
							//check가 되어 있지 않으면 null값
		//System.out.println("autoLogin : " + autoLogin); 	// on ↔ null
		int result = ms.userCheck(id,pw);
		if(result==0) {
			//성공일 때
			rs.addAttribute("id",id);	//jsp파일까지 연결가능, session을 만들기 위함
			rs.addAttribute("autoLogin",autoLogin);	//로그인에 성공했다면 
			return "redirect:successLogin";
		} else {
			//실패일 때
			return "redirect:login";
		}
	}
	
	@GetMapping("/successLogin")
	public String successLogin(@RequestParam String id, @RequestParam(required=false) String autoLogin,
								HttpSession session, HttpServletResponse response/*쿠키:자동로그인*/) {
		System.out.println("id : " + id);
		System.out.println("autoLogin : " + autoLogin);
		session.setAttribute(/*상속 받기 전 MemberSessionName.LOGIN*/ LOGIN, id);		//session 세팅
		
		if(autoLogin != null) { //사용자가 자동로그인을 체크했다면
			int limitTime = 60*60*24*90;	//90일
			Cookie loginCookie = new Cookie("loginCookie",session.getId()); //value:session.getId() id값이 유일한 값이기 떄문
			loginCookie.setPath("/");
			loginCookie.setMaxAge(limitTime);
			response.addCookie(loginCookie);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());	//java.util.Date
			cal.add(Calendar.MONTH, 3);	//3개월후로 세팅
			java.sql.Date limitDate = new java.sql.Date(cal.getTimeInMillis());		//util.Date -> sql.Date로 변환
			
			ms.keepLogin(session.getId(),limitDate,id);	//DB로 연결해주는 서비스
		}
		return "member/successLogin";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response, 
		/*자동로그인 해제를 위한*/ @CookieValue(value="loginCookie",required=false) Cookie loginCookie) {
		
		if(session.getAttribute(LOGIN)!=null) {
			if(loginCookie != null) {
				loginCookie.setMaxAge(0);			//시간을 0으로 세팅 -> 소멸
				response.addCookie(loginCookie);	//사용자에게 쿠키 전달
				ms.keepLogin("nan", new java.sql.Date(System.currentTimeMillis()), (String)session.getAttribute(LOGIN));	
				//nan : db의 cookie값의 default값, 									↑session값
			}
			session.invalidate();
		}
		return "redirect:/index";		// '/'로 최상위부터 연결
	}
	
	@GetMapping("memberInfo")
	public String memberInfo(Model model, HttpSession session) {	//jsp파일까지 전달해야하기 때문에 model 객체 사용
		//if(session.getAttribute(LOGIN) != null) {	//인터셉터 사용하기 전 컨트롤러에서 세션 확인
			ms.memberInfo(model);
			return "member/memberinfo";
		//} 
		//return "redirect:login";
		
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
