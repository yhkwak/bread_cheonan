package com.bread.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bread.app.vo.BakeryVO;
import com.bread.service.bakery.BakeryService;

import lombok.Setter;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Setter(onMethod_={@Autowired})
	BakeryService bakeryJoin, bakeryUpdate, bakeryGet;
	
	
	@GetMapping("/shopinfo.do")
	public String shopinfo(int member_idx, HttpServletRequest request) {
		
		String viewPage = "mypage/shopinfo";
		BakeryVO bakeryVO = bakeryGet.bakeryGet(member_idx);
		HttpSession session = request.getSession();
		session.setAttribute("bakery", bakeryVO);
		return viewPage;
	}

	@PostMapping("/joinProcess.do")
	public String joinProcess(BakeryVO bakeryVO, HttpServletRequest request) {
	//회원가입 양식에서 전달된 입력값을 받을 수 있도록 커맨드 객체를 정의함
    //커맨드 객체: 폼의 name과 같은 필드를 가지고 set메소드를 정의하고 있어야 함 - VO클래스
		String viewPage = "mypage/shopinfo.do";//가게정보 등록 실패 시 JSP페이지
		
		if(bakeryJoin.join(bakeryVO)==1) { 
			HttpSession session = request.getSession();
			session.setAttribute("bakery", bakeryVO);
			viewPage = "redirect:/main.do";
		}
		
		return viewPage;
	}
	
	@PostMapping("/updateProcess.do")
	public String updateProcess(BakeryVO bakeryVO , HttpServletRequest request, Model model) {
		
		String viewPage = "mypage/shopinfo";
		
		
		BakeryVO newBakeryVO = bakeryUpdate.update(bakeryVO);
		
		if(newBakeryVO != null) { 
			HttpSession session = request.getSession();
			session.removeAttribute("bakery");
			session.setAttribute("bakery", newBakeryVO);
			viewPage = "redirect:/main.do";
		}else {
			model.addAttribute("msg", "가게정보 변경에 실패 하였습니다.");
		}
		return viewPage;
	}
}
