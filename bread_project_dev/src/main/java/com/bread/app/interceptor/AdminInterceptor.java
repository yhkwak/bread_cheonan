package com.bread.app.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.bread.app.vo.MemberVO;

public class AdminInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean result = true; //Controller로 사용자 요청이 전달되게 하는 반환값
		
		//사용자가 로그인 한 상태이면 HttpSessioin(세션)객체에 MemberVO 객체가 속성으로 저장되어 있음
		//사용자의 세션 객체를 얻는 방법: request.getSession()
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		if(memberVO.getGrade() != 2) {//로그인이 안된 경우
			response.sendRedirect(request.getContextPath());
			result = false;//Controller로 사용자 요청이 전달되지 못하게 하는 반환값
		}
		
		return result;
	}

}
