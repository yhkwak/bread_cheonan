package com.bread.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bread.app.common.FivePageNav;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.OrderListVO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.ReviewVO;
import com.bread.service.Review.ReviewService;
import com.bread.service.order.OrderService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review")
public class ReviewController {

	@Setter(onMethod_ = {@Autowired})
	ReviewService rList, rInsert, rView, rUpdate, rDelete, rDownload, rViewCount, rPage, rTotalCount;
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
		 log.debug("Page number received={}", pageVO.getPageNum());
		
		return "review/review";
	}
	@GetMapping("/reviewWrite.do")
	public String reviewWrite(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			int member_idx = member.getMember_idx();
			List<OrderListVO> writeList = oList.orderList(member_idx);
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

	@GetMapping("/view.do")
	public String view(int review_idx, Model model) {
		rViewCount.increaseViewCount(review_idx);
		ReviewVO review = rView.getBoard(review_idx);
		model.addAttribute("review", review);
		return "review/reviewView";
	}

	@GetMapping("/reviewUpdate")
	public String update(int review_idx, Model model) {
		ReviewVO review = rView.getBoard(review_idx);

		model.addAttribute("review", review);

		return "review/reviewUpdate";
	}

	@PostMapping("/reviewUpdateProcess.do")
	public String updateProcess(ReviewVO vo, HttpServletRequest request) {

		String viewPage = "review/reviewUpdate";

		int result = rUpdate.update(vo, request);

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



	@GetMapping("/download.do")
	public void download(String originfile_name, String savefile_name,
						 HttpServletRequest request, HttpServletResponse response) {
		rDownload.download(originfile_name, savefile_name, request, response);
	}
}
