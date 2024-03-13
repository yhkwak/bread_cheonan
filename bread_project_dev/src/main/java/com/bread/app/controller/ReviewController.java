package com.bread.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bread.app.common.FivePageNav;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.ReviewVO;
import com.bread.service.Review.ReviewService;
import com.bread.service.bread.BreadService;

import lombok.Setter;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Setter(onMethod_ = {@Autowired})
	ReviewService rList, rInsert, rDelete, rViewCount, rPage, rTotalCount, sUpdate;
	@Setter(onMethod_= {@Autowired})
	FivePageNav pageNav;
	@Setter(onMethod_= {@Autowired})
	BreadService bView;
	
	@GetMapping("/review.do")
	public String review(PageVO pageVO, Model model) {

		// pageNum이 0이면 1로 세팅, 처음 호출시 0이라서 오류 발생
		if (pageVO.getPageNum() == 0) {
			pageVO.setPageNum(1);
		}
		
		List<ReviewVO> reviewList = rList.getBoards(pageVO);
		model.addAttribute("reviewList", reviewList);
		pageNav.setTotalRows(rTotalCount.getTotalCount(pageVO));
		pageNav = rPage.setPageNav(pageNav, pageVO.getPageNum(), pageVO.getPageBlock());
		model.addAttribute("pageNav", pageNav);
		
		return "review/review";
	}
	
	@GetMapping("/reviewWrite.do")
	public String reviewWrite(ReviewVO vo, Model model) {
		
		vo.setBread_name(bView.getBoard(vo.getBread_idx()).getBread_name());
		
		model.addAttribute("write", vo);

		return "review/reviewWrite";
	}

	@PostMapping("/reviewWriteProcess.do")
	public String writeProcess(ReviewVO vo, HttpServletRequest request) {
		
		String viewPage = "review/reviewWrite";
		int result = rInsert.insert(vo, request);
		sUpdate.Updatestatus(vo);
		if (result == 1) {
			viewPage = "redirect:review.do";
		}
		return viewPage;
	}
	


}
