package com.bread.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bread.app.common.TenPageNav;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.SearchVO;
import com.bread.service.adminMembership.AdminMemService;

import lombok.Setter;

@Controller
@RequestMapping("/admin")
public class AdminMemController {  //작업중
	@Setter(onMethod_={ @Autowired } )
	AdminMemService aList, aUpdate, aDel, aPage, aTotalCount;
	
	@Setter(onMethod_={ @Autowired } )
	TenPageNav pageNav;
	
	//페이징
	@GetMapping("/AdminMemManagement.do")
	public String adminMem(SearchVO vo, Model model) {
	
		//pageNum이 0이면 1로 세팅, 처음 호출시 0이라서 오류 발생
		if(vo.getPageNum() == 0) {
			vo.setPageNum(1);
		}
		
		//회원 목록 요청에 대해 처리할 수 있는 AdminMemListService 클래스 이용
		List<MemberVO> adminMem = aList.adminMem(vo);
		model.addAttribute("adminMem", adminMem);
		
		System.out.println("[테스트] : " + adminMem.size());

		//페이징
		pageNav.setTotalRows(aTotalCount.getTotalCount(vo));
		pageNav = aPage.setPageNav(pageNav, vo.getPageNum(), vo.getPageBlock());
		model.addAttribute("pageNav", pageNav);
		
		return "admin/AdminMemManagement";
	}
	
	
	//회원정보 변경 처리 요청
	@PostMapping("/adminMemUpdate.do")
	public String adminMemUpdate(MemberVO memberVO, HttpServletRequest request, Model model) {
			
		String viewPage = "admin/AdminMemManagement";//회원정보 변경 실패 시 JSP페이지
		
		//AdminMemUpdateService클래스를 이용한 회원등급 처리
		MemberVO newVO = aUpdate.adminMemUpdate(memberVO, request);
		
		if(newVO != null) { //회원정보 변경 성공 시
			//세션 객체에 기존 회원정보 객체를 삭제하고 새로운 회원정보 객체를 저장함
			HttpSession session = request.getSession();
			session.removeAttribute("member");//기존의 회원정보 객체 삭제
			session.setAttribute("member", newVO);//새로운 회원정보 객체 저장
			viewPage = "admin/AdminMemManagement.do";//메인 페이지를 재요청함
			
		}else {//회원정보 변경 실패 시
			model.addAttribute("msg", "시스템 오류로 회원정보 변경이 이루어지지 않았습니다.");
		}
		
		return viewPage;
	}
	
	
	//계정삭제 처리 요청
	@GetMapping("/adminMemDel.do")
	public String adminMemDel(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		int member_idx = vo.getMember_idx();
		
		String viewPage = "admin/AdminMemManagement";//계정삭제 실패시 JSP페이지
		
		//AdminMemDelService클래스를 이용한 계정삭제 처리
		if(aDel.adminMemDel(member_idx) == 1) {
			session.invalidate(); //세션 초기화
			viewPage = "admin/AdminMemManagement.do";
		}
		
		return viewPage;
	}
}