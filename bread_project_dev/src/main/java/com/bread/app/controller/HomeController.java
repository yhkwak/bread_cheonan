package com.bread.app.controller;

import com.bread.app.vo.ReviewVO;
import com.bread.app.vo.SearchVO;
import com.bread.service.Review.ReviewService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {
	@Setter(onMethod_ = {@Autowired})
	ReviewService rList; // 후기 전체보기 서비스
	@GetMapping("/")
	public String home(Model model) {

/*
			List<ReviewVO> reviewList = rList.getBoards(searchVO); //후기리스트
			model.addAttribute("reviewList", reviewList);
*/
		List<ReviewVO> topReviews = rList.getTopReviews(); // 상위 리뷰 가져오기
		model.addAttribute("topReviews", topReviews); // 모델에 추가
			return "main";
	}
	
	@GetMapping("/main.do")
	public String home2(Model model) {
		List<ReviewVO> topReviews = rList.getTopReviews(); // 상위 리뷰 가져오기
		model.addAttribute("topReviews", topReviews); // 모델에 추가
		return "main";
	}
	
	@GetMapping("/info/info.do")
	public String info() {
		return "info/companyProfile";
	}
	@GetMapping("/info/accessterms.do")
	public String info2() {
		return "info/accessterms";
	}
	@GetMapping("/info/advertisement.do")
	public String info3() {
		return "info/advertisement";
	}
}
