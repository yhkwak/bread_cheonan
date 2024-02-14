package com.bread.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		return "main";
	}
	
	@GetMapping("/main.do")
	public String home2() {
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
