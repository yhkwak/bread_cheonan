package com.bread.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bread.app.common.TenPageNav;
import com.bread.app.vo.AdminProductVO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.SearchVO;
import com.bread.service.adminProduct.AdminProductService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
public class AdminProductController {
	
	@Setter(onMethod_ = {@Autowired})
	AdminProductService APList, APPage, APTotalCount, APView, APUpdate;
	@Setter(onMethod_= {@Autowired})
	TenPageNav pageNav;
	
	@GetMapping("/productManagement.do")
	public String productManagement(SearchVO searchVO ,PageVO pageVO, HttpServletRequest request, Model model) {
		
		if(searchVO.getPageNum() == 0) {
			searchVO.setPageNum(1);
		}
		
		List<AdminProductVO> adminProductList = APList.getBoards(searchVO);
		model.addAttribute("adminProductList", adminProductList);
		pageNav.setTotalRows(APTotalCount.getTotalCount(pageVO));
			
		pageNav = APPage.setPageNav(pageNav, pageVO.getPageNum(), pageVO.getPageBlock());
			
		model.addAttribute("pageNav", pageNav);

		return "admin/adminProductManagement";
	}
	
	@GetMapping("/adminProductUpdate.do")
	public String productUpdate(@RequestParam("bread_idx") int bread_idx, Model model) {
		AdminProductVO bread = APView.getBoard(bread_idx);
		model.addAttribute("bread", bread);
		return "admin/adminProductUpdate";
	}


	 @PostMapping("/adminProductUpdateProcess.do")
	 public String productUpdateProcess(AdminProductVO vo, HttpServletRequest request) {
	     int result = APUpdate.update(vo, request);
	     String viewPage = "admin/productUpdate";
	     if (result == 1) {
	         viewPage = "redirect:/admin/productManagement.do";
	     } 
	     return viewPage;
	 }
	 

	 
//	 @GetMapping("/productDelete.do") 
//	 public String delete(int bread_idx) {
//		 int result = bDelete.delete(bread_idx);
//		 String viewPage = "mypage/productUpdate";
//	 
//		 if (result == 1) { viewPage = "redirect:/mypage/productManagement.do"; }
//		 return viewPage; 
//		 }
//	 
}
