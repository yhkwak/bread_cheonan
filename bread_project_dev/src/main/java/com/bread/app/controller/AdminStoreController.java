package com.bread.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bread.app.common.TenPageNav;
import com.bread.app.vo.BakeryVO;
import com.bread.app.vo.SearchVO;
import com.bread.service.adminStore.AdminStoreService;

import lombok.Setter;

@Controller
@RequestMapping("/admin")
public class AdminStoreController {  //작업중
	@Setter(onMethod_={ @Autowired } )
	AdminStoreService asList, asDel, asPage, asTotalCount;
	
	@Setter(onMethod_={ @Autowired } )
	TenPageNav pageNav;
	
	//매장관리 목록
	@GetMapping("/AdminStoreManagement.do")
	public String adminStore(SearchVO vo, Model model) {

		//pageNum이 0이면 1로 세팅, 처음 호출시 0이라서 오류 발생
		if(vo.getPageNum() == 0) {
			vo.setPageNum(1);
		}

		//회원 목록 요청에 대해 처리할 수 있는 AdminMemListService 클래스 이용
		List<BakeryVO> adminStore = asList.adminStore(vo);
		model.addAttribute("adminStore", adminStore);

		//페이징
		pageNav.setTotalRows(asTotalCount.getTotalCount(vo));
		pageNav = asPage.setPageNav(pageNav, vo.getPageNum(), vo.getPageBlock());
		model.addAttribute("pageNav", pageNav);

		return "admin/AdminStoreManagement";
	}

	//매장 삭제 처리 요청
	@PostMapping("/updateStoreProcess.do")
	@ResponseBody
	public String deleteStore(int bakery_idx) {
		int result = asDel.deleteStore(bakery_idx);
		if(result >0) {
			return "탈퇴처리 성공";
		}else {
			return "탈퇴처리 실패";
		}
	}

}
	