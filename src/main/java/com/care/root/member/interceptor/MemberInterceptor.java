package com.care.root.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.care.root.common.MemberSessionName;

public class MemberInterceptor extends HandlerInterceptorAdapter implements MemberSessionName{
	//servlet-context.xml에서 bean으로 만들어줌

	@Override		//오버라이딩했기 때문에 부모가 가지고 있는 메소드 형태와 동일해야한다
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("index(컨트롤러) 실행 전 실행");
		
		//request를 이용해서 session을 얻어옴
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN)==null) {
			response.sendRedirect("login");
			return false;
		}		
		return true;	//요청한 페이지로 연결
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("index(컨트롤러) 실행 후 실행");
		
	}

}
