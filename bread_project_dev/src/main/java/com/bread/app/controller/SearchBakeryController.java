package com.bread.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bread.app.common.FivePageNav;
import com.bread.app.vo.BakeryVO;
import com.bread.app.vo.SearchVO;
import com.bread.service.search.SearchService;

import lombok.Setter;

@Controller
@RequestMapping("/search")
public class SearchBakeryController {
	
		@Setter(onMethod_= {@Autowired})
		SearchService bkList, bkPage, bkTotalCount;
		@Setter(onMethod_= {@Autowired})
		FivePageNav pageNav;
	
		@GetMapping("/searchBakery.do")
		public String searchBakery(@ModelAttribute("sVO") SearchVO searchVO, Model model) {
			
			//pageNum이 0이면 1로 세팅, 처음 호출시 0이라서 오류 발생
			if(searchVO.getPageNum() == 0) {
				searchVO.setPageNum(1);
			}
			
			//빵집 목록 요청에 대해 처리할 수 있는 Service 클래스 이용
			List<BakeryVO> bakeryList = bkList.getBakerys(searchVO);
			model.addAttribute("bakeryList", bakeryList);
			
			pageNav.setTotalRows(bkTotalCount.getTotalCount(searchVO));
			
			pageNav = bkPage.setPageNav(pageNav, searchVO.getPageNum(), searchVO.getPageBlock());
			
			model.addAttribute("pageNav", pageNav);
			
			
			return "search/searchBakery";
		}
		
		@GetMapping("/viewBakery.do")
		public String viewBakery() {
			return "search/viewBakery";
		}

}
