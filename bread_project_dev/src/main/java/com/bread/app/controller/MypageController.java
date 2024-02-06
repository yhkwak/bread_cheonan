package com.bread.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bread.app.vo.MemberVO;
import com.bread.service.member.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Setter(onMethod_= {@Autowired})
	MemberService mUpdate;
	//회원정보 페이지 이동
	@GetMapping("/update.do")
	public String update() {
		return "mypage/update";
	}
	
	@PostMapping("/updateProcess.do")
	public String updateProcess(MemberVO memberVO, HttpServletRequest request, Model model) {
		
		String viewPage = "member/update"; // 변경 실패시 페이지
		MemberVO newVO = mUpdate.update(memberVO);
		
		if (newVO != null) { // 로그인 성공시 세션으로 객체저장
			HttpSession session = request.getSession();
			session.removeAttribute("member");
			session.setAttribute("member", newVO);
			viewPage = "redirect:/main.do"; // 메인페이지 재요청
		} else { // 로그인 실패 시
			model.addAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다");
		}
		
		return viewPage;
	}
}
