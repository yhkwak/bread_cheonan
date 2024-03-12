package com.bread.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bread.service.Review.ReviewService;

import lombok.Setter;

@Controller
public class HomeController {
	@Setter(onMethod_ = {@Autowired})
	ReviewService rList; // 후기 전체보기 서비스
	@GetMapping("/")
	public String home(Model model) {
	return "main";
	}
	@GetMapping("/main.do")
	public String home2(Model model) {
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
	@GetMapping("/info/faq.do")
	public String info4() {
		return "info/faq";
	}
}
