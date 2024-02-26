package com.bread.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//회원 목록 조회
	@GetMapping("/AdminMemManagement.do")
	public String adminMem(SearchVO vo, Model model) {
	
		//pageNum이 0이면 1로 세팅, 처음 호출시 0이라서 오류 발생
		if(vo.getPageNum() == 0) {
			vo.setPageNum(1);
		}
		
		//회원 목록 요청에 대해 처리할 수 있는 AdminMemListService 클래스 이용
		List<MemberVO> adminMem = aList.adminMem(vo);
		model.addAttribute("adminMem", adminMem);
		
		//페이징
		pageNav.setTotalRows(aTotalCount.getTotalCount(vo));
		pageNav = aPage.setPageNav(pageNav, vo.getPageNum(), vo.getPageBlock());
		model.addAttribute("pageNav", pageNav);

		return "admin/AdminMemManagement";
		
	}
	
	
	//회원정보 변경 처리 요청
	@PostMapping("/updateProcess.do")
	@ResponseBody
	public String updateMem(MemberVO memberVO, HttpServletRequest request) {
	    try {
	        // 클라이언트에서 전달된 회원 등급 값을 가져오기
	        int grade = Integer.parseInt(request.getParameter("grade"));
	        //vo에 변경된 등급 값 넣기
	        memberVO.setGrade(grade);
	        // 변경된 회원 정보를 서비스를 통해 업데이트
	        MemberVO updatedMember = aUpdate.updateMem(memberVO, request);
	        
	        if (updatedMember != null) {
	            return "업데이트 성공";
	        } else {
	            return "업데이트 실패";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "업데이트 실패";
	    }
	}
	
	//회원 탈퇴 처리 요청
	@ResponseBody
	public String deleteMem(int member_idx) {
		int result = aDel.deleteMem(member_idx);
		if(result >0) {
			return "탈퇴처리 성공";
		}else {
			return "탈퇴처리 실패";
		}
	}

}
	