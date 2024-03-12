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

import com.bread.app.common.FivePageNav;
import com.bread.app.vo.ItemVO;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.ReviewVO;
import com.bread.service.Review.ReviewService;
import com.bread.service.order.OrderService;

import lombok.Setter;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Setter(onMethod_ = {@Autowired})
	ReviewService rList, rInsert, rView, rDelete, rViewCount, rPage, rTotalCount;
	@Setter(onMethod_= {@Autowired})
	FivePageNav pageNav;
	@Setter(onMethod_ = {@Autowired})
	OrderService oList;
	
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
	public String reviewWrite(PageVO vo, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();

		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			vo.setMember_idx(member.getMember_idx());
			List<ItemVO> writeList = oList.item(vo);
			 model.addAttribute("writeList", writeList);
		} else {
			return "redirect:/member/login.do";
		}

		return "review/reviewWrite";
	}

	@PostMapping("/reviewWriteProcess.do")
	public String writeProcess(ReviewVO vo, HttpServletRequest request) {
		
		String viewPage = "review/reviewWrite";
		int result = rInsert.insert(vo, request);
		if (result == 1) {
			viewPage = "redirect:review.do";
		}
		return viewPage;
	}

	@GetMapping("/delete.do")
	public String delete(int review_idx) {
		
		int result = rDelete.delete(review_idx);
		String viewPage = "review/view";
		if (result == 1) {
			viewPage = "redirect:/review/review.do";
		}
		return viewPage;
	}

}
